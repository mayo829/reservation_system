"use client"

import { Button } from "@/components/ui/button"
import Link from "next/link"

export default function CTASection() {
  return (
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
  )
}
