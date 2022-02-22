package com.gleenpeltroche.iniciosesionregistro.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gleenpeltroche.iniciosesionregistro.models.Book;



@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
 
 Optional<Book> findById(Long id);
 List<Book> findAll();
 Optional<Book> findBookById(Long id);
}


