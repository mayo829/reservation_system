// components/DatePicker.tsx - Reusable Date Picker Component
'use client';

import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Label } from "@/components/ui/label";
import { CalendarIcon } from "lucide-react";
import { format } from "date-fns";

// Simulate unavailable dates (replace with real API data)
const isDateUnavailable = (date: Date) => {
  // Simulate some unavailable dates based on patterns
  // In a real application, this would come from your booking API
  
  const dayOfMonth = date.getDate();
  const dayOfWeek = date.getDay();
  const month = date.getMonth();
  
  // Example patterns for unavailable dates:
  // 1. Certain dates of the month (simulate maintenance days)
  if (dayOfMonth === 15 || dayOfMonth === 30) {
    return true;
  }
  
  // 2. Some weekends in peak season are fully booked
  if ((dayOfWeek === 5 || dayOfWeek === 6) && (month >= 5 && month <= 8)) {
    // Not all weekends, just some based on a pattern
    return (dayOfMonth % 3 === 0);
  }
  
  // 3. Random pattern for demonstration (every 7th day in some months)
  if (month === 6 || month === 7) { // July and August
    return (dayOfMonth % 7 === 0);
  }
  
  // 4. Simulate holiday blackout dates
  const dateString = date.toISOString().split('T')[0];
  const blackoutDates = [
    '2025-12-24', '2025-12-25', '2025-12-31', // Christmas and New Year
    '2025-07-04', // Independence Day
    '2025-11-28', '2025-11-29', // Thanksgiving weekend
  ];
  
  if (blackoutDates.includes(dateString)) {
    return true;
  }
  
  return false;
};

interface DatePickerProps {
  checkIn: Date | undefined;
  checkOut: Date | undefined;
  onCheckInChange: (date: Date | undefined) => void;
  onCheckOutChange: (date: Date | undefined) => void;
  layout?: 'horizontal' | 'vertical' | 'compact';
  showLabels?: boolean;
  className?: string;
}

export function DatePicker({
  checkIn,
  checkOut,
  onCheckInChange,
  onCheckOutChange,
  layout = 'horizontal',
  showLabels = true,
  className = ''
}: DatePickerProps) {

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
    </div>
  );
}