// app/api/bookings/route.ts

import { NextRequest, NextResponse } from "next/server";
import { sendBookingEmails } from "@/app/components/SendMail";

// Simulated database (replace with your real DB)
const bookings: any[] = [];

export async function POST(req: NextRequest) {
  try {
    const { guestInfo, cartItems, specialRequests } = await req.json();

    // console.log("Email API received. ")
    // console.log("GuestInfo: ", guestInfo)
    // console.log("cartItems: ", cartItems)
    // console.log("specialRequests: ", specialRequests)
    

    if (!cartItems || !Array.isArray(cartItems) || cartItems.length === 0) {
      return NextResponse.json({ success: false, error: "No hotels in cart" });
    }

    const confirmationNumber = `LH${Math.random().toString(36).substr(2, 9).toUpperCase()}`;

    const bookingRecords = cartItems.map((item: any) => ({
      id: confirmationNumber,
      firstName: guestInfo.firstName,
      lastName: guestInfo.lastName,
      email: guestInfo.email,
      hotelName: item.hotelName,
      checkIn: item.checkIn,
      checkOut: item.checkOut,
      specialRequests,
      total: item.totalPrice,
    }));

    bookings.push(...bookingRecords);

    // Prepare customer email
    const customerBookingData = {
      firstName: guestInfo.firstName,
      lastName: guestInfo.lastName,
      email: guestInfo.email,
      confirmationNumber,
      specialRequests,
      hotels: bookingRecords.map(({ hotelName, checkIn, checkOut, total }) => ({
        hotelName,
        checkIn,
        checkOut,
        total: total,
      })),
      total: bookingRecords.reduce((sum, b) => sum + b.total, 0),
    };

    // console.log("Booking data: ", customerBookingData)

    await sendBookingEmails(customerBookingData);

    return NextResponse.json({ success: true, bookingId: confirmationNumber });
  } catch (error) {
    return NextResponse.json({ success: false, error: (error as Error).message });
  }
}