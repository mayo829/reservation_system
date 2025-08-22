// components/DatePicker.tsx - Updated with Hotel ARI API Integration
'use client';

import { useState, useEffect, useCallback } from 'react';
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Label } from "@/components/ui/label";
import { CalendarIcon } from "lucide-react";
import { format, addDays, startOfDay } from "date-fns";

interface DatePickerProps {
  checkIn: Date | undefined;
  checkOut: Date | undefined;
  onCheckInChange: (date: Date | undefined) => void;
  onCheckOutChange: (date: Date | undefined) => void;
  layout?: 'horizontal' | 'vertical' | 'compact';
  showLabels?: boolean;
  className?: string;
  hotelId?: string; // Hotel ID for availability checking
  adults?: number;   // Number of adults for availability checking
  children?: number; // Number of children for availability checking
}

interface HotelAriResponse {
  hotel_aris: Array<{
    id_hotel: string;
    date_from: string;
    date_to: string;
    currency: string;
    total_rooms: number;
    total_available_rooms: number;
    total_unavailable_rooms: number;
    total_booked_rooms: number;
    room_types: Array<{
      id_room_type: string;
      base_price: number;
      base_price_with_tax: number;
      total_price: number;
      total_price_with_tax: number;
      name: string;
      rooms: {
        available: Record<string, any>;
        booked: Record<string, any>;
        unavailable: Record<string, any>;
      };
    }>;
  }>;
}

