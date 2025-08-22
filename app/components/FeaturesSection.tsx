"use client"

import { Card, CardContent } from "@/components/ui/card"
import { Star, MapPin, Coffee } from "lucide-react"

export default function FeaturesSection() {
  const features = [
    {
      icon: <Star className="w-12 h-12 text-darkblue mx-auto mb-4" />,
      title: "Premium Quality",
      text: "Carefully selected properties that meet our highest standards for comfort and luxury."
    },
    {
      icon: <MapPin className="w-12 h-12 text-gray-700 mx-auto mb-4" />,
      title: "Prime Locations",
      text: "Strategic locations in the heart of major cities and scenic destinations worldwide."
    },
    {
      icon: <Coffee className="w-12 h-12 text-darkblue mx-auto mb-4" />,
      title: "Exceptional Service",
      text: "24/7 concierge service and personalized attention to make your stay unforgettable."
    }
  ]

  return (
    <section className="py-24 bg-yellow-100/30">
      <div className="container mx-auto px-6">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-light text-gray-900 mb-4">Why Choose Lisboa Hotels</h2>
          <p className="text-gray-600 max-w-2xl mx-auto">
            We provide exceptional hospitality with attention to every detail, ensuring your stay is memorable and comfortable.
          </p>
        </div>

        <div className="grid md:grid-cols-3 gap-8">
          {features.map((f, i) => (
            <Card key={i} className="border-0 shadow-sm bg-darkblue/5 hover:shadow-md transition-shadow">
              <CardContent className="p-8 text-center">
                {f.icon}
                <h3 className="text-xl font-medium text-gray-900 mb-3">{f.title}</h3>
                <p className="text-gray-600">{f.text}</p>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </section>
  )
}
