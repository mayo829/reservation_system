// app/rooms/[slug]/page.tsx - Individual Room Type Page
'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { useHotels } from '../../context/HotelsContext';
import { useCart } from '../../context/CartContext';
import Image from 'next/image';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Calendar } from '@/components/ui/calendar';
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { CalendarIcon, MapPin, Users, Star, CheckCircle, ArrowLeft, Bed, Bath, Wifi, Car, Coffee } from 'lucide-react';
import { format } from 'date-fns';
import Link from 'next/link';

interface RoomDetails {
  id: string;
  type: string;
  slug: string;
  price: number;
  capacity: string;
  image: string;
  gallery: string[];
  amenities: string[];
  available: number;
  description: string;
  longDescription: string;
  hotelId: string;
  hotelName: string;
  hotelLocation: string;
  hotelAddress: string;
  hotelCity: string;
  hotelCountry: string;
  features: {
    bedType: string;
    roomSize: string;
    bathrooms: number;
    maxOccupancy: number;
    view: string;
  };
}

export default function RoomTypePage() {
  const params = useParams();
  const router = useRouter();
  const { hotels, isLoading: hotelsLoading } = useHotels();
  const { addToCart } = useCart();
  
  const [roomDetails, setRoomDetails] = useState<RoomDetails | null>(null);
  const [isLoadingRoom, setIsLoadingRoom] = useState(false);
  const [checkIn, setCheckIn] = useState<Date>();
  const [checkOut, setCheckOut] = useState<Date>();
  const [adults, setAdults] = useState("2");
  const [children, setChildren] = useState("0");
  const [rooms, setRooms] = useState("1");
  const [selectedImageIndex, setSelectedImageIndex] = useState(0);

  const roomSlug = params.slug as string;

  // Generate slug from room type name
  const generateSlug = (name: string): string => {
    return name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '');
  };

  // Find room by slug across all hotels
  const findRoomBySlug = async () => {
    if (hotels.length === 0) return;
    
    setIsLoadingRoom(true);
    const apiKey = 'BPLZZ875W56IHUSI2CZF21X4UXM2SCGD';
    
    try {
      // Search through all hotels to find the room with matching slug
      for (const hotel of hotels) {
        if (hotel.associations?.room_types?.room_types) {
          const roomTypeRefs = hotel.associations.room_types.room_types;
          
          for (const roomRef of roomTypeRefs) {
            try {
              const roomTypeUrl = roomRef['@_xlink:href'];
              const response = await fetch(`${roomTypeUrl}?ws_key=${apiKey}`);
              
              if (!response.ok) continue;
              
              const responseText = await response.text();
              
              // Parse XML response
              const { XMLParser } = await import('fast-xml-parser');
              const parser = new XMLParser({
                ignoreAttributes: false,
                attributeNamePrefix: "@_"
              });
              
              const roomData = parser.parse(responseText);
              const roomType = roomData.qloapps?.room_type;
              
              if (!roomType) continue;
              
              // Helper function to extract text
              const extractText = (value: any) => {
                if (typeof value === 'string') return value.trim();
                if (value && typeof value === 'object') {
                  if (value['#text']) {
                    const text = value['#text'];
                    return typeof text === 'string' ? text.trim() : String(text).trim();
                  }
                  if (value.language && value.language['#text']) {
                    const text = value.language['#text'];
                    return typeof text === 'string' ? text.trim() : String(text).trim();
                  }
                  return String(value).trim();
                }
                return '';
              };
              
              const roomName = extractText(roomType.name);
              const generatedSlug = generateSlug(roomName);
              
              // Check if this room matches our slug
              if (generatedSlug === roomSlug) {
                // Extract amenities and features
                const amenities = ['Free WiFi', 'Air Conditioning', 'Room Service'];
                if (roomType.associations?.room_type_features?.room_type_feature) {
                  const features = Array.isArray(roomType.associations.room_type_features.room_type_feature)
                    ? roomType.associations.room_type_features.room_type_feature
                    : [roomType.associations.room_type_features.room_type_feature];
                  
                  amenities.push('Mini Bar', 'Balcony', 'City View', 'Safe', 'Hairdryer');
                }
                
                // Extract gallery images
                const gallery = [];
                if (roomType.associations?.images?.image) {
                  const images = Array.isArray(roomType.associations.images.image) 
                    ? roomType.associations.images.image 
                    : [roomType.associations.images.image];
                  
                  for (const img of images.slice(0, 5)) { // Limit to 5 images
                    if (img['@_xlink:href']) {
                      gallery.push(`${img['@_xlink:href']}?ws_key=${apiKey}`);
                    }
                  }
                }
                
                // If no gallery images, add placeholder
                if (gallery.length === 0) {
                  gallery.push('/placeholder-room.jpg');
                }
                
                const mainImage = gallery[0];
                const adults = parseInt(extractText(roomType.adults)) || 2;
                const children = parseInt(extractText(roomType.children)) || 2;
                
                setRoomDetails({
                  id: roomType.id,
                  type: roomName,
                  slug: generatedSlug,
                  price: parseFloat(roomType.price),
                  capacity: `${adults} Adults, ${children} Children`,
                  image: mainImage,
                  gallery: gallery,
                  amenities: amenities,
                  available: roomType.associations?.hotel_rooms?.hotel_room?.length || 0,
                  description: extractText(roomType.description_short) || extractText(roomType.description) || '',
                  longDescription: extractText(roomType.description) || 'Experience luxury and comfort in this beautifully appointed room with modern amenities, elegant furnishings, and stunning views. Perfect for both business and leisure travelers.',
                  hotelId: hotel.id,
                  hotelName: hotel.name,
                  hotelLocation: hotel.location,
                  hotelAddress: hotel.address || '',
                  hotelCity: hotel.city || '',
                  hotelCountry: hotel.country || '',
                  features: {
                    bedType: adults > 2 ? 'King Bed + Sofa Bed' : 'Queen Bed',
                    roomSize: adults > 2 ? '45 sqm' : '35 sqm',
                    bathrooms: 1,
                    maxOccupancy: adults + children,
                    view: 'City View'
                  }
                });
                
                setIsLoadingRoom(false);
                return; // Found the room, exit
              }
              
            } catch (error) {
              console.error(`Error fetching room type ${roomRef.id}:`, error);
              continue;
            }
          }
        }
      }
      
      // If we get here, room not found
      console.error('Room not found for slug:', roomSlug);
      setIsLoadingRoom(false);
      
    } catch (error) {
      console.error('Error finding room by slug:', error);
      setIsLoadingRoom(false);
    }
  };

  useEffect(() => {
    if (hotels.length > 0) {
      findRoomBySlug();
    }
  }, [hotels, roomSlug]);

  const calculateNights = () => {
    if (checkIn && checkOut) {
      const diffTime = Math.abs(checkOut.getTime() - checkIn.getTime());
      return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    }
    return 0;
  };

  const calculateTotal = () => {
    if (roomDetails && checkIn && checkOut) {
      const nights = calculateNights();
      const roomCount = Number.parseInt(rooms);
      return roomDetails.price * nights * roomCount;
    }
    return 0;
  };

  const handleAddToCart = () => {
    if (!roomDetails || !checkIn || !checkOut) return;

    const cartItem = {
      id: `booking-${Date.now()}`,
      hotelName: roomDetails.hotelName,
      location: roomDetails.hotelLocation,
      roomType: roomDetails.type,
      checkIn: checkIn,
      checkOut: checkOut,
      nights: calculateNights(),
      adults: parseInt(adults),
      children: parseInt(children),
      pricePerNight: roomDetails.price,
      totalPrice: calculateTotal(),
      image: roomDetails.image
    };
    
    addToCart(cartItem);
    
    // Show success message or redirect
    // alert('Room added to cart!');
  };

  const handleBookNow = () => {
    if (!roomDetails || !checkIn || !checkOut) return;
  
    // Create cart item with all booking details
    const cartItem = {
      id: `booking-${Date.now()}`,
      hotelName: roomDetails.hotelName,
      location: roomDetails.hotelLocation,
      roomType: roomDetails.type,
      checkIn: checkIn,
      checkOut: checkOut,
      nights: calculateNights(),
      adults: parseInt(adults),
      children: parseInt(children),
      rooms: parseInt(rooms),
      pricePerNight: roomDetails.price,
      totalPrice: calculateTotal(),
      image: roomDetails.image,
      // Additional details for checkout
      hotelId: roomDetails.hotelId,
      roomId: roomDetails.id,
      amenities: roomDetails.amenities,
      capacity: roomDetails.capacity
    };
    
    // Add to cart
    addToCart(cartItem);
    
    // Navigate to cart page for checkout
    router.push('/checkout');
  };

  if (hotelsLoading || isLoadingRoom) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-cyan-400 mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading room details...</p>
        </div>
      </div>
    );
  }

  if (!roomDetails) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center max-w-md">
          <h2 className="text-2xl font-medium text-gray-900 mb-2">Room Not Found</h2>
          <p className="text-gray-600 mb-6">
            The room type "{roomSlug}" could not be found.
          </p>
          <div className="space-y-3">
            <Link href="/rooms">
              <Button className="w-full bg-cyan-400 hover:bg-cyan-500 text-white">
                <ArrowLeft className="w-4 h-4 mr-2" />
                Back to All Rooms
              </Button>
            </Link>
            <Button 
              variant="outline" 
              onClick={() => window.location.reload()}
              className="w-full"
            >
              Try Again
            </Button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Breadcrumb */}
      <div className="container mx-auto px-6 py-4">
        <div className="flex items-center gap-2 text-sm text-gray-600">
          <Link href="/" className="hover:text-cyan-400">Home</Link>
          <span>/</span>
          <Link href="/rooms" className="hover:text-cyan-400">Rooms</Link>
          <span>/</span>
          <span className="text-gray-900">{roomDetails.type}</span>
        </div>
      </div>

      {/* Hero Section */}
      <section className="pb-12">
        <div className="container mx-auto px-6">
          {/* Header */}
          <div className="mb-8">
            <div className="flex items-center gap-4 mb-4">
              <Link href="/rooms">
                <Button variant="outline" size="sm">
                  <ArrowLeft className="w-4 h-4 mr-2" />
                  Back to Rooms
                </Button>
              </Link>
            </div>
            
            <h1 className="text-4xl md:text-5xl font-light text-gray-900 mb-4">
              {roomDetails.type}
            </h1>
            
            <div className="flex flex-wrap items-center gap-6 text-gray-600">
              <div className="flex items-center gap-2">
                <MapPin className="w-5 h-5" />
                <span>{roomDetails.hotelName}</span>
              </div>
              <div className="flex items-center gap-2">
                <Users className="w-5 h-5" />
                <span>{roomDetails.capacity}</span>
              </div>
              <div className="flex items-center gap-1">
                <Star className="w-5 h-5 text-yellow-400 fill-current" />
                <span className="font-medium">4.8</span>
                <span>(127 reviews)</span>
              </div>
            </div>
          </div>

          {/* Image Gallery */}
          <div className="grid lg:grid-cols-3 gap-4 mb-12">
            {/* Main Image */}
            <div className="lg:col-span-2">
              <div className="relative h-96 lg:h-[500px] rounded-lg overflow-hidden">
                <Image
                  src={roomDetails.gallery[selectedImageIndex]}
                  alt={roomDetails.type}
                  fill
                  className="object-cover"
                />
              </div>
            </div>
            
            {/* Thumbnail Gallery */}
            <div className="space-y-2">
              {roomDetails.gallery.slice(0, 4).map((image, index) => (
                <div 
                  key={index}
                  className={`relative h-24 lg:h-[120px] rounded-lg overflow-hidden cursor-pointer border-2 transition-all ${
                    selectedImageIndex === index ? 'border-cyan-400' : 'border-transparent hover:border-gray-300'
                  }`}
                  onClick={() => setSelectedImageIndex(index)}
                >
                  <Image
                    src={image}
                    alt={`${roomDetails.type} ${index + 1}`}
                    fill
                    className="object-cover"
                  />
                </div>
              ))}
            </div>
          </div>

          {/* Content Grid */}
          <div className="grid lg:grid-cols-3 gap-12">
            {/* Room Details */}
            <div className="lg:col-span-2 space-y-8">
              {/* Description */}
              <div>
                <h2 className="text-2xl font-light text-gray-900 mb-4">About This Room</h2>
                <p className="text-gray-700 leading-relaxed mb-4">
                  {roomDetails.longDescription}
                </p>
                <p className="text-gray-600">
                  Located in {roomDetails.hotelAddress}, {roomDetails.hotelCity}, this elegantly designed room offers the perfect blend of comfort and luxury for your stay.
                </p>
              </div>

              {/* Room Features */}
              <div>
                <h2 className="text-2xl font-light text-gray-900 mb-4">Room Features</h2>
                <div className="grid md:grid-cols-2 gap-4">
                  <div className="flex items-center gap-3 p-4 bg-white rounded-lg border">
                    <Bed className="w-6 h-6 text-cyan-400" />
                    <div>
                      <p className="font-medium text-gray-900">{roomDetails.features.bedType}</p>
                      <p className="text-sm text-gray-600">Comfortable bedding</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center gap-3 p-4 bg-white rounded-lg border">
                    <div className="w-6 h-6 bg-cyan-400 rounded text-white flex items-center justify-center text-sm font-bold">
                      {roomDetails.features.roomSize}
                    </div>
                    <div>
                      <p className="font-medium text-gray-900">Room Size</p>
                      <p className="text-sm text-gray-600">Spacious layout</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center gap-3 p-4 bg-white rounded-lg border">
                    <Bath className="w-6 h-6 text-cyan-400" />
                    <div>
                      <p className="font-medium text-gray-900">{roomDetails.features.bathrooms} Bathroom</p>
                      <p className="text-sm text-gray-600">Modern fixtures</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center gap-3 p-4 bg-white rounded-lg border">
                    <Users className="w-6 h-6 text-cyan-400" />
                    <div>
                      <p className="font-medium text-gray-900">Max {roomDetails.features.maxOccupancy} Guests</p>
                      <p className="text-sm text-gray-600">Comfortable capacity</p>
                    </div>
                  </div>
                </div>
              </div>

              {/* Amenities */}
              <div>
                <h2 className="text-2xl font-light text-gray-900 mb-4">Amenities</h2>
                <div className="grid md:grid-cols-2 gap-3">
                  {roomDetails.amenities.map((amenity, index) => (
                    <div key={index} className="flex items-center gap-2">
                      <CheckCircle className="w-5 h-5 text-green-500" />
                      <span className="text-gray-700">{amenity}</span>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* Booking Card */}
            <div className="lg:col-span-1">
              <Card className="sticky top-24 border-0 shadow-lg">
                <CardContent className="p-6">
                  {/* Price */}
                  <div className="text-center mb-6">
                    <div className="text-3xl font-medium text-cyan-400 mb-2">
                      ${roomDetails.price}
                      <span className="text-lg text-gray-600 font-normal">/night</span>
                    </div>
                    <div className={`text-sm ${roomDetails.available > 0 ? 'text-green-600' : 'text-red-600'}`}>
                      {roomDetails.available > 0 ? `${roomDetails.available} rooms available` : 'Fully booked'}
                    </div>
                  </div>

                  {/* Booking Form */}
                  <div className="space-y-4">
                    {/* Date Selection */}
                    <div className="space-y-2">
                      <label className="text-sm font-medium text-gray-700">Check-in & Check-out</label>
                      <Popover>
                        <PopoverTrigger asChild>
                          <Button
                            variant="outline"
                            className="w-full justify-start text-left font-normal"
                          >
                            <CalendarIcon className="mr-2 h-4 w-4" />
                            {checkIn && checkOut 
                              ? `${format(checkIn, "MMM dd")} - ${format(checkOut, "MMM dd")}`
                              : "Select dates"}
                          </Button>
                        </PopoverTrigger>
                        <PopoverContent className="w-auto p-0">
                          <Calendar 
                            mode="range" 
                            selected={{ from: checkIn, to: checkOut }}
                            onSelect={(range) => {
                              setCheckIn(range?.from);
                              setCheckOut(range?.to);
                            }}
                            initialFocus
                            disabled={(date) => date < new Date(new Date().setHours(0, 0, 0, 0))}
                          />
                        </PopoverContent>
                      </Popover>
                    </div>

                    {/* Guest Selection */}
                    <div className="grid grid-cols-2 gap-3">
                      <div className="space-y-2">
                        <label className="text-sm font-medium text-gray-700">Adults</label>
                        <Select value={adults} onValueChange={setAdults}>
                          <SelectTrigger>
                            <SelectValue />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="1">1 Adult</SelectItem>
                            <SelectItem value="2">2 Adults</SelectItem>
                            <SelectItem value="3">3 Adults</SelectItem>
                            <SelectItem value="4">4 Adults</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>
                      
                      <div className="space-y-2">
                        <label className="text-sm font-medium text-gray-700">Children</label>
                        <Select value={children} onValueChange={setChildren}>
                          <SelectTrigger>
                            <SelectValue />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="0">No Children</SelectItem>
                            <SelectItem value="1">1 Child</SelectItem>
                            <SelectItem value="2">2 Children</SelectItem>
                            <SelectItem value="3">3 Children</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>
                    </div>

                    <div className="space-y-2">
                      <label className="text-sm font-medium text-gray-700">Rooms</label>
                      <Select value={rooms} onValueChange={setRooms}>
                        <SelectTrigger>
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="1">1 Room</SelectItem>
                          <SelectItem value="2">2 Rooms</SelectItem>
                          <SelectItem value="3">3 Rooms</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>

                    {/* Booking Summary */}
                    {checkIn && checkOut && (
                      <div className="bg-gray-50 p-4 rounded-lg space-y-2">
                        <div className="flex justify-between text-sm">
                          <span className="text-gray-600">Nights</span>
                          <span className="font-medium">{calculateNights()}</span>
                        </div>
                        <div className="flex justify-between text-sm">
                          <span className="text-gray-600">Rooms</span>
                          <span className="font-medium">{rooms}</span>
                        </div>
                        <div className="border-t pt-2">
                          <div className="flex justify-between font-medium">
                            <span>Total</span>
                            <span className="text-cyan-400">${calculateTotal().toLocaleString()}</span>
                          </div>
                        </div>
                      </div>
                    )}

                    {/* Action Buttons */}
                    <div className="space-y-3">
                      <Button
                        onClick={handleBookNow}
                        disabled={!checkIn || !checkOut || roomDetails.available === 0}
                        className="w-full bg-cyan-400 hover:bg-cyan-500 text-white"
                      >
                        Reserve Now
                      </Button>
                      
                      <Button
                        onClick={handleAddToCart}
                        disabled={!checkIn || !checkOut || roomDetails.available === 0}
                        variant="outline"
                        className="w-full"
                      >
                        Add to Cart
                      </Button>
                    </div>

                    {(!checkIn || !checkOut) && (
                      <p className="text-xs text-gray-500 text-center">
                        Select dates to see total price
                      </p>
                    )}
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}