export function DatePicker({
  checkIn,
  checkOut,
  onCheckInChange,
  onCheckOutChange,
  layout = 'horizontal',
  showLabels = true,
  className = '',
  hotelId,
  adults = 2,
  children = 0
}: DatePickerProps) {
  
  // Cache for unavailable dates
  const [unavailableDatesCache, setUnavailableDatesCache] = useState<Set<string>>(new Set());
  const [isCheckingAvailability, setIsCheckingAvailability] = useState(false);

  // API configuration - same as your test HTML
  const apiUrl = process.env.NEXT_PUBLIC_QLOAPPS_ARI_API_URL;
  const wsKey = process.env.NEXT_PUBLIC_QLOAPPS_API_KEY;
  
  // Function to create request XML for the Hotel ARI API
  const createRequestXML = (hotelId: string, dateFrom: string, dateTo: string, adults: number, children: number): string => {
    return `
    <qloapps xmlns:xlink="http://www.w3.org/1999/xlink">
        <hotel_ari>
            <id_hotel>${hotelId}</id_hotel>
            <date_from>${dateFrom}</date_from>
            <date_to>${dateTo}</date_to>
            <get_available_rooms>1</get_available_rooms>
            <get_booked_rooms>1</get_booked_rooms>
            <get_unavailable_rooms>1</get_unavailable_rooms>
            <date_wise_breakdown>1</date_wise_breakdown>
            <associations>
                <room_occupancies>
                    <room_occupancy>
                        <adults>${adults}</adults>
                        <children>${children}</children>
                    </room_occupancy>
                </room_occupancies>
            </associations>
        </hotel_ari>
    </qloapps>
    `;
  };

  // Function to check availability for a date range using Hotel ARI API
  const checkDateRangeAvailability = useCallback(async (hotelId: string, startDate: Date, endDate: Date, adults: number, children: number): Promise<Set<string>> => {
    const fullUrl = `${apiUrl}?ws_key=${wsKey}&output_format=JSON`;
    const dateFrom = format(startDate, 'yyyy-MM-dd');
    const dateTo = format(endDate, 'yyyy-MM-dd');
    const requestXML = createRequestXML(hotelId, dateFrom, dateTo, adults, children);

    console.log('Making API request to:', fullUrl);
    console.log('Request XML:', requestXML);

    try {
      const response = await fetch(fullUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/xml',
          'Accept': 'application/json',
        },
        body: requestXML
      });

      if (!response.ok) {
        throw new Error(`API request failed with status: ${response.status}`);
      }

      const responseData: HotelAriResponse = await response.json();
      console.log('API Response:', responseData);
      
      const unavailableDates = new Set<string>();

      // Process each day in the response
      responseData.hotel_aris.forEach(dayData => {
        const dateKey = dayData.date_from;
        
        // A date is considered unavailable if there are no available rooms
        // Based on your example, 2025-08-21 has total_available_rooms: 0 and should be red
        const isUnavailable = dayData.total_available_rooms === 0;

        console.log(`Date ${dateKey}: available_rooms=${dayData.total_available_rooms}, booked_rooms=${dayData.total_booked_rooms}, unavailable=${isUnavailable}`);

        if (isUnavailable) {
          unavailableDates.add(dateKey);
        }
      });

      console.log(`Found ${unavailableDates.size} unavailable dates for hotel ${hotelId}:`, Array.from(unavailableDates));
      return unavailableDates;

    } catch (error) {
      console.error('Error checking date range availability:', error);
      return new Set(); // Return empty set on error
    }
  }, []);

  // Function to check if a specific date is unavailable (synchronous, uses cache)
  const isDateUnavailable = (date: Date): boolean => {
    if (!hotelId) return false;
    
    const dateKey = format(date, 'yyyy-MM-dd');
    const isUnavailable = unavailableDatesCache.has(dateKey);
    
    // Debug logging
    if (isUnavailable) {
      console.log(`Date ${dateKey} is marked as unavailable`);
    }
    
    return isUnavailable;
  };

  // Pre-load availability for visible date range when hotel changes
  useEffect(() => {
    if (!hotelId) {
      setUnavailableDatesCache(new Set());
      return;
    }

    const loadAvailability = async () => {
      setIsCheckingAvailability(true);
      
      try {
        const today = startOfDay(new Date());
        const endDate = addDays(today, 90); // Check next 90 days
        
        console.log(`Loading availability for hotel ${hotelId} from ${format(today, 'yyyy-MM-dd')} to ${format(endDate, 'yyyy-MM-dd')}...`);
        
        const unavailableDates = await checkDateRangeAvailability(hotelId, today, endDate, adults, children);
        setUnavailableDatesCache(unavailableDates);
        
        console.log(`Cache updated with ${unavailableDates.size} unavailable dates:`, Array.from(unavailableDates));
        
      } catch (error) {
        console.error('Error loading availability:', error);
        setUnavailableDatesCache(new Set()); // Clear cache on error
      } finally {
        setIsCheckingAvailability(false);
      }
    };

    loadAvailability();
  }, [hotelId, adults, children, checkDateRangeAvailability]);

  const getLayoutClasses = () => {
    switch (layout) {
      case 'vertical':
        return 'space-y-4';
      case 'compact':
        return 'grid grid-cols-2 gap-2';
      case 'horizontal':
      default:
        return 'grid md:grid-cols-2 gap-4';
    }
  };

  const getButtonClasses = () => {
    switch (layout) {
      case 'compact':
        return 'h-12 w-full justify-start text-left font-normal bg-transparent px-2';
      default:
        return 'h-12 w-full justify-start text-left font-normal bg-transparent px-3';
    }
  };

  const getTextClasses = () => {
    switch (layout) {
      case 'compact':
        return 'text-xs truncate';
      default:
        return 'text-sm';
    }
  };

  const getIconClasses = () => {
    switch (layout) {
      case 'compact':
        return 'mr-1 h-4 w-4 flex-shrink-0';
      default:
        return 'mr-2 h-4 w-4 flex-shrink-0';
    }
  };

  const formatDate = (date: Date | undefined, placeholder: string) => {
    if (!date) return placeholder;
    
    switch (layout) {
      case 'compact':
        return format(date, "MMM dd");
      default:
        return format(date, "PPP");
    }
  };

  return (
    <div className={`${getLayoutClasses()} ${className}`}>
      {/* Check-in Date */}
      <div className="space-y-2">
        {showLabels && (
          <Label className="text-sm font-medium text-gray-700">
            {layout === 'compact' ? 'Check-in' : 'Check-in Date'}
          </Label>
        )}
        <Popover>
          <PopoverTrigger asChild>
            <Button
              variant="outline"
              className={getButtonClasses()}
            >
              <CalendarIcon className={getIconClasses()} />
              <span className={getTextClasses()}>
                {formatDate(checkIn, layout === 'compact' ? 'Check-in' : 'Select check-in date')}
              </span>
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-auto p-0">
            <Calendar
              mode="single"
              selected={checkIn}
              onSelect={onCheckInChange}
              initialFocus
              disabled={(date) => {
                // Disable past dates
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                
                if (date < today) {
                  return true;
                }
                
                // Disable unavailable future dates
                return isDateUnavailable(date);
              }}
              modifiers={{
                unavailable: (date) => {
                  const today = new Date();
                  today.setHours(0, 0, 0, 0);
                  
                  // Only mark future dates as unavailable (red)
                  return date >= today && isDateUnavailable(date);
                },
              }}
              modifiersStyles={{
                unavailable: {
                  backgroundColor: '#ef4444',
                  color: 'white',
                  opacity: 0.7,
                }
              }}
              modifiersClassNames={{
                unavailable: 'bg-red-500 text-white opacity-70 cursor-not-allowed',
              }}
            />
          </PopoverContent>
        </Popover>
      </div>

      {/* Check-out Date */}
      <div className="space-y-2">
        {showLabels && (
          <Label className="text-sm font-medium text-gray-700">
            {layout === 'compact' ? 'Check-out' : 'Check-out Date'}
          </Label>
        )}
        <Popover>
          <PopoverTrigger asChild>
            <Button
              variant="outline"
              className={getButtonClasses()}
            >
              <CalendarIcon className={getIconClasses()} />
              <span className={getTextClasses()}>
                {formatDate(checkOut, layout === 'compact' ? 'Check-out' : 'Select check-out date')}
              </span>
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-auto p-0">
            <Calendar
              mode="single"
              selected={checkOut}
              onSelect={onCheckOutChange}
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
                
                // Disable unavailable future dates
                return isDateUnavailable(date);
              }}
              modifiers={{
                unavailable: (date) => {
                  const today = new Date();
                  today.setHours(0, 0, 0, 0);
                  
                  // Only mark future dates as unavailable (red)
                  return date >= today && isDateUnavailable(date);
                },
              }}
              modifiersStyles={{
                unavailable: {
                  backgroundColor: '#ef4444',
                  color: 'white',
                  opacity: 0.7,
                }
              }}
              modifiersClassNames={{
                unavailable: 'bg-red-500 text-white opacity-70 cursor-not-allowed',
              }}
            />
          </PopoverContent>
        </Popover>
      </div>
      
      {/* Loading indicator for availability checking */}
      {isCheckingAvailability && hotelId && (
        <div className="text-xs text-gray-500 text-center">
          Checking availability...
        </div>
      )}
    </div>
  );
}