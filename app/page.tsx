import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { MapPin, Star, Wifi, Car, Coffee, Waves } from "lucide-react"
import Image from "next/image"
import Link from "next/link"
import BookingBar from "./components/BookingBar"

export default function HomePage() {
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

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            <Card className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden">
              <div className="relative h-64">
                <Image
                  src="/nyc.jpg?height=256&width=400"
                  alt="Lisboa Hotels Manhattan"
                  fill
                  className="object-cover"
                />
              </div>
              <CardContent className="p-6">
                <h3 className="text-xl font-medium text-gray-900 mb-2">Lisboa Hotels Manhattan</h3>
                <p className="text-gray-600 mb-4">New York, USA</p>
                <div className="flex items-center gap-4 text-sm text-gray-500">
                  <div className="flex items-center gap-1">
                    <Wifi className="w-4 h-4" />
                    <span>Free WiFi</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Car className="w-4 h-4" />
                    <span>Parking</span>
                  </div>
                </div>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden">
              <div className="relative h-64">
                <Image
                  src="/malibu.jpg?height=256&width=400"
                  alt="Lisboa Hotels Malibu"
                  fill
                  className="object-cover"
                />
              </div>
              <CardContent className="p-6">
                <h3 className="text-xl font-medium text-gray-900 mb-2">Lisboa Hotels Malibu</h3>
                <p className="text-gray-600 mb-4">California, USA</p>
                <div className="flex items-center gap-4 text-sm text-gray-500">
                  <div className="flex items-center gap-1">
                    <Waves className="w-4 h-4" />
                    <span>Beach Access</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Coffee className="w-4 h-4" />
                    <span>Restaurant</span>
                  </div>
                </div>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden">
              <div className="relative h-64">
                <Image
                  src="/aspen.jpg?height=256&width=400"
                  alt="Lisboa Hotels Aspen"
                  fill
                  className="object-cover"
                />
              </div>
              <CardContent className="p-6">
                <h3 className="text-xl font-medium text-gray-900 mb-2">Lisboa Hotels Aspen</h3>
                <p className="text-gray-600 mb-4">Colorado, USA</p>
                <div className="flex items-center gap-4 text-sm text-gray-500">
                  <div className="flex items-center gap-1">
                    <MapPin className="w-4 h-4" />
                    <span>Ski Access</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Star className="w-4 h-4" />
                    <span>Spa</span>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
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
