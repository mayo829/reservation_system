"use client"

import { useState, useEffect, useCallback, Suspense } from "react"
import { useSearchParams } from "next/navigation"
import { useCart } from "../context/CartContext"
import { useHotels } from "../context/HotelsContext"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { MapPin, Star, Wifi, Car, Coffee, Waves, CheckCircle, Mail, Phone } from "lucide-react"
import { format } from "date-fns"
import { DatePicker } from '@/app/components/DatePicker';
import { extractLanguageText, extractText } from "@/app/lib/textHelpers";
import Image from "next/image"

// Simulate availability when API is not accessible
const simulateAvailability = (roomId: string | number, checkIn: Date, checkOut: Date) => {
  // Create a deterministic "availability" based on room ID and dates
  const roomIdNum = typeof roomId === 'string' ? parseInt(roomId) || 1 : roomId
  const dayOfYear = Math.floor((checkIn.getTime() - new Date(checkIn.getFullYear(), 0, 0).getTime()) / (1000 * 60 * 60 * 24))
  const nights = Math.ceil((checkOut.getTime() - checkIn.getTime()) / (1000 * 60 * 60 * 24))
  
  // Simulate some logic: 
  // - Peak times (summer months, weekends) have lower availability
  // - Longer stays have higher chance of availability
  // - Different room types have different availability patterns
  const isWeekend = checkIn.getDay() === 5 || checkIn.getDay() === 6 // Friday or Saturday
  const isSummerMonth = checkIn.getMonth() >= 5 && checkIn.getMonth() <= 8 // June-September
  const isPeakTime = isWeekend || isSummerMonth
  
  let baseAvailability = 0.8 // 80% base availability
  
  // Adjust based on factors
  if (isPeakTime) baseAvailability -= 0.3
  if (nights >= 5) baseAvailability += 0.1 // Longer stays more likely to be available
  if (roomIdNum % 3 === 0) baseAvailability -= 0.2 // Some room types are more popular
  
  // Create pseudo-random but deterministic result
  const seed = (roomIdNum * dayOfYear * nights) % 100
  const isAvailable = (seed / 100) < baseAvailability
  
  if (isAvailable) {
    // Calculate available rooms (1-4)
    const maxRooms = 3 + (roomIdNum % 3)
    const bookedRooms = Math.floor((seed % 60) / 20) // 0-2 booked rooms
    const availableCount = Math.max(1, maxRooms - bookedRooms)
    
    return {
      available: true,
      count: availableCount
    }
  } else {
    return {
      available: false,
      count: 0
    }
  }
}

