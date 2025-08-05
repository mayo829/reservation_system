import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Award, Users, Globe, Heart } from "lucide-react"
import Image from "next/image"
import Link from "next/link"

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
              About <span className="font-medium text-cyan-400">SpiceHotels</span>
            </h1>
            <p className="text-xl text-gray-600 leading-relaxed">
              Founded in 2015, SpiceHotels has been redefining luxury hospitality with our commitment to exceptional
              service, premium locations, and unforgettable experiences. We believe that every journey should be
              extraordinary.
            </p>
          </div>
        </div>
      </section>

      {/* Story Section */}
      <section className="py-24 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            <div>
              <h2 className="text-4xl font-light text-gray-900 mb-6">Our Story</h2>
              <p className="text-gray-600 mb-6 leading-relaxed">
                SpiceHotels began with a simple vision: to create accommodations that feel like home while providing the
                luxury and service of a world-class hotel. Our founders, passionate travelers themselves, recognized the
                need for authentic, high-quality hospitality experiences.
              </p>
              <p className="text-gray-600 mb-8 leading-relaxed">
                Today, we operate premium properties in some of the world's most sought-after destinations, each
                carefully selected and designed to offer our guests an unparalleled experience that combines comfort,
                style, and local culture.
              </p>
              <Button asChild className="bg-gray-900 hover:bg-gray-800 text-white rounded-full">
                <Link href="/contact">Get in Touch</Link>
              </Button>
            </div>
            <div className="relative h-96 lg:h-[500px]">
              <Image
                src="/placeholder.svg?height=500&width=600"
                alt="SpiceHotels interior"
                fill
                className="object-cover rounded-lg"
              />
            </div>
          </div>
        </div>
      </section>

      {/* Values Section */}
      <section className="py-24 bg-gray-50/30">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-light text-gray-900 mb-4">Our Values</h2>
            <p className="text-gray-600 max-w-2xl mx-auto">
              These core principles guide everything we do and shape the experience we create for our guests.
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            <Card className="border-0 shadow-sm bg-white hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Heart className="w-12 h-12 text-cyan-400 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Hospitality</h3>
                <p className="text-gray-600">Genuine care and attention to every guest's needs and preferences.</p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm bg-white hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Award className="w-12 h-12 text-gray-700 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Excellence</h3>
                <p className="text-gray-600">Uncompromising standards in service, amenities, and experiences.</p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm bg-white hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Globe className="w-12 h-12 text-cyan-400 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Authenticity</h3>
                <p className="text-gray-600">Celebrating local culture and creating genuine connections.</p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm bg-white hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                <Users className="w-12 h-12 text-gray-700 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-3">Community</h3>
                <p className="text-gray-600">Building lasting relationships with guests and local communities.</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Team Section */}
      <section className="py-24 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-light text-gray-900 mb-4">Leadership Team</h2>
            <p className="text-gray-600">Meet the passionate individuals behind SpiceHotels</p>
          </div>

          <div className="grid md:grid-cols-3 gap-8 max-w-4xl mx-auto">
            <Card className="border-0 shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 text-center">
                <div className="relative w-24 h-24 mx-auto mb-4">
                  <Image
                    src="/placeholder.svg?height=96&width=96"
                    alt="Sarah Johnson"
                    fill
                    className="object-cover rounded-full"
                  />
                </div>
                <h3 className="text-xl font-medium text-gray-900 mb-1">Sarah Johnson</h3>
                <p className="text-cyan-400 mb-3">Chief Executive Officer</p>
                <p className="text-gray-600 text-sm">
                  15+ years in luxury hospitality with a passion for creating exceptional guest experiences.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 text-center">
                <div className="relative w-24 h-24 mx-auto mb-4">
                  <Image
                    src="/placeholder.svg?height=96&width=96"
                    alt="Michael Chen"
                    fill
                    className="object-cover rounded-full"
                  />
                </div>
                <h3 className="text-xl font-medium text-gray-900 mb-1">Michael Chen</h3>
                <p className="text-cyan-400 mb-3">Chief Operating Officer</p>
                <p className="text-gray-600 text-sm">
                  Expert in operations management with a focus on sustainable hospitality practices.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 text-center">
                <div className="relative w-24 h-24 mx-auto mb-4">
                  <Image
                    src="/placeholder.svg?height=96&width=96"
                    alt="Emma Rodriguez"
                    fill
                    className="object-cover rounded-full"
                  />
                </div>
                <h3 className="text-xl font-medium text-gray-900 mb-1">Emma Rodriguez</h3>
                <p className="text-cyan-400 mb-3">Chief Marketing Officer</p>
                <p className="text-gray-600 text-sm">
                  Creative strategist dedicated to sharing the SpiceHotels story with the world.
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-24 bg-cyan-50/30">
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-4xl font-light text-gray-900 mb-6">Experience the SpiceHotels Difference</h2>
          <p className="text-xl text-gray-600 mb-12 max-w-2xl mx-auto">
            Join thousands of satisfied guests who have made SpiceHotels their preferred choice for luxury
            accommodations.
          </p>
          <Button
            asChild
            size="lg"
            className="bg-cyan-400 hover:bg-cyan-500 text-white px-12 py-4 rounded-full text-lg"
          >
            <Link href="/booking">Book Your Stay</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}
