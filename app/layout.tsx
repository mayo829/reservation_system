import type React from "react"
import type { Metadata } from "next"
import { Playfair_Display } from "next/font/google"
import "./globals.css"
import Navigation from "./components/Navigation"
import Footer from "./components/Footer"
import { CartProvider } from "./context/CartContext"
import { HotelsProvider } from './context/HotelsContext'

const inter = Playfair_Display({ 
  subsets: ["latin"],
  weight: "400"  // Or "200" for even thinner
})

export const metadata: Metadata = {
  title: 'Hotel Reservations | Oeiras Lagoas Parque & Luxury Lisbon Apartment',
  description:
    'Book your stay at Oeiras Lagoas Parque or Luxury Lisbon Apartment T2. Choose from double rooms, executive suites, or luxury two-bedroom apartments with free WiFi, air conditioning, and modern amenities. Perfect for families and travelers visiting Lisbon.',
  keywords: [
    'Oeiras Lagoas Parque',
    'Luxury Lisbon Apartment',
    'Hotel Oeiras',
    'Hotel Lisbon',
    'Lisbon Apartment Rental',
    'Lisbon Hotel Booking',
    'Portugal Hotels',
    'Lisbon Family Stay',
    'Lisbon Vacation Rental',
    'Oeiras Hotels',
    'Double Room Lisbon',
    'Executive Suite Lisbon',
    'Two Bedroom Apartment Lisbon',
    'Book Hotel Lisbon',
    'Free WiFi Hotel Lisbon',
    'Air Conditioning Hotel Lisbon'
  ],
  authors: [{ name: 'Hotel Reservations App' }],
  creator: 'Hotel Reservations App',
  openGraph: {
    title: 'Book Hotels in Lisbon | Oeiras Lagoas Parque & Luxury Lisbon Apartment',
    description:
      'Discover the best stays in Lisbon. Oeiras Lagoas Parque offers double rooms and executive suites, while Luxury Lisbon Apartment T2 provides a modern two-bedroom experience. Book your hotel with free WiFi, air conditioning, and family-friendly comfort.',
    url: 'https://reservation.isba.ai/',
    siteName: 'Lisbon Hotel Reservations',
    images: [
      {
        url: '/og-hotel.jpg',
        width: 1200,
        height: 630,
        alt: 'Lisbon Hotels - Oeiras Lagoas Parque & Luxury Lisbon Apartment',
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Book Hotels in Lisbon | Oeiras Lagoas Parque & Luxury Lisbon Apartment',
    description:
      'Find your perfect stay in Lisbon. Double rooms, executive suites, and luxury apartments with free WiFi & air conditioning. Reserve today.',
    creator: '@yourhotelbrand',
    images: ['/og-hotel.jpg'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <HotelsProvider>
          <CartProvider>
            <Navigation />
              {children}
            <Footer />
          </CartProvider>
        </HotelsProvider>
      </body>
    </html>
  )
}
