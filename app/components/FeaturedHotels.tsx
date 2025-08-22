"use client"

import { Loader2, Star, Wifi, Car, Coffee, Waves, MapPin } from "lucide-react"
import { Button } from "@/components/ui/button"
import Link from "next/link"
import { useHotels } from "../context/HotelsContext"
import HotelCard from "./HotelCard"

export default function FeaturedHotels() {
  const { hotels, isLoading, error } = useHotels()
  const featuredHotels = hotels.slice(0, 3)

  const getAmenityIcon = (amenity: string) => {
    // (optional: expand these rules later)
    return <Star className="w-4 h-4" />
  }

  return (
    <section className="py-24 bg-yellow-100/30">
      <div className="container mx-auto px-6">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-light text-gray-900 mb-4">Featured Properties</h2>
          <p className="text-gray-600">Discover our most popular destinations</p>
        </div>

        {isLoading && (
          <div className="flex justify-center items-center py-12">
            <Loader2 className="w-8 h-8 animate-spin text-darkblue" />
            <span className="ml-2 text-gray-600">Loading our beautiful hotels...</span>
          </div>
        )}

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

        {!isLoading && !error && (
          <>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 auto-rows-fr">
                {featuredHotels.map((hotel) => (
                    <HotelCard key={hotel.id} hotel={hotel} getAmenityIcon={getAmenityIcon} />
                ))}
            </div>

            {hotels.length > 3 && (
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
          </>
        )}
      </div>
    </section>
  )
}
