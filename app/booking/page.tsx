"use client"

import { useState, useEffect } from "react"
import { useSearchParams } from "next/navigation"
import { useCart } from "../context/CartContext"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { Calendar } from "@/components/ui/calendar"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { CalendarIcon, MapPin, Star, Wifi, Car, Coffee, Waves, CheckCircle, Mail, Phone } from "lucide-react"
import { format } from "date-fns"
import { XMLParser } from 'fast-xml-parser';
import Image from "next/image"

const defaultHotels = [
  {
    id: "manhattan",
    name: "Lisboa Hotels Manhattan",
    location: "New York, USA",
    price: 450,
    image: "/nyc.jpg?height=200&width=300",
    amenities: ["Free WiFi", "Parking", "Restaurant", "Gym"],
    description: "Luxury in the heart of Manhattan with stunning city views.",
  },
  {
    id: "malibu",
    name: "Lisboa Hotels Malibu",
    location: "California, USA",
    price: 650,
    image: "/placeholder.svg?height=200&width=300",
    amenities: ["Beach Access", "Spa", "Restaurant", "Pool"],
    description: "Beachfront luxury with direct access to pristine beaches.",
  },
  {
    id: "aspen",
    name: "Lisboa Hotels Aspen",
    location: "Colorado, USA",
    price: 550,
    image: "/placeholder.svg?height=200&width=300",
    amenities: ["Ski Access", "Spa", "Restaurant", "Fireplace"],
    description: "Mountain retreat with world-class skiing and spa facilities.",
  },
  {
    id: "miami",
    name: "Lisboa Hotels Miami Beach",
    location: "Florida, USA",
    price: 400,
    image: "/placeholder.svg?height=200&width=300",
    amenities: ["Beach Access", "Pool", "Restaurant", "Nightlife"],
    description: "Art Deco elegance steps from South Beach.",
  },
]

