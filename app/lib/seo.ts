// lib/seo.ts
import { Metadata } from 'next'

type SEOParams = {
  title: string
  description: string
  image?: string
  url?: string
}

export function generateSEO({
  title,
  description,
  image = '/default-og.jpg',
  url = 'https://reservation.isba.ai/',
}: SEOParams): Metadata {
  return {
    title,
    description,
    openGraph: {
      title,
      description,
      url,
      siteName: 'Lisbon Hotel Reservations',
      images: [
        {
          url: image,
          width: 1200,
          height: 630,
          alt: title,
        },
      ],
      locale: 'en_US',
      type: 'website',
    },
    twitter: {
      card: 'summary_large_image',
      title,
      description,
      images: [image],
    },
    robots: {
      index: true,
      follow: true,
      googleBot: {
        index: true,
        follow: true,
        'max-image-preview': 'large',
      },
    },
  }
}
