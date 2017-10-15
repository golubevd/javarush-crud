package com.devcolibri.common.service;

import com.devcolibri.common.model.Book;

import java.util.List;

public interface BookService {
    public void addBook(Book book);

    public void updateBook(Book book);

    public void removeBook(int id);

    public Book getBookById(int id);

    public List<Book> listBooks();

    public List<Book> listBooks(String bookTitle);

}
