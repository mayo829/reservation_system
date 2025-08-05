"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Separator } from "@/components/ui/separator"
import { Textarea } from "@/components/ui/textarea"
import { CreditCard, MapPin, Trash2, CheckCircle, Lock, User } from "lucide-react"
import Image from "next/image"
import { useCart } from "../context/CartContext"

export default function CheckoutPage() {
  const { cartItems, removeFromCart, clearCart } = useCart()
  const [isProcessing, setIsProcessing] = useState(false)
  const router = useRouter()

  // Form states
  const [guestInfo, setGuestInfo] = useState({
    firstName: "",
    lastName: "",
    email: "",
    phone: "",
  })

  const [billingInfo, setBillingInfo] = useState({
    address: "",
    city: "",
    state: "",
    zipCode: "",
    country: "",
  })

  const [paymentInfo, setPaymentInfo] = useState({
    cardNumber: "",
    expiryDate: "",
    cvv: "",
    cardName: "",
  })

  const [specialRequests, setSpecialRequests] = useState("")

  const subtotal = cartItems.reduce((sum, item) => sum + item.totalPrice, 0)
  const taxes = subtotal * 0.12 // 12% tax
  const total = subtotal + taxes

  // If cart is empty, show empty state
  if (cartItems.length === 0) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16">
        <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
          <div className="container mx-auto px-6">
            <div className="max-w-2xl mx-auto text-center">
              <h1 className="text-4xl font-light text-gray-900 mb-6">Your Cart is Empty</h1>
              <p className="text-xl text-gray-600 mb-8">Add some bookings to get started</p>
              <Button asChild className="bg-darkblue hover:bg-darkblue/90 text-white px-8 py-3 rounded-full">
                <a href="/">Browse Hotels</a>
              </Button>
            </div>
          </div>
        </section>
      </div>
    )
  }

  const removeItem = (id: string) => {
    removeFromCart(id)
  }

  const handleCheckout = async () => {
    setIsProcessing(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000))

    clearCart() // Clear the cart after successful checkout
    setIsProcessing(false)
    
    // Redirect to confirmation page
    router.push('/confirmation')
  }

  const isFormValid = () => {
    return (
      guestInfo.firstName &&
      guestInfo.lastName &&
      guestInfo.email &&
      guestInfo.phone &&
      billingInfo.address &&
      billingInfo.city &&
      billingInfo.state &&
      billingInfo.zipCode &&
      paymentInfo.cardNumber &&
      paymentInfo.expiryDate &&
      paymentInfo.cvv &&
      paymentInfo.cardName
    )
  }



  if (cartItems.length === 0) {
    return (
      <div className="min-h-screen bg-yellow-50/20 pt-16">
        <section className="py-24 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
          <div className="container mx-auto px-6">
            <div className="max-w-2xl mx-auto text-center">
              <h1 className="text-4xl md:text-5xl font-light text-gray-900 mb-6">
                Your <span className="font-medium text-darkblue">Cart</span>
              </h1>
              <p className="text-xl text-gray-600 mb-8">Your cart is currently empty.</p>
              <Button
                onClick={() => (window.location.href = "/")}
                className="bg-darkblue hover:bg-darkblue/90 text-white px-8 py-3 rounded-full"
              >
                Start Booking
              </Button>
            </div>
          </div>
        </section>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-yellow-50/20 pt-16">
      {/* Hero Section */}
      <section className="py-12 bg-gradient-to-b from-yellow-50/20 to-yellow-50/40">
        <div className="container mx-auto px-6">
          <div className="text-center mb-8">
            <h1 className="text-4xl md:text-5xl font-light text-gray-900 mb-4">
              <span className="font-medium text-darkblue">Checkout</span>
            </h1>
            <p className="text-gray-600">Complete your reservation</p>
          </div>
        </div>
      </section>

      <section className="py-8 bg-yellow-50/20">
        <div className="container mx-auto px-6">
          <div className="grid lg:grid-cols-3 gap-8">
            {/* Main Checkout Form */}
            <div className="lg:col-span-2 space-y-6">
              {/* Guest Information */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light flex items-center gap-2">
                    <User className="w-5 h-5 text-darkblue" />
                    Guest Information
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="firstName">First Name *</Label>
                      <Input
                        id="firstName"
                        placeholder="Enter first name"
                        value={guestInfo.firstName}
                        onChange={(e) => setGuestInfo({ ...guestInfo, firstName: e.target.value })}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="lastName">Last Name *</Label>
                      <Input
                        id="lastName"
                        placeholder="Enter last name"
                        value={guestInfo.lastName}
                        onChange={(e) => setGuestInfo({ ...guestInfo, lastName: e.target.value })}
                      />
                    </div>
                  </div>
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="email">Email Address *</Label>
                      <Input
                        id="email"
                        type="email"
                        placeholder="Enter email"
                        value={guestInfo.email}
                        onChange={(e) => setGuestInfo({ ...guestInfo, email: e.target.value })}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="phone">Phone Number *</Label>
                      <Input
                        id="phone"
                        type="tel"
                        placeholder="Enter phone number"
                        value={guestInfo.phone}
                        onChange={(e) => setGuestInfo({ ...guestInfo, phone: e.target.value })}
                      />
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Billing Address */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light flex items-center gap-2">
                    <MapPin className="w-5 h-5 text-darkblue" />
                    Billing Address
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="address">Street Address *</Label>
                    <Input
                      id="address"
                      placeholder="Enter street address"
                      value={billingInfo.address}
                      onChange={(e) => setBillingInfo({ ...billingInfo, address: e.target.value })}
                    />
                  </div>
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="city">City *</Label>
                      <Input
                        id="city"
                        placeholder="Enter city"
                        value={billingInfo.city}
                        onChange={(e) => setBillingInfo({ ...billingInfo, city: e.target.value })}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="state">State *</Label>
                      <Input
                        id="state"
                        placeholder="Enter state"
                        value={billingInfo.state}
                        onChange={(e) => setBillingInfo({ ...billingInfo, state: e.target.value })}
                      />
                    </div>
                  </div>
                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="zipCode">ZIP Code *</Label>
                      <Input
                        id="zipCode"
                        placeholder="Enter ZIP code"
                        value={billingInfo.zipCode}
                        onChange={(e) => setBillingInfo({ ...billingInfo, zipCode: e.target.value })}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="country">Country *</Label>
                      <Select
                        value={billingInfo.country}
                        onValueChange={(value) => setBillingInfo({ ...billingInfo, country: value })}
                      >
                        <SelectTrigger>
                          <SelectValue placeholder="Select country" />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="us">United States</SelectItem>
                          <SelectItem value="ca">Canada</SelectItem>
                          <SelectItem value="uk">United Kingdom</SelectItem>
                          <SelectItem value="au">Australia</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Payment Information */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light flex items-center gap-2">
                    <CreditCard className="w-5 h-5 text-darkblue" />
                    Payment Information
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="cardName">Cardholder Name *</Label>
                    <Input
                      id="cardName"
                      placeholder="Name on card"
                      value={paymentInfo.cardName}
                      onChange={(e) => setPaymentInfo({ ...paymentInfo, cardName: e.target.value })}
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="cardNumber">Card Number *</Label>
                    <Input
                      id="cardNumber"
                      placeholder="1234 5678 9012 3456"
                      value={paymentInfo.cardNumber}
                      onChange={(e) => setPaymentInfo({ ...paymentInfo, cardNumber: e.target.value })}
                    />
                  </div>
                  <div className="grid grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="expiryDate">Expiry Date *</Label>
                      <Input
                        id="expiryDate"
                        placeholder="MM/YY"
                        value={paymentInfo.expiryDate}
                        onChange={(e) => setPaymentInfo({ ...paymentInfo, expiryDate: e.target.value })}
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="cvv">CVV *</Label>
                      <Input
                        id="cvv"
                        placeholder="123"
                        value={paymentInfo.cvv}
                        onChange={(e) => setPaymentInfo({ ...paymentInfo, cvv: e.target.value })}
                      />
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Special Requests */}
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light">Special Requests</CardTitle>
                </CardHeader>
                <CardContent>
                  <Textarea
                    placeholder="Any special requests or preferences..."
                    className="min-h-[100px]"
                    value={specialRequests}
                    onChange={(e) => setSpecialRequests(e.target.value)}
                  />
                </CardContent>
              </Card>
            </div>

            {/* Order Summary */}
            <div className="space-y-6">
              <Card className="border-0 shadow-sm">
                <CardHeader>
                  <CardTitle className="text-xl font-light">Order Summary</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  {cartItems.length === 0 ? (
                    <div className="text-center py-8">
                      <p className="text-gray-500">Your cart is empty</p>
                      <p className="text-sm text-gray-400 mt-2">Add some bookings to get started</p>
                    </div>
                  ) : (
                    cartItems.map((item) => (
                    <div key={item.id} className="space-y-3">
                      <div className="flex gap-3">
                        <div className="relative w-16 h-16 rounded-lg overflow-hidden">
                          <Image
                            src={item.image || "/placeholder.svg"}
                            alt={item.hotelName}
                            fill
                            className="object-cover"
                          />
                        </div>
                        <div className="flex-1 min-w-0">
                          <h4 className="font-medium text-sm text-gray-900 truncate">{item.hotelName}</h4>
                          <p className="text-xs text-gray-500">{item.location}</p>
                          <p className="text-xs text-gray-500">{item.roomType}</p>
                        </div>
                        <button onClick={() => removeItem(item.id)} className="text-gray-400 hover:text-red-500 p-1">
                          <Trash2 className="w-4 h-4" />
                        </button>
                      </div>

                      <div className="text-xs text-gray-600 space-y-1">
                        <div className="flex justify-between">
                          <span>Check-in:</span>
                          <span>{new Date(item.checkIn).toLocaleDateString()}</span>
                        </div>
                        <div className="flex justify-between">
                          <span>Check-out:</span>
                          <span>{new Date(item.checkOut).toLocaleDateString()}</span>
                        </div>
                        <div className="flex justify-between">
                          <span>Guests:</span>
                          <span>
                            {item.adults} Adults, {item.children} Children
                          </span>
                        </div>
                        <div className="flex justify-between">
                          <span>
                            {item.nights} nights × ${item.pricePerNight}
                          </span>
                          <span className="font-medium">${item.totalPrice}</span>
                        </div>
                      </div>
                      <Separator />
                    </div>
                  ))
                  )}

                  <div className="space-y-2 text-sm">
                    <div className="flex justify-between">
                      <span>Subtotal</span>
                      <span>${subtotal.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Taxes & Fees</span>
                      <span>${taxes.toFixed(2)}</span>
                    </div>
                    <Separator />
                    <div className="flex justify-between font-medium text-lg">
                      <span>Total</span>
                      <span>${total.toFixed(2)}</span>
                    </div>
                  </div>

                  <Button
                    onClick={handleCheckout}
                    disabled={!isFormValid() || isProcessing}
                    className="w-full bg-darkblue hover:bg-darkblue/90 text-white py-3 disabled:opacity-50"
                  >
                    <Lock className="w-4 h-4 mr-2" />
                    {isProcessing ? "Processing..." : `Complete Booking - $${total.toFixed(2)}`}
                  </Button>

                  <p className="text-xs text-gray-500 text-center">Your payment information is secure and encrypted</p>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}
