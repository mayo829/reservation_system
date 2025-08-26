import nodemailer from "nodemailer";
import dotenv from "dotenv";

dotenv.config();

interface HotelBooking {
  hotelName: string;
  checkIn: string;
  checkOut: string;
  total: number;
}

interface BookingInfo {
  firstName: string;
  lastName: string;
  email: string; // customer email
  confirmationNumber: string;
  hotels: HotelBooking[]; // multiple hotels
  specialRequests?: string;
}

export async function sendBookingEmails(booking: BookingInfo) {
  try {

    let adminEmail = process.env.EMAIL_USER;
    let adminPass = process.env.EMAIL_PASS;

    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        user: adminEmail,
        pass: adminPass,
      },
    });

    // --- Customer Email ---
    let customerEmailText = `Hello ${booking.firstName} ${booking.lastName},\n\nThank you for completing your booking. Your reservation details are below:\n\n`;

    booking.hotels.forEach((hotel, idx) => {
      customerEmailText += `Hotel ${idx + 1}: ${hotel.hotelName}\nCheck-in: ${hotel.checkIn}\nCheck-out: ${hotel.checkOut}\nTotal Due: $${hotel.total.toFixed(2)}\n\n`;
    });

    customerEmailText += `Special Requests: ${booking.specialRequests || "None"}\n\n`;
    customerEmailText += `An email has also been sent to notify the hotel staff of your reservation. A representative will contact you shortly to complete your payment and booking. Thank you!\n\nThis is an automated email. Please do not reply directly to this message.\n\nBest regards,\nLisboa Hotels Customer Support Team`;

    // console.log("Customer email being sent: ", customerEmailText)

    await transporter.sendMail({
      from: `"Booking System" <${process.env.EMAIL_USER}>`,
      to: booking.email,
      cc: ["queuebots1@gmail.com"],
      subject: `Booking Confirmation – ${booking.confirmationNumber}`,
      text: customerEmailText,
    });

    console.log("✅ Customer email sent successfully");

    // --- Admin Emails ---
    for (const hotel of booking.hotels) {

      const adminEmailText = `New booking received:\n\nGuest: ${booking.firstName} ${booking.lastName}\nEmail: ${booking.email}\nHotel: ${hotel.hotelName}\nCheck-in: ${hotel.checkIn}\nCheck-out: ${hotel.checkOut}\nBooking Confirmation Number: ${booking.confirmationNumber}\nTotal Due: $${hotel.total.toFixed(2)}\nSpecial Requests: ${booking.specialRequests || "None"}\n\nPlease process and confirm this booking as needed.`;

      await transporter.sendMail({
        from: `"Booking System" <${process.env.EMAIL_USER}>`,
        to: adminEmail,
        subject: `New Booking – ${hotel.hotelName} (${booking.confirmationNumber})`,
        text: adminEmailText,
      });

      console.log(`✅ Admin email sent successfully for ${hotel.hotelName}`);
    }

  } catch (error) {
    console.error("❌ Error sending Admin email:", error);
  }
}