// Separate component that uses useSearchParams
function BookingForm() {
  const [selectedHotel, setSelectedHotel] = useState("")
  const [checkIn, setCheckIn] = useState<Date>()
  const [checkOut, setCheckOut] = useState<Date>()
  const [adults, setAdults] = useState("1")
  const [children, setChildren] = useState("0")
  const [rooms, setRooms] = useState("1")
  const [firstName, setFirstName] = useState("")
  const [lastName, setLastName] = useState("")
  const [email, setEmail] = useState("")
  const [phone, setPhone] = useState("")
  const [requests, setRequests] = useState("")
  const [isBooked, setIsBooked] = useState(false)
  const [confirmationNumber, setConfirmationNumber] = useState("")
  const [availableRooms, setAvailableRooms] = useState<any[]>([])
  const [isCheckingAvailability, setIsCheckingAvailability] = useState(false)
  const [hasCheckedAvailability, setHasCheckedAvailability] = useState(false)
  const [selectedRoom, setSelectedRoom] = useState<any>(null)

  const searchParams = useSearchParams()
  const { addToCart } = useCart()
  const { hotels, isLoading, error } = useHotels()

  // Pre-populate form with URL parameters
  useEffect(() => {
    const hotel = searchParams.get('hotel')
    const checkInParam = searchParams.get('checkIn')
    const checkOutParam = searchParams.get('checkOut')
    const adultsParam = searchParams.get('adults')
    const childrenParam = searchParams.get('children')

    console.log('URL Params:', { hotel, checkInParam, checkOutParam, adultsParam, childrenParam })
    console.log('Available hotels:', hotels.map(h => ({ id: h.id, name: h.name })))

    // Fix: Keep as string to match hotel IDs
    if (hotel) setSelectedHotel(hotel)
    if (checkInParam) setCheckIn(new Date(checkInParam))
    if (checkOutParam) setCheckOut(new Date(checkOutParam))
    if (adultsParam) setAdults(adultsParam)
    if (childrenParam) setChildren(childrenParam)
  }, [searchParams, hotels])

  // Reset availability check state when hotel changes
  useEffect(() => {
    console.log('Hotel selection changed, resetting availability check state')
    setHasCheckedAvailability(false)
    setAvailableRooms([])
    setSelectedRoom(null)
  }, [selectedHotel])

  // Auto-check availability when hotel and dates are selected
  useEffect(() => {
    if (selectedHotel && checkIn && checkOut && hotels.length > 0 && !hasCheckedAvailability) {
      console.log('Auto-checking availability for:', selectedHotel)
      handleCheckAvailability()
    }
  }, [selectedHotel, checkIn, checkOut, hotels.length, hasCheckedAvailability])

  // Also reset when dates change significantly
  useEffect(() => {
    if (hasCheckedAvailability && (checkIn || checkOut)) {
      console.log('Dates changed, resetting availability check state')
      setHasCheckedAvailability(false)
      setAvailableRooms([])
      setSelectedRoom(null)
    }
  }, [checkIn, checkOut])

  const selectedHotelData = hotels.find((hotel) => hotel.id === selectedHotel)

  const calculateNights = () => {
    if (checkIn && checkOut) {
      const diffTime = Math.abs(checkOut.getTime() - checkIn.getTime())
      return Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    }
    return 0
  }

  const calculateTotal = () => {
    if (selectedHotelData && checkIn && checkOut) {
      const nights = calculateNights()
      const roomCount = Number.parseInt(rooms)
      const pricePerNight = selectedRoom ? selectedRoom.price : selectedHotelData.price
      return pricePerNight * nights * roomCount
    }
    return 0
  }

  const handleCheckAvailability = async () => {
    if (!selectedHotel || !checkIn || !checkOut) return
    
    const currentHotelData = hotels.find((hotel) => hotel.id === selectedHotel)
    console.log("selectedHotelData in function:", currentHotelData)
  
    if (!currentHotelData) return
  
    setIsCheckingAvailability(true)
  
    try {
      // Extract room type references from the hotel data
      let rooms = []
      
      if (currentHotelData.associations?.room_types?.room_types) {
        let roomTypeRefs = currentHotelData.associations.room_types.room_types
        
        // Handle different response structures - ensure we have an array
        if (!Array.isArray(roomTypeRefs)) {
          // If it's a single object, wrap it in an array
          if (typeof roomTypeRefs === 'object' && roomTypeRefs !== null) {
            roomTypeRefs = [roomTypeRefs]
          } else {
            console.log("Invalid room_types structure:", roomTypeRefs)
            roomTypeRefs = []
          }
        }
        
        console.log("Processing room type refs:", roomTypeRefs)
        
        // Fetch details for each room type
        const roomPromises = roomTypeRefs.map(async (roomRef) => {
          try {
            // Handle different reference structures
            let roomTypeUrl
            let roomId
            
            if (roomRef['@_xlink:href']) {
              roomTypeUrl = roomRef['@_xlink:href']
              roomId = roomRef.id || roomRef['@_id'] || 'unknown'
            } else if (roomRef.href) {
              roomTypeUrl = roomRef.href
              roomId = roomRef.id || 'unknown'
            } else if (roomRef.url) {
              roomTypeUrl = roomRef.url
              roomId = roomRef.id || 'unknown'
            } else {
              console.error("No valid URL found in room reference:", roomRef)
              return null
            }
            
            const apiKey = process.env.NEXT_PUBLIC_QLOAPPS_API_KEY

            if (roomTypeUrl.startsWith('http://')) {
              roomTypeUrl = roomTypeUrl.replace('http://', 'https://');
              console.log(`Replaced ${roomId} to: ${roomTypeUrl}`);
            } else {
              console.log(`DID NOT Replaced ${roomId} to: ${roomTypeUrl}`);
            }
            
            console.log(`Fetching room type from: ${roomTypeUrl}?ws_key=${apiKey}`)
            
            const response = await fetch(`${roomTypeUrl}?ws_key=${apiKey}`)
            if (!response.ok) {
              console.error(`Failed to fetch room type ${roomId}:`, response.status)
              return null
            }
            
            const responseText = await response.text()
            console.log(`Room type ${roomId} response:`, responseText.substring(0, 200) + "...")
            
            // Parse XML response
            const { XMLParser } = await import('fast-xml-parser')
            const parser = new XMLParser({
              ignoreAttributes: false,
              attributeNamePrefix: "@_"
            })
            
            const roomData = parser.parse(responseText)
            const roomType = roomData.qloapps?.room_type
            
            if (!roomType) {
              console.error(`No room type data found for ${roomId}`)
              return null
            }
            
            // Extract amenities from room features
            const amenities = ['Free WiFi', 'Air Conditioning'] // Default amenities
            if (roomType.associations?.room_type_features?.room_type_feature) {
              const features = Array.isArray(roomType.associations.room_type_features.room_type_feature)
                ? roomType.associations.room_type_features.room_type_feature
                : [roomType.associations.room_type_features.room_type_feature]
              
              // Add more specific amenities based on features (customize as needed)
              if (features.length > 0) {
                amenities.push('Room Service', 'Mini Bar')
              }
            }
            
            // Handle image URL safely
            let imageUrl = "/placeholder.svg?height=200&width=300"
            try {
              if (roomType.associations?.images?.image) {
                const images = Array.isArray(roomType.associations.images.image)
                  ? roomType.associations.images.image
                  : [roomType.associations.images.image]
                
                if (images[0] && images[0]['@_xlink:href']) {
                  imageUrl = `${images[0]['@_xlink:href']}?ws_key=${apiKey}`
                }
              }
            } catch (imageError) {
              console.warn("Error processing image for room:", roomId, imageError)
            }
            
            // Handle room availability safely
            let availableCount = 1
            try {
              if (roomType.associations?.hotel_rooms?.hotel_room) {
                const hotelRooms = Array.isArray(roomType.associations.hotel_rooms.hotel_room)
                  ? roomType.associations.hotel_rooms.hotel_room
                  : [roomType.associations.hotel_rooms.hotel_room]
                availableCount = hotelRooms.length
              }
            } catch (availabilityError) {
              console.warn("Error processing availability for room:", roomId, availabilityError)
            }
            
            // Check availability for selected dates
            let dateAvailability = { available: false, count: 0 }
            try {
              if (checkIn && checkOut) {
                dateAvailability = await checkRoomAvailabilityForDates(
                  roomType.id || roomId, 
                  currentHotelData.id,
                  checkIn, 
                  checkOut
                )
              }
            } catch (availError) {
              console.warn("Error checking date availability for room:", roomId, availError)
              // Default to available if check fails
              dateAvailability = { available: true, count: Math.min(availableCount, 2) }
            }

            return {
              id: roomType.id || roomId,
              type: extractLanguageText(roomType.name, `Room Type ${roomId}`),
              price: parseFloat(roomType.price) || currentHotelData.price || 100,
              capacity: `${parseInt(extractText(roomType.adults)) || 2} Adults, ${parseInt(extractText(roomType.children)) || 2} Children`,
              image: imageUrl,
              amenities: amenities,
              available: dateAvailability.count,
              isAvailableForDates: dateAvailability.available,
              totalRooms: availableCount,
              description: extractLanguageText(roomType.description_short) || extractLanguageText(roomType.description) || 'Comfortable room with modern amenities'
            }
            
          } catch (error) {
            console.error(`Error fetching room type ${roomRef.id || 'unknown'}:`, error)
            return null
          }
        })
        
        // Wait for all room type fetches to complete
        const roomResults = await Promise.all(roomPromises)
        rooms = roomResults.filter(room => room !== null)
      }
  
      // Fallback to mock rooms if no room types found or all failed
      if (rooms.length === 0) {
        console.log("No rooms found from API, using fallback rooms")
        
        // For fallback rooms, also check availability
        const fallbackRooms = [
          {
            id: 1,
            type: "Deluxe Suite",
            price: currentHotelData.price || 400,
            capacity: "2 Adults, 2 Children",
            amenities: ["King Bed", "City View", "Mini Bar", "Free WiFi"],
            totalRooms: 3,
            image: "/placeholder.svg?height=200&width=300",
            description: "Luxurious suite with stunning city views and premium amenities"
          },
          {
            id: 2,
            type: "Standard Room",
            price: (currentHotelData.price || 400) * 0.7,
            capacity: "2 Adults, 1 Child",
            amenities: ["Queen Bed", "Free WiFi", "Air Conditioning"],
            totalRooms: 5,
            image: "/placeholder.svg?height=200&width=300",
            description: "Comfortable standard room with essential amenities"
          }
        ]

        // Check availability for fallback rooms
        for (let room of fallbackRooms) {
          try {
            if (checkIn && checkOut) {
              const dateAvailability = await checkRoomAvailabilityForDates(
                room.id, 
                currentHotelData.id,
                checkIn, 
                checkOut
              )
              room.available = dateAvailability.count
              room.isAvailableForDates = dateAvailability.available
            } else {
              room.available = room.totalRooms
              room.isAvailableForDates = true
            }
          } catch (error) {
            console.warn("Error checking fallback room availability:", room.id, error)
            // Default to available if check fails
            room.available = Math.min(room.totalRooms, 2)
            room.isAvailableForDates = true
          }
        }

        rooms = fallbackRooms
      }
  
      console.log("Processed rooms:", rooms)
      setAvailableRooms(rooms)
      
    } catch (error) {
      console.error('Error processing room availability:', error)
      
      // Fallback on error
      setAvailableRooms([
        {
          id: 1,
          type: "Standard Room",
          price: currentHotelData.price || 400,
          capacity: "2 Adults, 2 Children",
          amenities: ["Free WiFi", "Air Conditioning"],
          available: checkIn && checkOut ? 2 : 3, // Simulate availability based on dates
          isAvailableForDates: checkIn && checkOut ? Math.random() > 0.3 : true, // 70% chance available
          totalRooms: 3,
          image: "/placeholder.svg?height=200&width=300",
          description: "Comfortable room with modern amenities"
        }
      ])
    } finally {
      setHasCheckedAvailability(true)
      setIsCheckingAvailability(false)
    }
  }

  const handleAddToCart = () => {
    if (!selectedHotelData || !selectedRoom || !checkIn || !checkOut) return

    const cartItem = {
      id: `booking-${Date.now()}`,
      hotelName: selectedHotelData.name,
      location: selectedHotelData.location,
      roomType: selectedRoom.type,
      checkIn: checkIn,
      checkOut: checkOut,
      nights: calculateNights(),
      adults: parseInt(adults),
      children: parseInt(children),
      pricePerNight: selectedRoom.price,
      totalPrice: calculateTotal(),
      image: selectedHotelData.image
    }
    
    addToCart(cartItem)
  }

  const isFormValid = () => {
    return selectedHotel && checkIn && checkOut && selectedRoom && selectedRoom.isAvailableForDates
  }

  // Loading state
  if (isLoading) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-cyan-400 mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading hotels...</p>
        </div>
      </div>
    )
  }

  // Error state
  if (error) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center max-w-md">
          <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <CheckCircle className="w-8 h-8 text-red-500" />
          </div>
          <h2 className="text-2xl font-medium text-gray-900 mb-2">Unable to Load Hotels</h2>
          <p className="text-gray-600 mb-4">{error}</p>
          <Button 
            onClick={() => window.location.reload()} 
            className="bg-cyan-400 hover:bg-cyan-500 text-white"
          >
            Try Again
          </Button>
        </div>
      </div>
    )
  }

  // Booking Confirmation View
  if (isBooked) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16">
        <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
          <div className="container mx-auto px-6">
            <div className="max-w-4xl mx-auto">
              {/* Success Header */}
              <div className="text-center mb-12">
                <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                  <CheckCircle className="w-10 h-10 text-cyan-400" />
                </div>
                <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
                  Booking <span className="font-medium text-cyan-400">Confirmed!</span>
                </h1>
                <p className="text-xl text-gray-600">
                  Thank you for choosing Lisboa Hotels. Your reservation has been successfully confirmed.
                </p>
              </div>

              {/* Confirmation Details */}
              <div className="grid lg:grid-cols-2 gap-8">
                <Card className="border-0 shadow-sm">
                  <CardHeader>
                    <CardTitle className="text-2xl font-light flex items-center gap-2">
                      <CheckCircle className="w-6 h-6 text-cyan-400" />
                      Reservation Details
                    </CardTitle>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="bg-cyan-50/50 p-4 rounded-lg">
                      <p className="text-sm text-gray-600 mb-1">Confirmation Number</p>
                      <p className="text-2xl font-bold text-gray-900">{confirmationNumber}</p>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Guest Name</p>
                        <p className="font-medium">
                          {firstName} {lastName}
                        </p>
                      </div>
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Total Amount</p>
                        <p className="font-medium">${calculateTotal().toLocaleString()}</p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Check-in</p>
                        <p className="font-medium">{checkIn && format(checkIn, "PPP")}</p>
                      </div>
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Check-out</p>
                        <p className="font-medium">{checkOut && format(checkOut, "PPP")}</p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Adults</p>
                        <p className="font-medium">
                          {adults} {adults === "1" ? "Adult" : "Adults"}
                        </p>
                      </div>
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Children</p>
                        <p className="font-medium">
                          {children === "0" ? "No Children" : `${children} ${children === "1" ? "Child" : "Children"}`}
                        </p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Rooms</p>
                        <p className="font-medium">
                          {rooms} {rooms === "1" ? "Room" : "Rooms"}
                        </p>
                      </div>
                    </div>

                    <div>
                      <p className="text-sm text-gray-600 mb-1">Nights</p>
                      <p className="font-medium">
                        {calculateNights()} {calculateNights() === 1 ? "Night" : "Nights"}
                      </p>
                    </div>

                    {requests && (
                      <div>
                        <p className="text-sm text-gray-600 mb-1">Special Requests</p>
                        <p className="font-medium text-sm">{requests}</p>
                      </div>
                    )}
                  </CardContent>
                </Card>

                {/* Hotel Information */}
                {selectedHotelData && (
                  <Card className="border-0 shadow-sm">
                    <CardContent className="p-0">
                      <div className="relative h-48">
                        <Image
                          src={selectedHotelData.image || "/placeholder.svg"}
                          alt={selectedHotelData.name}
                          fill
                          className="object-cover rounded-t-lg"
                        />
                      </div>
                      <div className="p-6">
                        <h3 className="text-xl font-medium text-gray-900 mb-2">{selectedHotelData.name}</h3>
                        <p className="text-gray-600 mb-4 flex items-center gap-1">
                          <MapPin className="w-4 h-4" />
                          {selectedHotelData.location}
                        </p>
                        <p className="text-gray-600 mb-4">{selectedHotelData.description}</p>
                        <div className="flex flex-wrap gap-2">
                          {selectedHotelData.amenities.map((amenity, index) => (
                            <span key={index} className="text-xs bg-gray-100 px-2 py-1 rounded-full">
                              {amenity}
                            </span>
                          ))}
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                )}
              </div>

              {/* Next Steps */}
              <Card className="border-0 shadow-sm mt-8">
                <CardHeader>
                  <CardTitle className="text-2xl font-light">What's Next?</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="grid md:grid-cols-3 gap-6">
                    <div className="text-center">
                      <Mail className="w-8 h-8 text-cyan-400 mx-auto mb-3" />
                      <h4 className="font-medium text-gray-900 mb-2">Confirmation Email</h4>
                      <p className="text-sm text-gray-600">A detailed confirmation email has been sent to {email}</p>
                    </div>
                    <div className="text-center">
                      <Phone className="w-8 h-8 text-cyan-400 mx-auto mb-3" />
                      <h4 className="font-medium text-gray-900 mb-2">24/7 Support</h4>
                      <p className="text-sm text-gray-600">Need help? Call us at +1 (555) 123-4567 anytime</p>
                    </div>
                    <div className="text-center">
                      <CheckCircle className="w-8 h-8 text-cyan-400 mx-auto mb-3" />
                      <h4 className="font-medium text-gray-900 mb-2">Check-in Ready</h4>
                      <p className="text-sm text-gray-600">Present your confirmation number at check-in</p>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Action Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 justify-center mt-8">
                <Button
                  onClick={() => setIsBooked(false)}
                  variant="outline"
                  className="border-gray-300 text-gray-700 hover:bg-gray-50 px-8 py-3 rounded-full"
                >
                  Make Another Booking
                </Button>
                <Button
                  onClick={() => window.print()}
                  className="bg-cyan-400 hover:bg-cyan-500 text-white px-8 py-3 rounded-full"
                >
                  Print Confirmation
                </Button>
              </div>
            </div>
          </div>
        </section>
      </div>
    )
  }

  // Original Booking Form View
  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
            Book Your <span className="font-medium text-cyan-400">Stay</span>
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Choose from our collection of premium properties and create unforgettable memories at Lisboa Hotels.
          </p>
        </div>
      </section>

      <section className="py-12 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="grid lg:grid-cols-3 gap-8">
            {/* Booking Form */}
            <div className="lg:col-span-2">
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-2xl font-light">Reservation Details</CardTitle>
                </CardHeader>
                <CardContent className="space-y-6">
                  {/* Hotel Selection */}
                  <div className="space-y-2">
                    <Label htmlFor="hotel">Select Hotel Location</Label>
                    <Select value={selectedHotel} onValueChange={setSelectedHotel}>
                      <SelectTrigger>
                        <SelectValue placeholder="Choose your preferred location" />
                      </SelectTrigger>
                      <SelectContent>
                        {hotels.map((hotel) => (
                          <SelectItem key={hotel.id} value={hotel.id}>
                            <div className="flex items-center gap-2">
                              <MapPin className="w-4 h-4" />
                              {hotel.name} - {hotel.city}
                            </div>
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>

                  {/* Date Selection - Using Reusable DatePicker Component */}
                  <DatePicker
                    checkIn={checkIn}
                    checkOut={checkOut}
                    onCheckInChange={setCheckIn}
                    onCheckOutChange={setCheckOut}
                    layout="horizontal"
                    showLabels={true}
                    hotelId={selectedHotel}
                    adults={parseInt(adults)}
                    children={parseInt(children)}
                  />

                  {/* Adults and Children */}
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="adults">Number of Adults</Label>
                      <Select value={adults} onValueChange={setAdults}>
                        <SelectTrigger>
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="1">1 Adult</SelectItem>
                          <SelectItem value="2">2 Adults</SelectItem>
                          <SelectItem value="3">3 Adults</SelectItem>
                          <SelectItem value="4">4 Adults</SelectItem>
                          <SelectItem value="5">5+ Adults</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="children">Number of Children</Label>
                      <Select value={children} onValueChange={setChildren}>
                        <SelectTrigger>
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="0">No Children</SelectItem>
                          <SelectItem value="1">1 Child</SelectItem>
                          <SelectItem value="2">2 Children</SelectItem>
                          <SelectItem value="3">3 Children</SelectItem>
                          <SelectItem value="4">4+ Children</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                  </div>

                  {/* Show loading indicator while checking availability */}
                  {isCheckingAvailability && (
                    <div className="text-center py-8">
                      <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-cyan-400 mx-auto mb-4"></div>
                      <p className="text-gray-600">Checking room availability...</p>
                    </div>
                  )}

                  {/* Available Rooms */}
                  {selectedHotel && checkIn && checkOut && !isCheckingAvailability && availableRooms.length > 0 && (
                    <div className="space-y-3">
                      <h3 className="text-lg font-medium text-gray-900">Available Rooms</h3>
                      {availableRooms.map((room) => (
                        <Card
                          key={room.id}
                          className={`border transition-colors overflow-hidden ${
                            !room.isAvailableForDates
                              ? 'border-red-200 bg-red-50/10'
                              : selectedRoom?.id === room.id 
                              ? 'border-cyan-400 bg-cyan-50/20' 
                              : 'border-gray-200 hover:border-cyan-300'
                          }`}
                        >
                          <CardContent className="p-0 relative">
                            {/* Background Image */}
                            <div 
                              className="absolute inset-0 bg-cover bg-center bg-no-repeat opacity-50"
                              style={{
                                backgroundImage: `url(${room.image})`,
                              }}
                            />
                            {/* Overlay for readability */}
                            <div className="absolute inset-0 bg-black bg-opacity-60" />
                            
                            {/* Content */}
                            <div className="relative z-10 p-4 text-white">
                              <div className="flex justify-between items-start mb-2">
                                <h4 className="font-medium text-white">{room.type}</h4>
                                <div className="text-right">
                                  <p className="text-lg font-medium text-white">${room.price}/night</p>
                                  {room.isAvailableForDates ? (
                                    <p className="text-sm text-green-400 font-medium">
                                      {room.available} available
                                    </p>
                                  ) : (
                                    <p className="text-sm text-red-400 font-medium">
                                      Not Available For Selected Dates
                                    </p>
                                  )}
                                </div>
                              </div>
                              <p className="text-sm text-gray-200 mb-2">Capacity: {room.capacity}</p>
                              <div className="flex flex-wrap gap-1 mb-3">
                                {room.amenities.map((amenity, index) => (
                                  <span key={index} className="text-xs bg-white bg-opacity-20 text-white px-2 py-1 rounded backdrop-blur-sm">
                                    {amenity}
                                  </span>
                                ))}
                              </div>
                              <div className="flex gap-2">
                                <Button
                                  size="sm"
                                  className={`flex-1 rounded-full text-white ${
                                    !room.isAvailableForDates
                                      ? 'bg-gray-500 hover:bg-gray-600 cursor-not-allowed opacity-60'
                                      : selectedRoom?.id === room.id
                                      ? 'bg-green-500 hover:bg-green-600'
                                      : 'bg-cyan-400 hover:bg-cyan-500'
                                  }`}
                                  disabled={!room.isAvailableForDates}
                                  onClick={() => {
                                    if (room.isAvailableForDates) {
                                      setSelectedRoom(room)
                                      console.log('Selected room:', room.id, 'Price:', room.price, 'Image: ', room.image)
                                    }
                                  }}
                                >
                                  {!room.isAvailableForDates 
                                    ? 'Unavailable' 
                                    : selectedRoom?.id === room.id 
                                    ? 'Selected' 
                                    : 'Select This Room'
                                  }
                                </Button>
                                <Button
                                  size="sm"
                                  variant="outline"
                                  className="flex-1 bg-white bg-opacity-10 hover:bg-white hover:bg-opacity-20 text-white border-white border-opacity-30 rounded-full"
                                  onClick={() => {
                                    const roomSlug = room.type.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
                                    window.open(`/rooms/${roomSlug}?hotelId=${selectedHotelData?.id}&roomId=${room.id}`, '_blank');
                                  }}
                                >
                                  View Room
                                </Button>
                              </div>
                            </div>
                          </CardContent>
                        </Card>
                      ))}
                    </div>
                  )}
                </CardContent>
              </Card>
            </div>

            {/* Booking Summary */}
            <div className="space-y-6">
              {/* Selected Hotel Preview */}
              {selectedHotelData && (
                <Card className="border-0 shadow-sm">
                  <CardContent className="p-0">
                    <div className="relative h-48">
                      <Image
                        src={selectedHotelData.image || "/placeholder.svg"}
                        alt={selectedHotelData.name}
                        fill
                        className="object-cover rounded-t-lg"
                      />
                    </div>
                    <div className="p-6">
                      <h3 className="text-xl font-medium text-gray-900 mb-2">{selectedHotelData.name}</h3>
                      <p className="text-gray-600 mb-4">{selectedHotelData.description}</p>
                      <div className="flex items-center gap-4 text-sm text-gray-500">
                        {selectedHotelData.amenities.slice(0, 2).map((amenity, index) => (
                          <div key={index} className="flex items-center gap-1">
                            {amenity === "Free WiFi" && <Wifi className="w-4 h-4" />}
                            {amenity === "Parking" && <Car className="w-4 h-4" />}
                            {amenity === "Restaurant" && <Coffee className="w-4 h-4" />}
                            {amenity === "Beach Access" && <Waves className="w-4 h-4" />}
                            {amenity === "Spa" && <Star className="w-4 h-4" />}
                            <span>{amenity}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  </CardContent>
                </Card>
              )}

              {/* Booking Summary */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light">Booking Summary</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  {selectedHotelData && checkIn && checkOut ? (
                    <>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Hotel</span>
                        <span className="font-medium">{selectedHotelData.name}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Room Type</span>
                        <span className={`font-medium ${selectedRoom ? 'text-gray-900' : 'text-red-500'}`}>
                          {selectedRoom ? selectedRoom.type : 'Please select a room'}
                        </span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Dates</span>
                        <span className="font-medium">
                          {format(checkIn, "MMM dd")} - {format(checkOut, "MMM dd")}
                        </span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Nights</span>
                        <span className="font-medium">{calculateNights()}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Rooms</span>
                        <span className="font-medium">{rooms}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-600">Guests</span>
                        <span className="font-medium">
                          {adults} {adults === "1" ? "Adult" : "Adults"}
                          {children !== "0" && `, ${children} ${children === "1" ? "Child" : "Children"}`}
                        </span>
                      </div>
                      <div className="border-t pt-4">
                        <div className="flex justify-between text-lg font-medium">
                          <span>Total</span>
                          <span>${calculateTotal().toLocaleString()}</span>
                        </div>
                      </div>
                      <Button
                        className="w-full bg-cyan-400 hover:bg-cyan-500 text-white rounded-full py-3 disabled:opacity-50 disabled:cursor-not-allowed"
                        onClick={handleAddToCart}
                        disabled={!isFormValid()}
                      >
                        Add to Cart
                      </Button>
                      {!isFormValid() && (
                        <p className="text-sm text-gray-500 text-center">
                          {!selectedRoom 
                            ? 'Please select an available room to continue' 
                            : !selectedRoom.isAvailableForDates
                            ? 'Selected room is not available for these dates'
                            : 'Please select hotel and dates to continue'
                          }
                        </p>
                      )}
                    </>
                  ) : (
                    <p className="text-gray-500 text-center py-8">
                      Please select a hotel and dates to see booking summary
                    </p>
                  )}
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}

// Loading fallback
function BookingLoading() {
  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
      <div className="text-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-cyan-400 mx-auto mb-4"></div>
        <p className="text-lg text-gray-600">Loading booking details...</p>
      </div>
    </div>
  )
}

// Main page component with Suspense
export default function BookingPage() {
  return (
    <Suspense fallback={<BookingLoading />}>
      <BookingForm />
    </Suspense>
  )
}