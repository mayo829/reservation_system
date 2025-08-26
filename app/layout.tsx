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
  title: "Lisboa Hotels - Luxury Accommodations Worldwide",
  description:
    "Experience luxury and comfort in our carefully curated collection of premium accommodations across the world's most beautiful destinations.",
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
