"use client"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { MapPin, Phone, Mail, Clock } from "lucide-react"

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-light text-gray-900 mb-6">
            Contact <span className="font-medium text-cyan-400">Us</span>
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            We're here to help make your stay exceptional. Reach out to us for reservations, inquiries, or any
            assistance you may need.
          </p>
        </div>
      </section>

      <section className="py-12 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="grid lg:grid-cols-2 gap-12">
            {/* Contact Form */}
            <Card className="border-0 shadow-sm">
              <CardHeader>
                <CardTitle className="text-2xl font-light">Send us a Message</CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid md:grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="firstName">First Name</Label>
                    <Input id="firstName" placeholder="Enter your first name" />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="lastName">Last Name</Label>
                    <Input id="lastName" placeholder="Enter your last name" />
                  </div>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="email">Email Address</Label>
                  <Input id="email" type="email" placeholder="Enter your email address" />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="phone">Phone Number</Label>
                  <Input id="phone" type="tel" placeholder="Enter your phone number" />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="subject">Subject</Label>
                  <Select>
                    <SelectTrigger>
                      <SelectValue placeholder="Select inquiry type" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="reservation">Reservation Inquiry</SelectItem>
                      <SelectItem value="existing">Existing Booking</SelectItem>
                      <SelectItem value="general">General Information</SelectItem>
                      <SelectItem value="feedback">Feedback</SelectItem>
                      <SelectItem value="corporate">Corporate Bookings</SelectItem>
                      <SelectItem value="other">Other</SelectItem>
                    </SelectContent>
                  </Select>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="message">Message</Label>
                  <Textarea
                    id="message"
                    placeholder="Please provide details about your inquiry..."
                    className="min-h-[120px]"
                  />
                </div>

                <Button className="w-full bg-cyan-400 hover:bg-cyan-500 text-white rounded-full py-3">
                  Send Message
                </Button>
              </CardContent>
            </Card>

            {/* Contact Information */}
            <div className="space-y-8">
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-2xl font-light">Get in Touch</CardTitle>
                </CardHeader>
                <CardContent className="space-y-6">
                  <div className="flex items-start gap-4">
                    <Phone className="w-6 h-6 text-cyan-400 mt-1" />
                    <div>
                      <h3 className="font-medium text-gray-900 mb-1">Phone</h3>
                      <p className="text-gray-600">+1 (555) 123-4567</p>
                      <p className="text-sm text-gray-500">Available 24/7 for reservations</p>
                    </div>
                  </div>

                  <div className="flex items-start gap-4">
                    <Mail className="w-6 h-6 text-cyan-400 mt-1" />
                    <div>
                      <h3 className="font-medium text-gray-900 mb-1">Email</h3>
                      <p className="text-gray-600">info@spicehotels.com</p>
                      <p className="text-sm text-gray-500">We'll respond within 24 hours</p>
                    </div>
                  </div>

                  <div className="flex items-start gap-4">
                    <MapPin className="w-6 h-6 text-cyan-400 mt-1" />
                    <div>
                      <h3 className="font-medium text-gray-900 mb-1">Headquarters</h3>
                      <p className="text-gray-600">
                        123 Luxury Avenue
                        <br />
                        New York, NY 10001
                      </p>
                    </div>
                  </div>

                  <div className="flex items-start gap-4">
                    <Clock className="w-6 h-6 text-cyan-400 mt-1" />
                    <div>
                      <h3 className="font-medium text-gray-900 mb-1">Business Hours</h3>
                      <p className="text-gray-600">Monday - Friday: 9:00 AM - 8:00 PM EST</p>
                      <p className="text-gray-600">Weekend: 10:00 AM - 6:00 PM EST</p>
                      <p className="text-sm text-gray-500">Emergency support available 24/7</p>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Hotel Locations */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-2xl font-light">Our Locations</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="space-y-3">
                    <div>
                      <h4 className="font-medium text-gray-900">SpiceHotels Manhattan</h4>
                      <p className="text-gray-600 text-sm">456 Park Avenue, New York, NY 10022</p>
                      <p className="text-gray-600 text-sm">+1 (555) 123-4568</p>
                    </div>

                    <div>
                      <h4 className="font-medium text-gray-900">SpiceHotels Malibu</h4>
                      <p className="text-gray-600 text-sm">789 Pacific Coast Highway, Malibu, CA 90265</p>
                      <p className="text-gray-600 text-sm">+1 (555) 123-4569</p>
                    </div>

                    <div>
                      <h4 className="font-medium text-gray-900">SpiceHotels Aspen</h4>
                      <p className="text-gray-600 text-sm">321 Mountain View Drive, Aspen, CO 81611</p>
                      <p className="text-gray-600 text-sm">+1 (555) 123-4570</p>
                    </div>

                    <div>
                      <h4 className="font-medium text-gray-900">SpiceHotels Miami Beach</h4>
                      <p className="text-gray-600 text-sm">654 Ocean Drive, Miami Beach, FL 33139</p>
                      <p className="text-gray-600 text-sm">+1 (555) 123-4571</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* FAQ Section */}
      <section className="py-24 bg-gray-50/30">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-light text-gray-900 mb-4">Frequently Asked Questions</h2>
            <p className="text-gray-600">Quick answers to common inquiries</p>
          </div>

          <div className="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
            <Card className="border-0 shadow-sm">
              <CardContent className="p-6">
                <h3 className="font-medium text-gray-900 mb-2">What is your cancellation policy?</h3>
                <p className="text-gray-600 text-sm">
                  Free cancellation up to 48 hours before check-in. Cancellations within 48 hours are subject to a
                  one-night charge.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm">
              <CardContent className="p-6">
                <h3 className="font-medium text-gray-900 mb-2">Do you offer airport transfers?</h3>
                <p className="text-gray-600 text-sm">
                  Yes, we provide complimentary airport transfers for stays of 3 nights or more. Please contact us to
                  arrange.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm">
              <CardContent className="p-6">
                <h3 className="font-medium text-gray-900 mb-2">Are pets allowed?</h3>
                <p className="text-gray-600 text-sm">
                  We welcome well-behaved pets at select locations. A pet fee of $50 per night applies. Please inform us
                  during booking.
                </p>
              </CardContent>
            </Card>

            <Card className="border-0 shadow-sm">
              <CardContent className="p-6">
                <h3 className="font-medium text-gray-900 mb-2">What amenities are included?</h3>
                <p className="text-gray-600 text-sm">
                  All properties include free WiFi, 24/7 concierge, daily housekeeping, and access to fitness
                  facilities.
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>
    </div>
  )
}
