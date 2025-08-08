"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Calendar } from "@/components/ui/calendar"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { CalendarIcon, MapPin, Search } from "lucide-react"
import { format } from "date-fns"
import { useRouter } from "next/navigation"
import { useHotels } from "../context/HotelsContext"

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
      // Navigate to booking page with pre-filled data
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
    <Card className="border-0 shadow-lg bg-white">
      <CardContent className="p-6">
        <div className="grid grid-cols-1 xl:grid-cols-6 gap-4 items-end">
          {/* Hotel Selection - Takes more space */}
          <div className="xl:col-span-2 space-y-2">
            <Label className="text-sm font-medium text-gray-700">Hotel Location</Label>
            <Select value={selectedHotel} onValueChange={setSelectedHotel} disabled={isLoading}>
              <SelectTrigger className="h-12">
                <SelectValue placeholder={isLoading ? "Loading hotels..." : "Choose location"} />
              </SelectTrigger>
              <SelectContent>
                {hotels.map((hotel) => (
                  <SelectItem key={hotel.id} value={hotel.id}>
                    <div className="flex items-center gap-2">
                      <MapPin className="w-4 h-4" />
                      <div>
                        <div className="font-medium text-sm">{hotel.name}</div>
                        <div className="text-xs text-gray-500">{hotel.location}</div>
                      </div>
                    </div>
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* Check-in Date - Compact */}
          <div className="space-y-2">
            <Label className="text-sm font-medium text-gray-700">Check-in</Label>
            <Popover>
              <PopoverTrigger asChild>
                <Button
                  variant="outline"
                  className="h-12 w-full justify-center text-center font-normal bg-transparent px-2"
                >
                  <CalendarIcon className="mr-1 h-4 w-4" />
                  <span className="text-sm">{checkIn ? format(checkIn, "MMM dd") : "Select"}</span>
                </Button>
              </PopoverTrigger>
              <PopoverContent className="w-auto p-0">
                <Calendar 
                  mode="single" 
                  selected={checkIn} 
                  onSelect={setCheckIn} 
                  initialFocus
                  disabled={(date) => date < new Date(new Date().setHours(0, 0, 0, 0))}
                />
              </PopoverContent>
            </Popover>
          </div>

          {/* Check-out Date - Compact */}
          <div className="space-y-2">
            <Label className="text-sm font-medium text-gray-700">Check-out</Label>
            <Popover>
              <PopoverTrigger asChild>
                <Button
                  variant="outline"
                  className="h-12 w-full justify-center text-center font-normal bg-transparent px-2"
                >
                  <CalendarIcon className="mr-1 h-4 w-4" />
                  <span className="text-sm">{checkOut ? format(checkOut, "MMM dd") : "Select"}</span>
                </Button>
              </PopoverTrigger>
              <PopoverContent className="w-auto p-0">
                <Calendar 
                  mode="single" 
                  selected={checkOut} 
                  onSelect={setCheckOut} 
                  initialFocus
                  disabled={(date) => date < new Date(new Date().setHours(0, 0, 0, 0))}
                />
              </PopoverContent>
            </Popover>
          </div>

          {/* Guests - Optimized Layout */}
          <div className="space-y-2">
            <Label className="text-sm font-medium text-gray-700">Guests</Label>
            <div className="grid grid-cols-2 gap-1">
              <Select value={adults} onValueChange={setAdults}>
                <SelectTrigger className="h-12 text-xs">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="1">1 Adult</SelectItem>
                  <SelectItem value="2">2 Adults</SelectItem>
                  <SelectItem value="3">3 Adults</SelectItem>
                  <SelectItem value="4">4+ Adults</SelectItem>
                </SelectContent>
              </Select>
              <Select value={children} onValueChange={setChildren}>
                <SelectTrigger className="h-12 text-xs">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="0">0 Kids</SelectItem>
                  <SelectItem value="1">1 Kid</SelectItem>
                  <SelectItem value="2">2 Kids</SelectItem>
                  <SelectItem value="3">3+ Kids</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>

          {/* Search Button */}
          <Button
            onClick={handleSearch}
            disabled={!isSearchEnabled || isLoading}
            className="h-12 bg-darkblue hover:bg-darkblue/90 text-white px-6 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <Search className="w-4 h-4 mr-2" />
            <span className="hidden sm:inline">{isLoading ? "Loading..." : "Search"}</span>
          </Button>
        </div>

        {/* Mobile Layout - Stack vertically on small screens */}
        <div className="xl:hidden mt-4">
          <div className="grid grid-cols-2 gap-2">
            <div className="space-y-2">
              <Label className="text-sm font-medium text-gray-700">Adults</Label>
              <Select value={adults} onValueChange={setAdults}>
                <SelectTrigger className="h-12">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="1">1 Adult</SelectItem>
                  <SelectItem value="2">2 Adults</SelectItem>
                  <SelectItem value="3">3 Adults</SelectItem>
                  <SelectItem value="4">4+ Adults</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <Label className="text-sm font-medium text-gray-700">Children</Label>
              <Select value={children} onValueChange={setChildren}>
                <SelectTrigger className="h-12">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="0">0 Children</SelectItem>
                  <SelectItem value="1">1 Child</SelectItem>
                  <SelectItem value="2">2 Children</SelectItem>
                  <SelectItem value="3">3+ Children</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}