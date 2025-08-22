"use client"

import BookingBar from "./BookingBar"

export default function HeroSection() {
  return (
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

      <div className="container mx-auto px-6 w-full">
        <BookingBar />
      </div>
    </section>
  )
}
