package com.devcolibri.common.controller;

import com.devcolibri.common.model.Book;
import com.devcolibri.common.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public ModelAndView listOfBooks(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("books");

        modelAndView.addObject("book", new Book());
        modelAndView.addObject("searchbook", new Book());
        List<Book> books = this.bookService.listBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("books", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("books", pagedListHolder.getPageList());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {

        if (book.getId() == 0) {
            this.bookService.addBook(book);
        }

        return "redirect:/books";
    }


    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String editBook(@ModelAttribute("book") Book book) {
        if (book.getId() != 0) {
            this.bookService.updateBook(book);
        }
        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("searchbook", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "editbook";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));

        return "bookdata";
    }

    @RequestMapping("addbook")
    public String createUser(@ModelAttribute Book book) {
        return "addbook";
    }


    @RequestMapping(value = "searchbook", method = RequestMethod.POST)
    public String searchResults(@ModelAttribute("searchedbook") Book book, Model model) {
        List<Book> searchResult = bookService.listBooks(book.getBookTitle());
        model.addAttribute("listBooks", searchResult);

        return "searchbook";
    }


}
