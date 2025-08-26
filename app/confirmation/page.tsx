"use client"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { CheckCircle, Mail, Phone, MapPin, Calendar, Users } from "lucide-react"
import { format } from "date-fns"
import { useSearchParams } from "next/navigation";
import Link from "next/link"

export default function ConfirmationPage() {
  const params = useSearchParams();
  const confirmationNumber = params.get("id")

  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto">
            {/* Success Header */}
            <div className="text-center mb-12">
              <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle className="w-10 h-10 text-darkblue" />
              </div>
              <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
                Booking <span className="font-medium text-darkblue">Confirmed!</span>
              </h1>
              <p className="text-xl text-gray-600">
                Thank you for choosing Lisboa Hotels. Your reservation has been successfully confirmed.
              </p>
            </div>

            {/* Confirmation Details */}
            <div className="grid lg:grid-cols-2 gap-8">
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-2xl font-light flex items-center gap-2">
                    <CheckCircle className="w-6 h-6 text-darkblue" />
                    Reservation Details
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="bg-darkblue/5 p-4 rounded-lg">
                    <p className="text-sm text-gray-600 mb-1">Confirmation Number</p>
                    <p className="text-2xl font-bold text-gray-900">{confirmationNumber}</p>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <p className="text-sm text-gray-600 mb-1">Booking Date</p>
                      <p className="font-medium">{format(new Date(), "PPP")}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-600 mb-1">Status</p>
                      <p className="font-medium text-green-600">Confirmed</p>
                    </div>
                  </div>

                  <div className="border-t pt-4">
                    <p className="text-sm text-gray-600 mb-2">What's Next?</p>
                    <div className="space-y-3">
                      <div className="flex items-center gap-3">
                        <Mail className="w-4 h-4 text-darkblue" />
                        <span className="text-sm">Confirmation email sent</span>
                      </div>
                      <div className="flex items-center gap-3">
                        <Phone className="w-4 h-4 text-darkblue" />
                        <span className="text-sm">24/7 support available</span>
                      </div>
                      <div className="flex items-center gap-3">
                        <MapPin className="w-4 h-4 text-darkblue" />
                        <span className="text-sm">Hotel details in email</span>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Contact Information */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-2xl font-light">Need Help?</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="space-y-3">
                    <div className="flex items-center gap-3">
                      <Phone className="w-5 h-5 text-darkblue" />
                      <div>
                        <p className="font-medium">24/7 Support</p>
                        <p className="text-sm text-gray-600">+1 (555) 123-4567</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <Mail className="w-5 h-5 text-darkblue" />
                      <div>
                        <p className="font-medium">Email Support</p>
                        <p className="text-sm text-gray-600">support@lisboahotels.com</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <MapPin className="w-5 h-5 text-darkblue" />
                      <div>
                        <p className="font-medium">Head Office</p>
                        <p className="text-sm text-gray-600">123 Luxury Ave, New York, NY</p>
                      </div>
                    </div>
                  </div>

                  <div className="bg-gray-50 p-4 rounded-lg">
                    <p className="text-sm text-gray-600 mb-2">Important Information</p>
                    <ul className="text-xs text-gray-600 space-y-1">
                      <li>• Check-in time: 3:00 PM</li>
                      <li>• Check-out time: 11:00 AM</li>
                      <li>• Free cancellation up to 24 hours before arrival</li>
                      <li>• Present confirmation number at check-in</li>
                    </ul>
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Action Buttons */}
            <div className="flex flex-col sm:flex-row gap-4 justify-center mt-12">
              <Button
                asChild
                variant="outline"
                className="border-gray-300 text-gray-700 hover:bg-gray-50 px-8 py-3 rounded-full"
              >
                <Link href="/">Return to Home</Link>
              </Button>
              <Button
                asChild
                className="bg-darkblue hover:bg-darkblue/90 text-white px-8 py-3 rounded-full"
              >
                <Link href="/booking">Book Another Stay</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
} 