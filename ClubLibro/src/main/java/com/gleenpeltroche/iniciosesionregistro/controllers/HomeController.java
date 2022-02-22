package com.gleenpeltroche.iniciosesionregistro.controllers;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.gleenpeltroche.iniciosesionregistro.models.Book;
import com.gleenpeltroche.iniciosesionregistro.models.LoginUser;
import com.gleenpeltroche.iniciosesionregistro.models.User;
import com.gleenpeltroche.iniciosesionregistro.services.BookService;
import com.gleenpeltroche.iniciosesionregistro.services.UserService;

@Controller
public class HomeController {

 @Autowired
 private UserService userServ;
 @Autowired
 private BookService bookServ;
 
 @GetMapping("")
 public String index(Model model, HttpSession session) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession != null){
	     return "redirect:/books";
	 }
     model.addAttribute("newUser", new User());
     model.addAttribute("newLogin", new LoginUser());
     return "index.jsp";
 }
 
 @GetMapping("/books")
 public String home(Model model, HttpSession session) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
	 
	 model.addAttribute("user", userSession);
	 List<Book> books = bookServ.getAllBooks();
	 model.addAttribute("books", books);
     return "home.jsp";
 }
 
 @GetMapping("/books/new")
 public String booknew(Model model, HttpSession session) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
	 model.addAttribute("newBook", new Book());
	 model.addAttribute("user", userSession);
     return "newbook.jsp";
 }
 
 @GetMapping("/books/{id}/edit")
 public String booknew(
		 Model model, 
		 HttpSession session,
		 @PathVariable("id") Long id ) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
	 Optional<Book> book = bookServ.findBookById(id);
	 if(book == null) {
		 return "redirect:/books";
	 }
	 model.addAttribute("editBook", book);
     return "editbook.jsp";
 }
 
 @PostMapping("/books/create")
 public String createbook(
	 @Valid @ModelAttribute("newBook") Book newBook, 
     BindingResult result, 
     Model model, 
     HttpSession session ) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
     if(result.hasErrors()) {
         return "newbook.jsp";
     }
     newBook.setUser(userSession);
     bookServ.saveBook(newBook);
     return "redirect:/books";
 }
 
 @PostMapping("/books/edit")
 public String editbook(
	 @Valid @ModelAttribute("editBook") Book editBook, 
     BindingResult result, 
     HttpSession session ) {
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
     if(result.hasErrors()) {
         return "editbook.jsp";
     }
     bookServ.saveBook(editBook);
     return "redirect:/books";
 }
 
 @GetMapping("/books/{id}")
 public String bookbyid(
		 Model model, 
		 HttpSession session,
		 @PathVariable("id") Long id
	) {
	 
	 User userSession = (User) session.getAttribute("user");
	 if(userSession == null){
		 return "redirect:/";
	 }
	 model.addAttribute("user", userSession);
	 Optional<Book> book = bookServ.findBookById(id);
	 if(book == null) {
		 return "redirect:/books";
	 }
	 model.addAttribute("book", book.get());
     return "bookbyid.jsp";
 }
 
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
     
     if(result.hasErrors()) {
    	 model.addAttribute("newLogin", new LoginUser());
         return "index.jsp";
     }
     
     if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	 result.rejectValue("confirm", "Matches", "La contraseña de confirmación debe coincidir");
    	 model.addAttribute("newLogin", new LoginUser());
    	 return "index.jsp";
     }
     
     User user = userServ.register(newUser, result);
     if(user == null) {
    	 result.rejectValue("email", "Matches", "El email ya se encuentra registrado.");
    	 model.addAttribute("newLogin", new LoginUser());
    	 return "index.jsp";
     }
     session.setAttribute("user", user);
     return "redirect:/";
 }
 
 @PostMapping("/login")
 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {

     if(result.hasErrors()) {
    	 model.addAttribute("newUser", new User());
         return "index.jsp";
     }
	 
     User user = userServ.login(newLogin, result);
     if(user == null) {
    	 result.rejectValue("email", "Matches", "El nombre usuario es incorrecto.");
    	 model.addAttribute("newUser", new User());
    	 return "index.jsp";
     }
     
     if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	 result.rejectValue("password", "Matches", "El password es incorrecto.");
    	 model.addAttribute("newUser", new User());
    	 return "index.jsp";
     }
     session.setAttribute("user", user);
     return "redirect:/";
 }
 
 @GetMapping("/logout")
 public String logout(HttpSession session) {
	 session.removeAttribute("user");
	 return "redirect:/";
 }
}