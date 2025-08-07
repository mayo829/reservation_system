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
              className="flex items-center gap-2 text-white hover:text-gray-200 transition-colors"
              onClick={() => setIsOpen(!isOpen)}
            >
              {isOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
              <span className="font-medium">Menu</span>
            </button>
          </div>

          {/* Center - Logo */}
          <div className="justify-self-center flex items-center justify-center -mt-2">
            <Link href="/" className="hover:opacity-80 transition-opacity">
              <svg width="48" height="48" viewBox="0 0 80 80" xmlns="http://www.w3.org/2000/svg">
                <path d="M20 50 L40 30 L60 50 L60 65 L20 65 Z" 
                      fill="none" 
                      stroke="white" 
                      strokeWidth="2" 
                      strokeLinejoin="round"/>
              </svg>
            </Link>
          </div>

          {/* Right Side - Cart and Login */}
          <div className="justify-self-end flex items-center gap-4">
            {/* Cart/Checkout Button */}
            <Link
              href="/checkout"
              className="flex items-center gap-2 text-white hover:text-gray-900 transition-colors px-3 py-2 rounded-full hover:bg-gray-100 relative"
            >
              <ShoppingCart className="w-5 h-5" />
              <span className="font-medium hidden sm:inline">Cart</span>
              {/* Cart Badge - dynamic count */}
              {cartCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-darkblue text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                  {cartCount}
                </span>
              )}
            </Link>

            {/* Login Button */}
            <Link
              href="/login"
              className="flex items-center gap-2 text-white hover:text-gray-900 transition-colors px-3 py-2 rounded-full hover:bg-gray-100"
            >
              <User className="w-5 h-5" />
              <span className="font-medium hidden sm:inline">Login</span>
            </Link>
          </div>
        </div>

        {/* Dropdown Menu */}
        {isOpen && (
          <div className="absolute top-16 left-6 w-64 bg-white border border-gray-100 shadow-lg rounded-b-lg">
            <div className="flex flex-col py-4">
            <Link
                href="/booking"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-200 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                Room Availability
              </Link>
              <Link
                href="/about"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-50 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                About
              </Link>
              <Link
                href="/gallery"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-50 transition-colors"
                onClick={() => setIsOpen(false)}
              >
                Gallery
              </Link>
              <Link
                href="/contact"
                className="px-6 py-3 text-gray-700 hover:text-gray-900 hover:bg-gray-50 transition-colors"
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
