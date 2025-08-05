"use client"

import { useState } from "react"
import Image from "next/image"
import { Card } from "@/components/ui/card"
import { Button } from "@/components/ui/button"

const galleryImages = [
  {
    id: 1,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Elegant hotel lobby",
    category: "Interiors",
  },
  {
    id: 2,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Premium suite with city view",
    category: "Rooms",
  },
  {
    id: 3,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Fine dining restaurant",
    category: "Dining",
  },
  {
    id: 4,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Luxury spa facilities",
    category: "Amenities",
  },
  {
    id: 5,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Rooftop pool with skyline view",
    category: "Amenities",
  },
  {
    id: 6,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Modern conference facilities",
    category: "Business",
  },
  {
    id: 7,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Premium bathroom amenities",
    category: "Rooms",
  },
  {
    id: 8,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Hotel exterior at golden hour",
    category: "Exterior",
  },
  {
    id: 9,
    src: "/placeholder.svg?height=400&width=600",
    alt: "Sophisticated hotel bar",
    category: "Dining",
  },
]

const categories = ["All", "Interiors", "Rooms", "Dining", "Amenities", "Business", "Exterior"]

export default function GalleryPage() {
  const [selectedCategory, setSelectedCategory] = useState("All")

  const filteredImages =
    selectedCategory === "All" ? galleryImages : galleryImages.filter((image) => image.category === selectedCategory)

  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
            Our <span className="font-medium text-cyan-400">Gallery</span>
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Explore the beauty and elegance of SpiceHotels through our curated collection of images showcasing our
            premium accommodations and world-class amenities.
          </p>
        </div>
      </section>

      {/* Filter Buttons */}
      <section className="py-12 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="flex flex-wrap justify-center gap-4 mb-12">
            {categories.map((category) => (
              <Button
                key={category}
                variant={selectedCategory === category ? "default" : "outline"}
                onClick={() => setSelectedCategory(category)}
                className={`rounded-full px-6 ${
                  selectedCategory === category
                    ? "bg-gray-900 hover:bg-gray-800 text-white"
                    : "border-gray-300 text-gray-700 hover:bg-gray-50"
                }`}
              >
                {category}
              </Button>
            ))}
          </div>

          {/* Gallery Grid */}
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredImages.map((image) => (
              <Card
                key={image.id}
                className="border-0 shadow-sm hover:shadow-lg transition-shadow overflow-hidden group"
              >
                <div className="relative h-64 overflow-hidden">
                  <Image
                    src={image.src || "/placeholder.svg"}
                    alt={image.alt}
                    fill
                    className="object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                  <div className="absolute inset-0 bg-black/0 group-hover:bg-black/20 transition-colors duration-300" />
                  <div className="absolute bottom-4 left-4 text-white opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <p className="text-sm font-medium">{image.alt}</p>
                    <p className="text-xs text-gray-200">{image.category}</p>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-24 bg-gray-50/30">
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-4xl font-light text-gray-900 mb-6">Ready to Experience This in Person?</h2>
          <p className="text-xl text-gray-600 mb-12 max-w-2xl mx-auto">
            Book your stay today and immerse yourself in the luxury and comfort that defines SpiceHotels.
          </p>
          <Button
            asChild
            size="lg"
            className="bg-cyan-400 hover:bg-cyan-500 text-white px-12 py-4 rounded-full text-lg"
          >
            <a href="/booking">Book Your Stay</a>
          </Button>
        </div>
      </section>
    </div>
  )
}
