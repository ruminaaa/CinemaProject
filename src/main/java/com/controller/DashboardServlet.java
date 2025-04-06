package com.controller;

import com.entities.Reservation;

import com.service.SoldeNegatifException;
import com.service.UserNotFoundException;
import com.service.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.ejb.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private Utilisateur utilisateurService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("userName") == null) {
            response.sendRedirect("login");
            return;
        }

        String userName = (String) request.getSession().getAttribute("userName");

        try {
       
            utilisateurService.init(userName, null);

       
            List<Reservation> reservations = utilisateurService.getUserReservations(userName);

        
            request.setAttribute("reservations", reservations);

       
            request.setAttribute("balance", utilisateurService.solde());

        } catch (UserNotFoundException e) {
            request.setAttribute("errorMessage", "Error fetching reservations: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
        }

    
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        try {
            float debitAmount = Float.parseFloat(request.getParameter("debitAmount"));

        
            String userName = (String) request.getSession().getAttribute("userName");

            if (userName == null) {
                response.sendRedirect("login");
                return;
            }

        
            utilisateurService.init(userName, null);

      
            utilisateurService.AddMoney(debitAmount);

          
            request.getSession().setAttribute("balance", utilisateurService.solde());

            response.sendRedirect("dashboard");

        } catch (NumberFormatException e) {
         
            request.setAttribute("errorMessage", "Invalid amount entered.");
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (SoldeNegatifException | UserNotFoundException e) {
           
            request.setAttribute("errorMessage", "Error with transaction: " + e.getMessage());
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
     
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        }
    }
}
