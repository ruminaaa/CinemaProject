package com.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Collection;



@Entity
@Table(name = "SALLE_PROG")

@NamedQuery(name = "findAllSalleProg", query = "SELECT s FROM SalleProg s")
public class SalleProg implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_salleprog;
    @ManyToOne
    private Film film;
    @OneToOne
    private Salle salle;
    @OneToMany(mappedBy = "salleprog", cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    private Collection<Seance> seances;

    public SalleProg() {
        super();
    }

    public SalleProg(int id, Film film, Salle salle, Collection<Seance> seances) {
        this.id_salleprog = id;
        this.film = film;
        this.salle = salle;
        this.seances = seances;
    }

    public int getId() {
        return id_salleprog;
    }

    public void setId(int id) {
        this.id_salleprog = id;
    }

   
    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

  
    public Salle getSalle() {
        return salle;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }

   
    public Collection<Seance> getSeances() {
        return seances;
    }

    public void setSeances(Collection<Seance> seances) {
        this.seances = seances;
    }
 
   


}