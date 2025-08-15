// app/rooms/[slug]/page.tsx - Server component wrapper
import RoomPageClient from './room-page-client';

// Server component with generateStaticParams
export async function generateStaticParams() {
  // Return common room types that you expect to have
  return [
    { slug: 'deluxe-suite' },
    { slug: 'delux-rooms' },
    { slug: 'general-rooms' },
    { slug: 'executive-rooms' },
    { slug: 'luxury-rooms' },
    { slug: 'luxury' },
    { slug: 'standard-room' },
    { slug: 'executive-room' },
    { slug: 'presidential-suite' },
    { slug: 'luxury-suite' },
    { slug: 'family-room' },
    { slug: 'business-room' },
    { slug: 'ocean-view-room' },
    { slug: 'city-view-room' },
    { slug: 'junior-suite' },
    { slug: 'superior-room' },
    { slug: 'classic-room' },
    { slug: 'premium-room' },
    { slug: 'penthouse-suite' },
    { slug: 'garden-view-room' }
  ];
}

// Server component that renders the client component
export default function RoomPage() {
  return <RoomPageClient />;
}