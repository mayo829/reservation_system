"use client"

import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { MapPin, Star, Wifi, Car, Coffee, Waves, Loader2 } from "lucide-react"
import Image from "next/image"
import Link from "next/link"
import BookingBar from "./components/BookingBar"
import { useHotels } from "./context/HotelsContext"

export default function HomePage() {
  const { hotels, isLoading, error } = useHotels()

  // Get first 3 hotels for featured section
  const featuredHotels = hotels.slice(0, 3)

  // Helper function to get amenity icons
  const getAmenityIcon = (amenity: string) => {
    // const amenityLower = amenity.toLowerCase()
    // if (amenityLower.includes('wifi') || amenityLower.includes('internet')) return <Wifi className="w-4 h-4" />
    // if (amenityLower.includes('parking') || amenityLower.includes('garage')) return <Car className="w-4 h-4" />
    // if (amenityLower.includes('restaurant') || amenityLower.includes('dining')) return <Coffee className="w-4 h-4" />
    // if (amenityLower.includes('beach') || amenityLower.includes('ocean')) return <Waves className="w-4 h-4" />
    // if (amenityLower.includes('spa') || amenityLower.includes('wellness')) return <Star className="w-4 h-4" />
    // if (amenityLower.includes('ski') || amenityLower.includes('mountain')) return <MapPin className="w-4 h-4" />
    return <Star className="w-4 h-4" /> // Default icon
  }

  return (
    <div className="min-h-screen bg-yellow-100/30">
      {/* Hero Section with Booking Bar */}
      <section className="relative min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-yellow-50/20 to-yellow-50/40 pt-16">
        <div className="container mx-auto px-6 text-center mb-12">
          <h1 className="text-6xl md:text-7xl font-light text-gray-900 mb-6 tracking-tight">
            Welcome to
            <span className="block font-medium text-darkblue">Lisboa Hotels</span>
          </h1>
          <p className="text-xl text-gray-600 mb-12 max-w-2xl mx-auto leading-relaxed">
            Experience luxury and comfort in our carefully curated collection of premium accommodations across the
            world's most beautiful destinations.
          </p>
        </div>

        {/* Booking Bar - Positioned right under welcome */}
        <div className="container mx-auto px-6 w-full">
          <BookingBar />
        </div>
      </section>

      {/* Features Section */}
      <section className="py-24 bg-yellow-100/30">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-light text-gray-900 mb-4">Why Choose Lisboa Hotels</h2>
            <p className="text-gray-600 max-w-2xl mx-auto">
              We provide exceptional hospitality with attention to every detail, ensuring your stay is memorable and
              comfortable.
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            <Card className="border-0 shadow-sm bg-darkblue/5 hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Star className="w-12 h-12 text-darkblue mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Premium Quality</h3>
                <p className="text-gray-600">
                  Carefully selected properties that meet our highest standards for comfort and luxury.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm bg-darkblue/5 hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <MapPin className="w-12 h-12 text-gray-700 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Prime Locations</h3>
                <p className="text-gray-600">
                  Strategic locations in the heart of major cities and scenic destinations worldwide.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm bg-darkblue/5 hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Coffee className="w-12 h-12 text-darkblue mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Exceptional Service</h3>
                <p className="text-gray-600">
                  24/7 concierge service and personalized attention to make your stay unforgettable.
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Featured Properties */}
      <section className="py-24 bg-darkblue/5 bg-yellow-100/30">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-light text-gray-900 mb-4">Featured Properties</h2>
            <p className="text-gray-600">Discover our most popular destinations</p>
          </div>

          {/* Loading State */}
          {isLoading && (
            <div className="flex justify-center items-center py-12">
              <Loader2 className="w-8 h-8 animate-spin text-darkblue" />
              <span className="ml-2 text-gray-600">Loading our beautiful hotels...</span>
            </div>
          )}

          {/* Error State */}
          {error && (
            <div className="text-center py-12">
              <p className="text-red-600 mb-4">Sorry, we couldn't load our hotels at the moment.</p>
              <Button 
                onClick={() => window.location.reload()} 
                variant="outline"
                className="border-darkblue text-darkblue hover:bg-darkblue hover:text-white"
              >
                Try Again
              </Button>
            </div>
          )}

          {/* Hotels Grid */}
          {!isLoading && !error && (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              {featuredHotels.map((hotel) => (
                <Card key={hotel.id} className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden">
                  <div className="relative h-64">
                    <Image
                      src={hotel.image || "/placeholder-hotel.jpg?height=256&width=400"}
                      alt={hotel.name}
                      fill
                      className="object-cover"
                    />
                    {/* Optional: Price overlay */}
                    {hotel.pricePerNight && (
                      <div className="absolute top-4 right-4 bg-white/90 px-3 py-1 rounded-full text-sm font-medium text-darkblue">
                        ${hotel.pricePerNight}/night
                      </div>
                    )}
                  </div>
                  <CardContent className="p-6">
                    <h3 className="text-xl font-medium text-gray-900 mb-2">{hotel.name}</h3>
                    <p className="text-gray-600 mb-4">{hotel.location}</p>
                    
                    {/* Star Rating */}
                    {hotel.rating && (
                      <div className="flex items-center gap-1 mb-4">
                        {[...Array(5)].map((_, i) => (
                          <Star
                            key={i}
                            className={`w-4 h-4 ${
                              i < hotel.rating ? "text-yellow-400 fill-current" : "text-gray-300"
                            }`}
                          />
                        ))}
                        <span className="ml-2 text-sm text-gray-600">({hotel.rating}/5)</span>
                      </div>
                    )}

                    {/* Amenities */}
                    {hotel.amenities && hotel.amenities.length > 0 && (
                      <div className="flex items-center gap-4 text-sm text-gray-500">
                        {hotel.amenities.slice(0, 2).map((amenity, index) => (
                          <div key={index} className="flex items-center gap-1">
                            {getAmenityIcon(amenity)}
                            <span>{amenity}</span>
                          </div>
                        ))}
                        {hotel.amenities.length > 2 && (
                          <span className="text-xs text-gray-400">
                            +{hotel.amenities.length - 2} more
                          </span>
                        )}
                      </div>
                    )}

                    {/* Optional: Book Now Button */}
                    <div className="mt-4 pt-4 border-t border-gray-100">
                      <Button 
                        asChild 
                        className="w-full bg-darkblue hover:bg-darkblue/90 text-white"
                        size="sm"
                      >
                        <Link href={`/booking?hotel=${hotel.id}`}>
                          Book Now
                        </Link>
                      </Button>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          )}

          {/* Show All Hotels Link */}
          {!isLoading && !error && hotels.length > 3 && (
            <div className="text-center mt-12">
              <Button
                asChild
                variant="outline"
                className="border-darkblue text-darkblue hover:bg-darkblue hover:text-white"
              >
                <Link href="/hotels">View All {hotels.length} Hotels</Link>
              </Button>
            </div>
          )}
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-24 bg-yellow-100/30">
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-4xl font-light text-gray-900 mb-6">Ready to Experience Luxury?</h2>
          <p className="text-xl text-gray-600 mb-12 max-w-2xl mx-auto">
            Book your stay today and discover why Lisboa Hotels is the preferred choice for discerning travelers.
          </p>
          <Button
            asChild
            size="lg"
            className="bg-darkblue hover:bg-darkblue/90 text-white px-12 py-4 rounded-full text-lg"
          >
            <Link href="/booking">Explore Our Hotels</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}