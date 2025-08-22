"use client"

import HeroSection from "@/app/components/HeroSection"
import FeaturesSection from "@/app/components/FeaturesSection"
import FeaturedHotels from "@/app/components/FeaturedHotels"
import CTASection from "@/app/components/CTASection"

export default function HomePage() {
  return (
    <div className="min-h-screen bg-yellow-100/30">
      <HeroSection />
      <FeaturesSection />
      <FeaturedHotels />
      <CTASection />
    </div>
  )
}
