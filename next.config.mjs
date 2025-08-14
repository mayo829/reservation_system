/** @type {import('next').NextConfig} */
const nextConfig = {
  // Remove the export output for VPS
  // output: 'export', // Remove this line
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true,
  },
}

export default nextConfig