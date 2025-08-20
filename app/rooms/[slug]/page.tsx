// app/rooms/[slug]/page.tsx - Server component wrapper for dynamic generation
import RoomPageClient from './room-page-client';

// Server component that renders the client component
// No generateStaticParams needed for dynamic generation
export default function RoomPage() {
  return <RoomPageClient />;
}