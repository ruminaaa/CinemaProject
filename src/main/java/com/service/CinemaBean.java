package com.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Set;
import java.util.Date;
import java.util.HashSet;

import com.entities.Film;
import com.entities.Reservation;
import com.entities.Salle;
import com.entities.SalleProg;
import com.entities.Seance;

@Stateless
public class CinemaBean implements Cinema {
	
	@PersistenceContext(unitName = "cinemaUnit")
	EntityManager em;
	@Override
	public Set<Film> list()   {
		Query q = em.createNamedQuery("findAllFilms");
		List<Film> filmList  = q.getResultList();
		Set<Film> res = new HashSet<>(filmList);
		if (res.isEmpty()) {
          
        }
		return res;
	}
	
	@Override
	public Set<Film> findByPattern(String pattern) {
	    Query q = em.createNamedQuery("findFilmByPattern");
	    q.setParameter("pattern", "%" + pattern + "%");
	    List<Film> filmList = q.getResultList();
	    return new HashSet<>(filmList);
	}

	public Film findFilm(int filmId) {
     
        Film film = em.find(Film.class, filmId);
        if (film != null) {
       
            film.getSalleprog().size(); 
        }
        return film;
    }
	public Seance findSeanceById(int seanceId) {
	    EntityManager entityManager = Persistence.createEntityManagerFactory("cinemaUnit").createEntityManager();
	    
	    try {
	
	        return entityManager.createNamedQuery("findSeanceById", Seance.class)
	                            .setParameter("id", seanceId)
	                            .getSingleResult();
	    } catch (NoResultException e) {
	       
	        return null;
	    } finally {
	    
	        if (entityManager.isOpen()) {
	            entityManager.close();
	        }
	    }
	}
	@Transactional
	@Override
	public void reserve(Seance seance, Utilisateur u, int nbrPlaces) 
	        throws PlusDePlaceException, UserNotFoundException, SoldeNegatifException, SoldeInsuffisantException {

	    int reservedPlaces = seance.getPlaces(); 
	    int totalCapacity = seance.getSalleprog().getSalle().getCapacite(); 

	   
	    if (u.solde() < nbrPlaces * seance.getTarif()) { 
	        throw new SoldeInsuffisantException();
	    }

	
	    if (reservedPlaces + nbrPlaces > totalCapacity) {
	        throw new PlusDePlaceException();
	    }

	   
	    u.debite(nbrPlaces * seance.getTarif());

	    Reservation reservation = new Reservation();
	    reservation.setUserId(u.getUserId());  
	    reservation.setUserName(u.getName());  
	    reservation.setSeance(seance);  
	    reservation.setNbrPlaces(nbrPlaces);  
	    reservation.setTotalCost(nbrPlaces * seance.getTarif()); 
	    reservation.setReservationDate(new Date());  

	  
	    em.persist(reservation);

	  
	    seance.setPlaces(reservedPlaces + nbrPlaces);
	    em.merge(seance); 
	}




	@Override
	public Set<SalleProg> getAllSalleProg() {
	    Query q = em.createNamedQuery("findAllSalleProg");
	    List<SalleProg> salleProgList = q.getResultList();
	    return new HashSet<>(salleProgList);
	}

	 @Override
	    public Set<Salle> listSalles() {
	        return new HashSet<>(em.createQuery("SELECT s FROM Salle s", Salle.class).getResultList());
	    }
	
	public Film createFilm(String name, String description, String genre) {
	
	    Film newFilm = new Film();
	    
	
	    newFilm.setName(name);
	    newFilm.setDescription(description);
	    newFilm.setGenre(genre);
	    
	
	    em.persist(newFilm);
	    
	
	    return newFilm;
	}



	@Override
	public void update(Film f) {
	    em.merge(f);
	}

	  @Transactional
	  public void cancelReservation(Reservation reservation) {
	        // Make sure the reservation is managed before removing it
	        if (!em.contains(reservation)) {
	            reservation = em.merge(reservation);
	        }
	        em.remove(reservation);
	    }
	  public Reservation findReservationById(int reservationId) {

		    return em.find(Reservation.class, reservationId);
		}



	
	



	
	

}

