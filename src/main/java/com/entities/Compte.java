package com.entities;

import java.io.Serializable;

import jakarta.persistence.*;

@Entity
@Table(name = "COMPTES")
@NamedQueries({ @NamedQuery(name = "findAllComptes", query = "SELECT c FROM Compte c"),
		@NamedQuery(name = "findCompteByName", query = "SELECT c FROM Compte c WHERE c.name =:cname"),
		@NamedQuery(name = "findCompteById", query = "SELECT c FROM Compte c WHERE c.id =:cid") })
public class Compte implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String password;
	private float solde;

	public Compte() {
		super();
	}
	public Compte(int id, String name, String password, float solde) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.solde = solde;
	}
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getSolde() {
		return this.solde;
	}

	public void setSolde(float solde) {
		this.solde = solde;
	}

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Compte[id=").append(getId()).append(", name=").append(getName()).append("]");
		return sb.toString();
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
}
