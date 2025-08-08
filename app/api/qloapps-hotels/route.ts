// pages/api/qloapps-hotels.js
import { XMLParser } from 'fast-xml-parser';

export default async function handler(req, res) {
  console.log('qloapps-hotels endpoint called');
  
  const apiKey = process.env.QLOAPPS_API_KEY;
  const apiUrl = process.env.QLOAPPS_API_URL;

  if (!apiKey || !apiUrl) {
    return res.status(500).json({ 
      error: 'Missing QloApps API configuration. Please set QLOAPPS_API_KEY and QLOAPPS_API_URL environment variables.' 
    });
  }

  try {
    // Fetch hotels from QloApps API
    const url = `${apiUrl.replace(/\/$/, '')}/hotels?ws_key=${apiKey}`;
    console.log('Fetching hotels from:', url);
    
    const response = await fetch(url);
    const xmlText = await response.text();
    
    if (!response.ok) {
      console.error('QloApps API error:', response.status, xmlText);
      return res.status(response.status).json({ 
        error: 'Failed to fetch hotels from QloApps', 
        details: xmlText 
      });
    }

    // Parse XML to JSON
    const parser = new XMLParser({
      ignoreAttributes: false,
      attributeNamePrefix: "@_"
    });
    
    const jsonData = parser.parse(xmlText);
    console.log('Parsed data structure:', Object.keys(jsonData));
    console.log('Full parsed data:', JSON.stringify(jsonData, null, 2));

    // Extract hotel IDs from the parsed data
    const hotelsData = jsonData.qloapps?.hotels?.hotel || [];
    const hotelIds = Array.isArray(hotelsData) ? hotelsData : [hotelsData];
    console.log(`Found ${hotelIds.length} hotel IDs:`, hotelIds);
    console.log('Hotel data structure:', JSON.stringify(hotelIds, null, 2));

    // Fetch detailed information for each hotel
    const mappedHotels = await Promise.all(
      hotelIds.map(async (hotelRef) => {
        try {
          const hotelId = hotelRef['@_id'];
          const hotelDetailUrl = `${apiUrl.replace(/\/$/, '')}/hotels/${hotelId}?ws_key=${apiKey}`;
          console.log(`Fetching details for hotel ${hotelId}:`, hotelDetailUrl);
          
          const hotelResponse = await fetch(hotelDetailUrl);
          const hotelXmlText = await hotelResponse.text();
          
          if (!hotelResponse.ok) {
            console.error(`Failed to fetch hotel ${hotelRef.id}:`, hotelResponse.status);
            return null;
          }

          const hotelData = parser.parse(hotelXmlText);
          const hotel = hotelData.qloapps?.hotel;
          
          if (!hotel) {
            console.error(`No hotel data found for ID ${hotelRef.id}`);
            return null;
          }

          console.log(`Hotel ${hotelRef.id} details:`, hotel);

          // Helper function to safely extract text from nested objects
          const extractText = (value) => {
            if (typeof value === 'string') return value;
            if (value && typeof value === 'object') {
              // Handle language elements with text content
              if (value.language && typeof value.language === 'string') return value.language;
              if (value.language && value.language['#text']) return value.language['#text'];
              if (value['#text']) return value['#text'];
              if (value.text) return value.text;
              if (value.id) return value.id;
              return JSON.stringify(value);
            }
            return '';
          };

          return {
            id: hotel.id,
            name: extractText(hotel.hotel_name) || 'Hotel',
            location: extractText(hotel.city) || 'Location',
            price: parseFloat(hotel.price) || 0,
            image: hotel.id_default_image ? `${apiUrl}/images/hotels/${hotel.id}/${hotel.id_default_image}?ws_key=${apiKey}` : "/placeholder.svg?height=200&width=300",
            amenities: [], // You can fetch amenities separately if needed
            description: extractText(hotel.short_description) || 'Hotel description',
            address: extractText(hotel.address) || '',
            city: extractText(hotel.city) || '',
            country: extractText(hotel.country) || ''
          };
        } catch (error) {
          console.error(`Error fetching hotel ${hotelRef.id}:`, error);
          return null;
        }
      })
    );

    // Filter out any null results (failed fetches)
    const validHotels = mappedHotels.filter(hotel => hotel !== null);

    console.log(`Successfully mapped ${validHotels.length} hotels`);
    res.status(200).json({ hotels: validHotels });
    
  } catch (error) {
    console.error('Error in qloapps-hotels API:', error);
    res.status(500).json({ 
      error: 'Internal server error', 
      details: error.message 
    });
  }
} 