export default function BookingPage() {
  const [selectedHotel, setSelectedHotel] = useState("")
  const [checkIn, setCheckIn] = useState<Date>()
  const [checkOut, setCheckOut] = useState<Date>()
  const [hotels, setHotels] = useState(defaultHotels)
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

  // Pre-populate form with URL parameters
  useEffect(() => {
    const hotel = searchParams.get('hotel')
    const checkInParam = searchParams.get('checkIn')
    const checkOutParam = searchParams.get('checkOut')
    const adultsParam = searchParams.get('adults')
    const childrenParam = searchParams.get('children')

    if (hotel) setSelectedHotel(hotel)
    if (checkInParam) setCheckIn(new Date(checkInParam))
    if (checkOutParam) setCheckOut(new Date(checkOutParam))
    if (adultsParam) setAdults(adultsParam)
    if (childrenParam) setChildren(childrenParam)
  }, [searchParams])

  // Auto-check availability when hotel and dates are selected
  useEffect(() => {
    if (selectedHotel && checkIn && checkOut && !hasCheckedAvailability) {
      handleCheckAvailability()
    }
  }, [selectedHotel, checkIn, checkOut])

  const selectedHotelData = hotels.find((hotel) => hotel.id === selectedHotel)

  // Fetch hotels from QloApps API on component mount
  useEffect(() => {
    const fetchHotels = async () => {
      // const apiKey = process.env.QLOAPPS_API_KEY;
      // const apiUrl = process.env.QLOAPPS_API_URL;

      const apiKey = 'BPLZZ875W56IHUSI2CZF21X4UXM2SCGD';
      const apiUrl = 'http://localhost/qloapps/api';

      try {
        // Fetch hotels from QloApps API
        const url = `${apiUrl}/hotels?ws_key=${apiKey}`;
        console.log('Fetching hotels from:', url);
        
        const response = await fetch(url);
        const xmlText = await response.text();
        


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

              console.log(`Hotel ${extractText(hotel.hotel_name)} details:`, hotel);

              return {
                id: hotel.id,
                name: extractText(hotel.hotel_name) || 'Hotel',
                location: extractText(hotel.city) || 'Location',
                price: parseFloat(hotel.price) || 0,
                image: hotel.id_default_image ? `${apiUrl}/images/hotels/${hotel.id}/${hotel.id_default_image?.['#text']}?ws_key=${apiKey}` : "/placeholder.svg?height=200&width=300",
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

        setHotels(validHotels);
        
      } catch (error) {
        console.error('Error in qloapps-hotels API:', error);
      }
    };

    fetchHotels();
  }, []);

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

    setIsCheckingAvailability(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 1500))

    // Mock available rooms data
    const mockRooms = [
      {
        id: 1,
        type: "Deluxe Suite",
        price: selectedHotelData?.price || 400,
        capacity: "2 Adults, 2 Children",
        amenities: ["King Bed", "City View", "Mini Bar", "Free WiFi"],
        available: 3,
      },
      {
        id: 2,
        type: "Premium Suite",
        price: (selectedHotelData?.price || 400) + 100,
        capacity: "3 Adults, 2 Children",
        amenities: ["King Bed + Sofa Bed", "Ocean View", "Balcony", "Room Service"],
        available: 2,
      },
      {
        id: 3,
        type: "Family Suite",
        price: (selectedHotelData?.price || 400) + 200,
        capacity: "4 Adults, 3 Children",
        amenities: ["2 Bedrooms", "Living Area", "Kitchenette", "Balcony"],
        available: 1,
      },
    ]

    setAvailableRooms(mockRooms)
    setHasCheckedAvailability(true)
    setIsCheckingAvailability(false)
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
    return selectedHotel && checkIn && checkOut && selectedRoom
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
                  Thank you for choosing SpiceHotels. Your reservation has been successfully confirmed.
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
            Choose from our collection of premium properties and create unforgettable memories at SpiceHotels.
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
                              {hotel.name} - {hotel.location}
                            </div>
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>

                  {/* Date Selection */}
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label>Check-in Date</Label>
                      <Popover>
                        <PopoverTrigger asChild>
                          <Button
                            variant="outline"
                            className="w-full justify-start text-left font-normal bg-transparent"
                          >
                            <CalendarIcon className="mr-2 h-4 w-4" />
                            {checkIn ? format(checkIn, "PPP") : "Select date"}
                          </Button>
                        </PopoverTrigger>
                        <PopoverContent className="w-auto p-0">
                          <Calendar 
                            mode="single" 
                            selected={checkIn} 
                            onSelect={setCheckIn} 
                            initialFocus
                            disabled={(date) => date < new Date(new Date().setHours(0, 0, 0, 0))}
                          />
                        </PopoverContent>
                      </Popover>
                    </div>

                    <div className="space-y-2">
                      <Label>Check-out Date</Label>
                      <Popover>
                        <PopoverTrigger asChild>
                          <Button
                            variant="outline"
                            className="w-full justify-start text-left font-normal bg-transparent"
                          >
                            <CalendarIcon className="mr-2 h-4 w-4" />
                            {checkOut ? format(checkOut, "PPP") : "Select date"}
                          </Button>
                        </PopoverTrigger>
                        <PopoverContent className="w-auto p-0">
                          <Calendar 
                            mode="single" 
                            selected={checkOut} 
                            onSelect={setCheckOut} 
                            initialFocus
                            disabled={(date) => date < new Date(new Date().setHours(0, 0, 0, 0))}
                          />
                        </PopoverContent>
                      </Popover>
                    </div>
                  </div>

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



                  {/* Available Rooms */}
                  {selectedHotel && checkIn && checkOut && (
                    <div className="space-y-4">
                      <Label>Available Rooms</Label>
                      {isCheckingAvailability ? (
                        <div className="text-center py-8">
                          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-cyan-400 mx-auto mb-4"></div>
                          <p className="text-gray-600">Checking room availability...</p>
                        </div>
                      ) : hasCheckedAvailability ? (
                        <div className="space-y-3">
                          {availableRooms.map((room) => (
                          <Card
                            key={room.id}
                            className="border border-gray-200 hover:border-cyan-300 transition-colors"
                          >
                            <CardContent className="p-4">
                              <div className="flex justify-between items-start mb-2">
                                <h4 className="font-medium text-gray-900">{room.type}</h4>
                                <div className="text-right">
                                  <p className="text-lg font-medium">${room.price}/night</p>
                                  <p className="text-sm text-gray-500">{room.available} available</p>
                                </div>
                              </div>
                              <p className="text-sm text-gray-600 mb-2">Capacity: {room.capacity}</p>
                              <div className="flex flex-wrap gap-1 mb-3">
                                {room.amenities.map((amenity, index) => (
                                  <span key={index} className="text-xs bg-cyan-50 text-cyan-700 px-2 py-1 rounded">
                                    {amenity}
                                  </span>
                                ))}
                              </div>
                              <Button
                                size="sm"
                                className="w-full bg-gray-900 hover:bg-gray-800 text-white rounded-full"
                                onClick={() => {
                                  setSelectedRoom(room)
                                  console.log('Selected room:', room.type, 'Price:', room.price)
                                }}
                              >
                                Select This Room
                              </Button>
                            </CardContent>
                          </Card>
                        ))}
                      </div>
                    ) : null}
                  </div>
                  )}

                  {/* Guest Information */}
                  {/* <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="firstName">First Name</Label>
                      <Input
                        id="firstName"
                        placeholder="Enter your first name"
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="lastName">Last Name</Label>
                      <Input
                        id="lastName"
                        placeholder="Enter your last name"
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                      />
                    </div>
                  </div>

                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="email">Email Address</Label>
                      <Input
                        id="email"
                        type="email"
                        placeholder="Enter your email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="phone">Phone Number</Label>
                      <Input
                        id="phone"
                        type="tel"
                        placeholder="Enter your phone number"
                        value={phone}
                        onChange={(e) => setPhone(e.target.value)}
                      />
                    </div>
                  </div> */}

                  {/* Special Requests */}
                  {/* <div className="space-y-2">
                    <Label htmlFor="requests">Special Requests (Optional)</Label>
                    <Textarea
                      id="requests"
                      placeholder="Any special requests or preferences..."
                      className="min-h-[100px]"
                      value={requests}
                      onChange={(e) => setRequests(e.target.value)}
                    />
                  </div> */}
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
                      <div className="flex items-center gap-4 text-sm text-gray-500 mb-4">
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
                      <p className="text-2xl font-medium text-gray-900">
                        ${selectedHotelData.price}
                        <span className="text-sm font-normal text-gray-600">/night</span>
                      </p>
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
                          {!selectedRoom ? 'Please select a room to continue' : 'Please select hotel and dates to continue'}
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







