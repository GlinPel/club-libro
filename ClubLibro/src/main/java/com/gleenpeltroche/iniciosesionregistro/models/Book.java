package com.gleenpeltroche.iniciosesionregistro.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="books")
public class Book {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Se requiere el nombre el titulo")
    @Size(min=3, max=30, message="El titulo debe ser mayor a 3 y menor a 30 caracteres")
    private String titulo;
    
    @NotEmpty(message="Se requiere el nombre del autor")
    @Size(min=3, max=30, message="El nombre del autor debe ser mayor a 3 y menor a 30 caracteres")
    private String author;
    
    @NotEmpty(message="Se requiere el pensamiento")
    @Size(min=3, message="El pensamiento debe ser mayor a 3 caracteres")
    @Column(columnDefinition="TEXT")
    private String thought;
    
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

	public Book() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getThought() {
		return thought;
	}

	public void setThought(String thought) {
		this.thought = thought;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
