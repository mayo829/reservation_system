"use client"

import { Card } from "@/components/ui/card"
import { Star } from "lucide-react"
import Image from "next/image"
import Link from "next/link"
import { Button } from "@/components/ui/button"

type Hotel = {
  id: string
  name: string
  location: string
  image?: string
  rating?: number
  amenities?: string[]
  pricePerNight?: number
}

export default function HotelCard({ hotel, getAmenityIcon }: { hotel: Hotel, getAmenityIcon: (a: string) => JSX.Element }) {
  return (
    <Card className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden flex flex-col h-full">
      {/* Image */}
      <div className="relative h-64">
        <Image
          src={hotel.image || "/placeholder-hotel.jpg?height=256&width=400"}
          alt={hotel.name}
          fill
          className="object-cover"
        />
        {hotel.pricePerNight && (
          <div className="absolute top-4 right-4 bg-white/90 px-3 py-1 rounded-full text-sm font-medium text-darkblue">
            ${hotel.pricePerNight}/night
          </div>
        )}
      </div>

      {/* Content */}
      <div className="flex flex-col flex-1 p-6">
        {/* Main info grows to fill space */}
        <div className="flex flex-col gap-2 flex-1 overflow-hidden">
          <h3 className="text-xl font-medium text-gray-900">{hotel.name}</h3>
          <p className="text-gray-600">{hotel.location}</p>

          {hotel.rating && (
            <div className="flex items-center gap-1 mt-2">
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

          {hotel.amenities && hotel.amenities.length > 0 && (
            <div className="flex items-center gap-4 text-sm text-gray-500 mt-2 flex-wrap">
              {hotel.amenities.slice(0, 2).map((amenity, index) => (
                <div key={index} className="flex items-center gap-1">
                  {getAmenityIcon(amenity)}
                  <span>{amenity}</span>
                </div>
              ))}
              {hotel.amenities.length > 2 && (
                <span className="text-xs text-gray-400">+{hotel.amenities.length - 2} more</span>
              )}
            </div>
          )}
        </div>

        {/* Button fixed at bottom */}
        <div className="mt-4 pt-4 border-t border-gray-100">
          <Button asChild className="w-full bg-darkblue hover:bg-darkblue/90 text-white" size="sm">
            <Link href={`/booking?hotel=${hotel.id}`}>Book Now</Link>
          </Button>
        </div>
      </div>
    </Card>
  )
}
