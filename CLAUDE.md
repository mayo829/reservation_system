# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
Lisboa Hotels reservation system - a luxury hotel chain booking platform with properties in Manhattan, Malibu, Aspen, and Miami. Frontend-only implementation using Next.js with mock data.

## Essential Commands

```bash
# Development
npm run dev          # Start development server at http://localhost:3000

# Build & Production
npm run build        # Build for production (Note: has ESLint errors - use NEXT_DISABLE_ESLINT_ON_BUILD=true)
npm run start        # Start production server
npm run lint         # Run ESLint (currently has violations)

# Build without linting (for rapid prototyping)
NEXT_DISABLE_ESLINT_ON_BUILD=true npm run build
```

## Architecture & Structure

### Tech Stack
- **Next.js 15.2.4** with App Router
- **React 19.0.0** with TypeScript 5
- **Tailwind CSS** with shadcn/ui components
- **React Context** for state management
- No backend/database - all data is mocked

### Key Architecture Patterns

1. **State Management**: Cart functionality uses React Context (`/app/context/CartContext.tsx`) for global state across the booking flow. Cart data is session-only.

2. **Component Organization**:
   - `/components/ui/` - shadcn/ui library (40+ reusable components)
   - `/app/components/` - Page-specific components (BookingBar, Navigation, etc.)
   - Components use Client Components (`"use client"`) when needed for interactivity

3. **Booking Flow**: Linear page progression:
   ```
   / (homepage) → /booking → /checkout → /confirmation
   ```
   Each page passes data via URL parameters and context state.

4. **Data Handling**: 
   - No real API - mock delays with `setTimeout()`
   - Hotel data hardcoded in components (Manhattan ID: 1, Malibu: 2, Aspen: 3, Miami: 4)
   - Form submissions simulate API calls with artificial delays

### Critical Implementation Details

- **Color Scheme**: Primary brand color is darkblue (#070738) used throughout
- **URL Parameters**: Booking form auto-populates from URL params (location, checkin, checkout, guests, rooms)
- **Mock API Pattern**: Functions like `simulateApiCall()` add realistic delays
- **Error Handling**: Currently minimal - focus on happy path
- **Mobile Responsive**: All components designed for mobile-first

### Known Issues & Workarounds

- ESLint violations exist - use `NEXT_DISABLE_ESLINT_ON_BUILD=true` for builds
- No actual payment processing - checkout is mock only
- Cart persistence only during session - refreshing loses cart data
- Image optimization warnings from Next.js Image component

### Development Tips

When modifying booking flow:
1. Check `CartContext.tsx` for cart state structure
2. Maintain URL parameter passing between pages
3. Keep mock delays consistent (typically 1-2 seconds)

When adding new hotels:
1. Update hardcoded data in relevant components
2. Maintain ID convention (sequential integers)
3. Ensure images exist in `/public/images/`