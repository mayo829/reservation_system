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
    <Card className="border-0 shadow-lg bg-white w-full max-w-none">
      <CardContent className="p-6 w-full">
        <div className="grid grid-cols-1 xl:grid-cols-6 gap-4 items-end w-full min-w-full">
          {/* Hotel Selection - Takes more space */}
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
                        <div className="text-xs text-gray-500">{hotel.location}</div>
                      </div>
                    </div>
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* Date Selection - Separate Check-in and Check-out */}
          <div className="xl:col-span-2 space-y-2 w-full min-w-0">
            <Label className="text-sm font-medium text-gray-700">Dates</Label>
            <div className="grid grid-cols-2 gap-2">
              {/* Check-in Date */}
              <Popover>
                <PopoverTrigger asChild>
                  <Button
                    variant="outline"
                    className="h-12 w-full justify-start text-left font-normal bg-transparent px-2"
                  >
                    <CalendarIcon className="mr-1 h-4 w-4 flex-shrink-0" />
                    <span className="text-xs truncate">
                      {checkIn ? format(checkIn, "MMM dd") : "Check-in"}
                    </span>
                  </Button>
                </PopoverTrigger>
                <PopoverContent className="w-auto p-0">
                  <Calendar
                    mode="single"
                    selected={checkIn}
                    onSelect={setCheckIn}
                    initialFocus
                    disabled={(date) => {
                      // Disable past dates
                      const today = new Date();
                      today.setHours(0, 0, 0, 0);
                      return date < today;
                    }}
                  />
                </PopoverContent>
              </Popover>

              {/* Check-out Date */}
              <Popover>
                <PopoverTrigger asChild>
                  <Button
                    variant="outline"
                    className="h-12 w-full justify-start text-left font-normal bg-transparent px-2"
                  >
                    <CalendarIcon className="mr-1 h-4 w-4 flex-shrink-0" />
                    <span className="text-xs truncate">
                      {checkOut ? format(checkOut, "MMM dd") : "Check-out"}
                    </span>
                  </Button>
                </PopoverTrigger>
                <PopoverContent className="w-auto p-0">
                  <Calendar
                    mode="single"
                    selected={checkOut}
                    onSelect={setCheckOut}
                    initialFocus
                    disabled={(date) => {
                      // Disable past dates
                      const today = new Date();
                      today.setHours(0, 0, 0, 0);
                      
                      if (date < today) {
                        return true;
                      }

                      // Disable dates before or equal to check-in date
                      if (checkIn && date <= checkIn) {
                        return true;
                      }
                      
                      return false;
                    }}
                  />
                </PopoverContent>
              </Popover>
            </div>
          </div>

          {/* Guests - Optimized Layout */}
          <div className="space-y-2 w-full min-w-0">
            <Label className="text-sm font-medium text-gray-700">Guests</Label>
            <div className="grid grid-cols-2 gap-1 w-full">
              <Select value={adults} onValueChange={setAdults}>
                <SelectTrigger className="h-12 text-xs w-full min-w-0">
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
                <SelectTrigger className="h-12 text-xs w-full min-w-0">
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
          <div className="w-full min-w-0">
            <Button
              onClick={handleSearch}
              disabled={!isSearchEnabled || isLoading}
              className="h-12 w-full min-w-0 bg-darkblue hover:bg-darkblue/90 text-white px-6 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Search className="w-4 h-4 mr-2 flex-shrink-0" />
              <span className="hidden sm:inline truncate">{isLoading ? "Loading..." : "Search"}</span>
            </Button>
          </div>
        </div>

        {/* Mobile Layout - Stack vertically on small screens */}
        <div className="xl:hidden mt-4 w-full">
          <div className="grid grid-cols-2 gap-2 w-full">
            <div className="space-y-2 w-full min-w-0">
              <Label className="text-sm font-medium text-gray-700">Adults</Label>
              <Select value={adults} onValueChange={setAdults}>
                <SelectTrigger className="h-12 w-full min-w-0">
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
            <div className="space-y-2 w-full min-w-0">
              <Label className="text-sm font-medium text-gray-700">Children</Label>
              <Select value={children} onValueChange={setChildren}>
                <SelectTrigger className="h-12 w-full min-w-0">
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