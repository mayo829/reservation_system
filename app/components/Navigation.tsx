"use client"

import { useState } from "react"
import Link from "next/link"
import { Menu, X, User, ShoppingCart } from "lucide-react"
import { useCart } from "../context/CartContext"

export default function Navigation() {
  const [isOpen, setIsOpen] = useState(false)
  const { cartCount } = useCart()

  return (
    <nav className="fixed top-0 w-full bg-gray-900 backdrop-blur-sm border-b border-gray-100 z-50">
      <div className="container mx-auto px-6 relative">
        <div className="grid grid-cols-3 items-center h-16">
          {/* Left Side - Menu Button */}
          <div className="justify-self-start">
            <button
              className="flex items-center gap-2 text-white hover:opacity-50 transition-opacity"
              onClick={() => setIsOpen(!isOpen)}
            >
              {isOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>

          {/* Center - Logo */}
          <div className="justify-self-center flex items-center justify-center -mt-2">
            <Link href="/" className="hover:opacity-50 transition-opacity">
              <svg width="42" height="42" viewBox="0 0 80 80" xmlns="http://www.w3.org/2000/svg">
                <path d="M20 50 L40 30 L60 50 L60 65 L20 65 Z" 
                      fill="none" 
                      stroke="white" 
                      strokeWidth="2" 
                      strokeLinejoin="round"/>
              </svg>
            </Link>
          </div>

          {/* Right Side - Cart and Login */}
          <div className="justify-self-end flex items-center">
            {/* Cart/Checkout Button */}
            <Link
              href="/checkout"
              className="relative flex items-center gap-2 text-white hover:opacity-50 transition-opacity px-1.5 py-2"
            >
              <ShoppingCart className="w-5 h-5" />
              {/* Cart Badge - dynamic count */}
              {cartCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">

                  {cartCount}
                </span>
              )}
            </Link>

            {/* Login Button */}
            <Link
              href="/login"
              className="flex items-center gap-2 text-white hover:opacity-50 transition-opacity px-1.5 py-2"
            >
              <User className="w-5 h-5" />
            </Link>
          </div>
        </div>

        {/* Dropdown Menu */}
        {isOpen && (
          <div className="absolute top-16 left-6 w-64 bg-white border border-gray-100 shadow-lg rounded-b-lg">
            <div className="flex flex-col py-4">
              <Link
                href="/about"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-200 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                About
              </Link>
              <Link
                href="/gallery"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-200 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                Gallery
              </Link>
              <Link
                href="/booking"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-200 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                Booking
              </Link>
              <Link
                href="/contact"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-200 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                Contact
              </Link>
            </div>
          </div>
        )}
      </div>
    </nav>
  )
}
