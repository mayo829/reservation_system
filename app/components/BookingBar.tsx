"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { CalendarIcon, MapPin, Search } from "lucide-react"
import { useRouter } from "next/navigation"
import { useHotels } from "../context/HotelsContext"
import { DatePicker } from '@/app/components/DatePicker'  // Import reusable DatePicker

export default function BookingBar() {
  const [selectedHotel, setSelectedHotel] = useState("")
  const [checkIn, setCheckIn] = useState<Date>()
  const [checkOut, setCheckOut] = useState<Date>()
  const [adults, setAdults] = useState("1")
  const [children, setChildren] = useState("0")
  const router = useRouter()
  const { hotels, isLoading } = useHotels()

  const handleSearch = () => {
    if (selectedHotel && checkIn && checkOut) {
      const params = new URLSearchParams({
        hotel: selectedHotel,
        checkIn: checkIn.toISOString(),
        checkOut: checkOut.toISOString(),
        adults,
        children,
      })
      router.push(`/booking?${params.toString()}`)
    }
  }

  const isSearchEnabled = selectedHotel && checkIn && checkOut

  return (
    <Card className="border-0 shadow-lg bg-white w-full max-w-none">
      <CardContent className="p-6 w-full">
        <div className="grid grid-cols-1 xl:grid-cols-6 gap-4 items-end w-full min-w-full">
          {/* Hotel Selection */}
          <div className="xl:col-span-2 space-y-2 w-full min-w-0">
            <Label className="text-sm font-medium text-gray-700">Location</Label>
            <Select value={selectedHotel} onValueChange={setSelectedHotel} disabled={isLoading}>
              <SelectTrigger className="h-12 w-full min-w-0">
                <SelectValue placeholder={isLoading ? "Loading hotels..." : "Choose location"} />
              </SelectTrigger>
              <SelectContent>
                {hotels.map((hotel) => (
                  <SelectItem key={hotel.id} value={hotel.id}>
                    <div className="flex items-center gap-2">
                      <MapPin className="w-4 h-4" />
                      <div>
                        <div className="font-medium text-sm">{hotel.name}</div>
                        <div className="text-xs text-gray-500">{hotel.city}</div>
                      </div>
                    </div>
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* Date Selection using reusable DatePicker */}
          <div className="xl:col-span-2 space-y-2 w-full min-w-0">
            <Label className="text-sm font-medium text-gray-700">Dates</Label>
            <DatePicker
              checkIn={checkIn}
              checkOut={checkOut}
              onCheckInChange={setCheckIn}
              onCheckOutChange={setCheckOut}
              layout="horizontal"
              showLabels={false}
              hotelId={selectedHotel}
              adults={parseInt(adults)}
              children={parseInt(children)}
            />
          </div>

          {/* Guests */}
          <div className="xl:col-span-1 space-y-2">
            <Label className="text-sm font-medium text-gray-700">Adults</Label>
            <Select value={adults} onValueChange={setAdults}>
              <SelectTrigger>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="1">1 Adult</SelectItem>
                <SelectItem value="2">2 Adults</SelectItem>
                <SelectItem value="3">3 Adults</SelectItem>
                <SelectItem value="4">4 Adults</SelectItem>
                <SelectItem value="5">5+ Adults</SelectItem>
              </SelectContent>
            </Select>
          </div>

          <div className="xl:col-span-1 space-y-2">
            <Label className="text-sm font-medium text-gray-700">Children</Label>
            <Select value={children} onValueChange={setChildren}>
              <SelectTrigger>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="0">No Children</SelectItem>
                <SelectItem value="1">1 Child</SelectItem>
                <SelectItem value="2">2 Children</SelectItem>
                <SelectItem value="3">3 Children</SelectItem>
                <SelectItem value="4">4+ Children</SelectItem>
              </SelectContent>
            </Select>
          </div>

          {/* Search Button */}
          <div className="xl:col-span-6">
            <Button
              className="w-full h-12 bg-cyan-400 hover:bg-cyan-500 text-white rounded-full flex items-center justify-center gap-2"
              onClick={handleSearch}
              disabled={!isSearchEnabled}
            >
              <Search className="w-4 h-4" />
              Search
            </Button>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
