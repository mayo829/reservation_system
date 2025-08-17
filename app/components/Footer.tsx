import Link from "next/link"
import { MapPin, Phone, Mail } from "lucide-react"

export default function Footer() {
  return (
    <footer className="bg-gray-900 text-white">
      <div className="container mx-auto px-6 py-16">
        <div className="grid md:grid-cols-4 gap-8">
          <div>
            <h3 className="text-2xl font-medium mb-4">Lisboa Hotels</h3>
            <p className="text-gray-400 mb-4">Luxury accommodations in the world's most beautiful destinations.</p>
          </div>

          <div>
            <h4 className="text-lg font-medium mb-4">Quick Links</h4>
            <div className="space-y-2">
              <Link href="/about" className="block text-gray-400 hover:text-white transition-colors">
                About Us
              </Link>
              <Link href="/booking" className="block text-gray-400 hover:text-white transition-colors">
                Booking
              </Link>
              <Link href="/rooms" className="block text-gray-400 hover:text-white transition-colors">
                View Our Rooms
              </Link>
              <Link href="/contact" className="block text-gray-400 hover:text-white transition-colors">
                Contact
              </Link>
            </div>
          </div>

          <div>
            <h4 className="text-lg font-medium mb-4">Locations</h4>
            <div className="space-y-2 text-gray-400">
              <p>Anchorage, Alaska</p>
              <p>Lisboa, Portugal</p>
            </div>
          </div>

          <div>
            <h4 className="text-lg font-medium mb-4">Contact Info</h4>
            <div className="space-y-3">
              <div className="flex items-center gap-2 text-gray-400">
                <Phone className="w-4 h-4" />
                <span>+1 (555) 123-4567</span>
              </div>
              <div className="flex items-center gap-2 text-gray-400">
                <Mail className="w-4 h-4" />
                <span>info@lisboahotels.com</span>
              </div>
              <div className="flex items-center gap-2 text-gray-400">
                <MapPin className="w-4 h-4" />
                <span>Lisboa, Portugal</span>
              </div>
            </div>
          </div>
        </div>

        <div className="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
          <p>&copy; 2024 Lisboa Hotels. All rights reserved.</p>
        </div>
      </div>
    </footer>
  )
}
