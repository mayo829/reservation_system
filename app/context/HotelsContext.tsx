"use client"

import { createContext, useContext, useState, useEffect, ReactNode } from "react"
import { XMLParser } from 'fast-xml-parser'

export interface Hotel {
  id: string
  name: string
  location: string
  price: number
  image: string
  amenities: string[]
  description: string
  address: string
  city: string
  country: string
}

interface HotelsContextType {
  hotels: Hotel[]
  isLoading: boolean
  error: string | null
  refetchHotels: () => void
}

const HotelsContext = createContext<HotelsContextType | undefined>(undefined)

export function HotelsProvider({ children }: { children: ReactNode }) {
  const [hotels, setHotels] = useState<Hotel[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Helper function to extract text from language objects
  const extractLanguageText = (languageObj: any, defaultText = ''): string => {
    if (!languageObj) return defaultText;
    
    // If it's already a string, return it
    if (typeof languageObj === 'string') return languageObj;
    
    // If it has a language array, get the first one or find English
    if (languageObj.language && Array.isArray(languageObj.language)) {
      const languages = languageObj.language;
      
      // Try to find English first (ID 1 is usually English)
      const englishLang = languages.find(lang => 
        lang['@_id'] === '1' || lang['@_id'] === 1
      );
      if (englishLang && englishLang['#text']) {
        return englishLang['#text'];
      }
      
      // Fall back to first language with text
      const firstLang = languages.find(lang => lang['#text']);
      if (firstLang && firstLang['#text']) {
        return firstLang['#text'];
      }
    }
    
    // If it's a single language object
    if (languageObj['#text']) {
      return languageObj['#text'];
    }
    
    return defaultText;
  };

  // Helper function to safely extract text from nested objects (fallback)
  const extractText = (value: any, defaultText = '') => {
    if (typeof value === 'string') return value
    if (value && typeof value === 'object') {
      if (value.language && typeof value.language === 'string') return value.language
      if (value.language && value.language['#text']) return value.language['#text']
      if (value['#text']) return value['#text']
      if (value.text) return value.text
      if (value.id) return value.id
      return defaultText
    }
    return defaultText
  }

  const fetchHotels = async () => {
    const apiKey = process.env.NEXT_PUBLIC_QLOAPPS_API_KEY
    const apiUrl = process.env.NEXT_PUBLIC_QLOAPPS_API_URL

    try {
      setIsLoading(true)
      setError(null)

      // Fetch hotels from QloApps API
      const url = `${apiUrl}/hotels?ws_key=${apiKey}`
      console.log('Fetching hotels from:', url)
      
      const response = await fetch(url)
      const xmlText = await response.text()

      if (!response.ok) {
        throw new Error(`Failed to fetch hotels: ${response.status}`)
      }

      // Parse XML to JSON
      const parser = new XMLParser({
        ignoreAttributes: false,
        attributeNamePrefix: "@_"
      })
      
      const jsonData = parser.parse(xmlText)
      console.log('Parsed data structure:', Object.keys(jsonData))

      // Extract hotel IDs from the parsed data
      const hotelsData = jsonData.qloapps?.hotels?.hotel || []
      const hotelIds = Array.isArray(hotelsData) ? hotelsData : [hotelsData]
      console.log(`Found ${hotelIds.length} hotel IDs:`, hotelIds)

      // Fetch detailed information for each hotel
      const mappedHotels = await Promise.all(
        hotelIds.map(async (hotelRef) => {
          try {
            const hotelId = hotelRef['@_id']
            const hotelDetailUrl = `${apiUrl}/hotels/${hotelId}?ws_key=${apiKey}`
            console.log(`Fetching details for hotel ${hotelId}:`, hotelDetailUrl)
            
            const hotelResponse = await fetch(hotelDetailUrl)
            const hotelXmlText = await hotelResponse.text()
            
            if (!hotelResponse.ok) {
              console.error(`Failed to fetch hotel ${hotelId}:`, hotelResponse.status)
              return null
            }

            const hotelData = parser.parse(hotelXmlText)
            const hotel = hotelData.qloapps?.hotel
            
            if (!hotel) {
              console.error(`No hotel data found for ID ${hotelId}`)
              return null
            }

            // Extract hotel name and other details using the language-aware function
            const hotelName = extractLanguageText(hotel.hotel_name, `Hotel ${hotelId}`)
            const hotelDescription = extractLanguageText(hotel.description, 'Hotel description')
            const hotelShortDescription = extractLanguageText(hotel.short_description, '')
            
            console.log(`Hotel ${hotelName} details:`, hotel)

            return {
              id: hotel.id.toString(),
              name: hotelName,
              location: `${hotel.city || 'Unknown City'}${hotel.address ? `, ${hotel.address}` : ''}`,
              price: parseFloat(hotel.price) || 0,
              image: hotel.id_default_image ? `${apiUrl}/images/hotels/${hotel.id}/${hotel.id_default_image?.['#text']}?ws_key=${apiKey}` : "/placeholder.svg?height=200&width=300",
              amenities: [],
              associations: hotel.associations,
              description: hotelShortDescription || hotelDescription,
              address: hotel.address || '',
              city: hotel.city || '',
              country: extractText(hotel.country, '')
            }
          } catch (error) {
            console.error(`Error fetching hotel ${hotelRef['@_id']}:`, error)
            return null
          }
        })
      )

      // Filter out any null results (failed fetches)
      const validHotels = mappedHotels.filter((hotel): hotel is Hotel => hotel !== null)
      console.log(`Successfully mapped ${validHotels.length} hotels:`, validHotels.map(h => h.name))
      
      setHotels(validHotels)
    } catch (error) {
      console.error('Error in hotels fetch:', error)
      setError(error instanceof Error ? error.message : 'Failed to fetch hotels')
    } finally {
      setIsLoading(false)
    }
  }

  // Fetch hotels on component mount
  useEffect(() => {
    fetchHotels()
  }, [])

  return (
    <HotelsContext.Provider value={{
      hotels,
      isLoading,
      error,
      refetchHotels: fetchHotels
    }}>
      {children}
    </HotelsContext.Provider>
  )
}

export function useHotels() {
  const context = useContext(HotelsContext)
  if (context === undefined) {
    throw new Error('useHotels must be used within a HotelsProvider')
  }
  return context
}