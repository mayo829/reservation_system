import type React from "react"
import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import Navigation from "./components/Navigation"
import Footer from "./components/Footer"
import { CartProvider } from "./context/CartContext"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "Lisboa Hotels - Luxury Accommodations Worldwide",
  description:
    "Experience luxury and comfort in our carefully curated collection of premium accommodations across the world's most beautiful destinations.",
    generator: 'v0.dev'
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <CartProvider>
          <Navigation />
          {children}
          <Footer />
        </CartProvider>
      </body>
    </html>
  )
}
