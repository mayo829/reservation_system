"use client"
import { Suspense } from "react"
import ConfirmationDetails from "./ConfirmationDetails"
import Loading from "@/components/ui/loading" // Create a loading component

export default function ConfirmationPage() {
  return (
    <Suspense fallback={<Loading />}>
      <ConfirmationDetails />
    </Suspense>
  )
}