package com.service;

import java.util.Set;

import jakarta.ejb.*;
import com.entities.Film;
import com.entities.Reservation;
import com.entities.Salle;
import com.entities.SalleProg;
import com.entities.Seance;



@Local
public interface Cinema {
 
    public Set<Film> list ();  
    public Set<Film> findByPattern (String pattern);
    public Film findFilm (int id);  
    public Film createFilm (String name, String description, String genre);  
    public Set<SalleProg> getAllSalleProg ();   
    public void update (Film f);  
   
	Set<Salle> listSalles();
	void reserve(Seance seance, Utilisateur u, int nbrPlaces)
			throws PlusDePlaceException, UserNotFoundException, SoldeNegatifException, SoldeInsuffisantException;
	
	 public void cancelReservation(Reservation reservation);
	  public Reservation findReservationById(int reservationId);
	
	
	
}
