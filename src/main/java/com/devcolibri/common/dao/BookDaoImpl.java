package com.devcolibri.common.dao;

import com.devcolibri.common.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger Logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        Logger.info("Book successfully saved. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        Logger.info("Book successfully update. Book details: " + book);
    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book != null) {
            session.delete(book);
        }
        Logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (!book.isReadAlready()) {
            book.setReadAlready(true);
        }
        Logger.info("Book successfully loaded. Book details: " + book);

        return book;
    }


    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();

        for (Book book : bookList) {
            Logger.info("Book list: " + book);
        }

        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks(String bookTitle) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book where BOOK_TITLE =:bookTitle");
        query.setParameter("bookTitle", bookTitle);
        List<Book> books = query.list();

        return books;
    }


}
