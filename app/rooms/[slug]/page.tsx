// app/rooms/[slug]/page.tsx
import RoomPageClient from "./room-page-client"
import { Metadata } from "next"

// Replace with your real DB/API fetch
async function getRoomData(slug: string) {
  const rooms = {
    "oeiras-executive-suite": {
      type: "Executive Suite",
      description: "Luxury suite with city views, a queen bed, and modern amenities.",
      hotelName: "Oeiras Lagoas Parque",
      gallery: ["/images/oeiras-suite1.jpg", "/images/oeiras-suite2.jpg"],
    },
    "lisbon-apartment": {
      type: "Luxury Two-Bedroom Apartment",
      description: "Spacious T2 apartment in Lisbon with 2 bathrooms, living room, and full kitchen.",
      hotelName: "Luxury Lisbon Apartment T2",
      gallery: ["/images/lisbon1.jpg", "/images/lisbon2.jpg"],
    },
  }

  return rooms[slug] || null
}

// ✅ Dynamic metadata
export async function generateMetadata(
  { params }: { params: { slug: string } }
): Promise<Metadata> {
  const room = await getRoomData(params.slug)

  if (!room) {
    return {
      title: "Room Not Found | Hotel Booking",
      description: "This room could not be found.",
    }
  }

  return {
    title: `${room.type} at ${room.hotelName} | Book Now`,
    description: room.description,
    openGraph: {
      title: `${room.type} at ${room.hotelName}`,
      description: room.description,
      url: `https://yourdomain.com/rooms/${params.slug}`,
      images: room.gallery.map((img) => ({
        url: img,
        width: 1200,
        height: 630,
      })),
    },
    twitter: {
      card: "summary_large_image",
      title: `${room.type} at ${room.hotelName}`,
      description: room.description,
      images: room.gallery.slice(0, 1),
    },
  }
}

export default function RoomPage({ params }: { params: { slug: string } }) {
  return <RoomPageClient />
}
