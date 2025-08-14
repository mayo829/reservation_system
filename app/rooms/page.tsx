// app/rooms/page.tsx - Updated All Rooms Index Page
'use client';

import { useState, useEffect } from 'react';
import { useHotels } from '../context/HotelsContext';
import Link from 'next/link';
import Image from 'next/image';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { MapPin, Users, Star } from 'lucide-react';

interface RoomType {
  id: string;
  type: string;
  slug: string;
  price: number;
  capacity: string;
  image: string;
  amenities: string[];
  available: number;
  description: string;
  hotelId: string;
  hotelName: string;
  hotelLocation: string;
}

export default function RoomsPage() {
  const { hotels, isLoading, error } = useHotels();
  const [allRoomTypes, setAllRoomTypes] = useState<RoomType[]>([]);
  const [isLoadingRooms, setIsLoadingRooms] = useState(false);

  // Generate slug from room type name
  const generateSlug = (name: string): string => {
    return name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '');
  };

  // Fetch room types for all hotels
  const fetchAllRoomTypes = async () => {
    if (hotels.length === 0) return;
    
    setIsLoadingRooms(true);
    const apiKey = 'BPLZZ875W56IHUSI2CZF21X4UXM2SCGD';
    
    try {
      const allRooms: RoomType[] = [];
      const seenSlugs = new Set<string>(); // To avoid duplicate room types
      
      for (const hotel of hotels) {
        if (hotel.associations?.room_types?.room_types) {
          const roomTypeRefs = hotel.associations.room_types.room_types;
          
          const roomPromises = roomTypeRefs.map(async (roomRef: any) => {
            try {
              const roomTypeUrl = roomRef['@_xlink:href'];
              const response = await fetch(`${roomTypeUrl}?ws_key=${apiKey}`);
              
              if (!response.ok) {
                console.error(`Failed to fetch room type ${roomRef.id}:`, response.status);
                return null;
              }
              
              const responseText = await response.text();
              
              // Parse XML response
              const { XMLParser } = await import('fast-xml-parser');
              const parser = new XMLParser({
                ignoreAttributes: false,
                attributeNamePrefix: "@_"
              });
              
              const roomData = parser.parse(responseText);
              const roomType = roomData.qloapps?.room_type;
              
              if (!roomType) return null;
              
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
              
              // Extract amenities
              const amenities = ['Free WiFi', 'Air Conditioning'];
              if (roomType.associations?.room_type_features?.room_type_feature) {
                const features = Array.isArray(roomType.associations.room_type_features.room_type_feature)
                  ? roomType.associations.room_type_features.room_type_feature
                  : [roomType.associations.room_type_features.room_type_feature];
                
                if (features.length > 0) {
                  amenities.push('Room Service', 'Mini Bar');
                }
              }
              
              const imageUrl = roomType.associations?.images?.image?.[0]?.['@_xlink:href'];
              const roomName = extractText(roomType.name);
              const roomSlug = generateSlug(roomName);
              
              // Skip if we've already seen this room type (avoid duplicates)
              if (seenSlugs.has(roomSlug)) {
                return null;
              }
              seenSlugs.add(roomSlug);
              
              return {
                id: roomType.id,
                type: roomName,
                slug: roomSlug,
                price: parseFloat(roomType.price),
                capacity: `${parseInt(extractText(roomType.adults)) || 2} Adults, ${parseInt(extractText(roomType.children)) || 2} Children`,
                image: imageUrl ? `${imageUrl}?ws_key=${apiKey}` : "/placeholder-room.jpg",
                amenities: amenities,
                available: roomType.associations?.hotel_rooms?.hotel_room?.length || 0,
                description: extractText(roomType.description_short) || extractText(roomType.description) || '',
                hotelId: hotel.id,
                hotelName: hotel.name,
                hotelLocation: hotel.location
              };
              
            } catch (error) {
              console.error(`Error fetching room type ${roomRef.id}:`, error);
              return null;
            }
          });
          
          const roomResults = await Promise.all(roomPromises);
          const validRooms = roomResults.filter((room): room is RoomType => room !== null);
          allRooms.push(...validRooms);
        }
      }
      
      setAllRoomTypes(allRooms);
    } catch (error) {
      console.error('Error fetching room types:', error);
    } finally {
      setIsLoadingRooms(false);
    }
  };

  useEffect(() => {
    if (hotels.length > 0) {
      fetchAllRoomTypes();
    }
  }, [hotels]);

  if (isLoading) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-cyan-400 mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading hotels...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16 flex items-center justify-center">
        <div className="text-center max-w-md">
          <h2 className="text-2xl font-medium text-gray-900 mb-2">Unable to Load Rooms</h2>
          <p className="text-gray-600 mb-4">{error}</p>
          <Button onClick={() => window.location.reload()}>Try Again</Button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
            Our <span className="font-medium text-cyan-400">Rooms</span>
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Discover our collection of beautifully appointed rooms and suites, each designed for comfort and luxury.
          </p>
        </div>
      </section>

      {/* Rooms Grid */}
      <section className="py-12">
        <div className="container mx-auto px-6">
          {isLoadingRooms ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-cyan-400 mx-auto mb-4"></div>
              <p className="text-lg text-gray-600">Loading room types...</p>
            </div>
          ) : (
            <>
              {/* Room Types Count */}
              {allRoomTypes.length > 0 && (
                <div className="mb-8">
                  <p className="text-gray-600">
                    Showing {allRoomTypes.length} room {allRoomTypes.length === 1 ? 'type' : 'types'}
                  </p>
                </div>
              )}

              <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                {allRoomTypes.map((room, index) => (
                  <Card key={`${room.slug}-${index}`} className="group overflow-hidden border-0 shadow-lg hover:shadow-xl transition-all duration-300">
                    <CardContent className="p-0">
                      <div className="relative h-64 overflow-hidden">
                        <Image
                          src={room.image}
                          alt={room.type}
                          fill
                          className="object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                        <div className="absolute top-4 right-4 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
                          <span className="text-sm font-medium text-gray-900">${room.price}/night</span>
                        </div>
                      </div>
                      
                      <div className="p-6">
                        <div className="flex items-start justify-between mb-2">
                          <h3 className="text-xl font-semibold text-gray-900">{room.type}</h3>
                          <div className="flex items-center gap-1">
                            <Star className="w-4 h-4 text-yellow-400 fill-current" />
                            <span className="text-sm text-gray-600">4.8</span>
                          </div>
                        </div>
                        
                        <div className="flex items-center gap-2 text-sm text-gray-600 mb-3">
                          <MapPin className="w-4 h-4" />
                          <span>{room.hotelName}</span>
                        </div>
                        
                        <div className="flex items-center gap-2 text-sm text-gray-600 mb-3">
                          <Users className="w-4 h-4" />
                          <span>{room.capacity}</span>
                        </div>
                        
                        <p className="text-gray-600 text-sm line-clamp-2 mb-4">
                          {room.description || 'Experience luxury and comfort in this beautifully appointed room.'}
                        </p>
                        
                        <div className="flex flex-wrap gap-1 mb-4">
                          {room.amenities.slice(0, 3).map((amenity, amenityIndex) => (
                            <span key={amenityIndex} className="text-xs bg-gray-100 px-2 py-1 rounded">
                              {amenity}
                            </span>
                          ))}
                          {room.amenities.length > 3 && (
                            <span className="text-xs text-gray-500">+{room.amenities.length - 3} more</span>
                          )}
                        </div>
                        
                        <div className="flex items-center justify-between">
                          <div className="text-sm text-gray-600">
                            {room.available > 0 ? (
                              <span className="text-green-600">{room.available} available</span>
                            ) : (
                              <span className="text-red-600">Fully booked</span>
                            )}
                          </div>
                          
                          {/* Updated Link - now goes to individual room page by slug */}
                          <Link href={`/rooms/${room.slug}`}>
                            <Button className="bg-cyan-400 hover:bg-cyan-500 text-white">
                              View Room
                            </Button>
                          </Link>
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
            </>
          )}
          
          {!isLoadingRooms && allRoomTypes.length === 0 && (
            <div className="text-center py-12">
              <h3 className="text-xl font-medium text-gray-900 mb-2">No rooms available</h3>
              <p className="text-gray-600">Please check back later or contact us for assistance.</p>
            </div>
          )}
        </div>
      </section>
    </div>
  );
}