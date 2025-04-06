package com.controller;

import java.io.IOException;
import com.entities.Reservation;
import com.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancelReservation")
public class CancelReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private Cinema cinemaBean;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationIdParam = request.getParameter("reservationId");

        try {
            if (reservationIdParam != null && !reservationIdParam.isEmpty()) {
                int reservationId = Integer.parseInt(reservationIdParam);
                
                // Use CinemaBean to find and cancel the reservation
                Reservation reservation = cinemaBean.findReservationById(reservationId);
                
                if (reservation != null) {
                    // Call the service layer to cancel the reservation
                    cinemaBean.cancelReservation(reservation);
                    // Redirect to dashboard after successful cancellation
                    response.sendRedirect("dashboard");  // Make sure 'dashboard' exists
                } else {
                    request.setAttribute("errorMessage", "Reservation not found.");
                    request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Reservation ID is required.");
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid reservation ID format.");
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        }
    }
}
