package com.entities;

import java.io.Serializable;

import java.util.Set;

import jakarta.persistence.*;

@Entity
@Table(name = "FILM")
@NamedQueries({
    @NamedQuery(name = "findFilmById", query = "SELECT f FROM Film f WHERE f.id_film = :fid"),
    @NamedQuery(name = "findAllFilms", query = "SELECT f FROM Film f")

})
public class Film implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_film;

    private String name;

    private String description; 

    private String genre; 

    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private Set<SalleProg> salleprog;


  
    public Film() {
        super();
    }

    public Film(int id, String name, String description, String genre) {
        this.id_film = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.salleprog = null;
    }

  
    public int getId() {
        return id_film;
    }

    public void setId(int id) {
        this.id_film = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

 
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }


    public Set<SalleProg> getSalleprog() {
        return salleprog;
    }

    public void setSalleprog(Set<SalleProg> salleprog) {
        this.salleprog = salleprog;
    }
  


}