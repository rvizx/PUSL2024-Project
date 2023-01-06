# PUSL2024-Project
PUSL2024 Project - Cinema Website

UI design : https://www.figma.com/file/SMZDF8reG5YenwjwOCnSQO/Uni-project?node-id=1039%3A2149

### How to contribute ?
1. fork this project
2. create a branch `git checkout -b feature`
3. commit changes `git commit -m "added some features"`
4. push to the branch `git push origin feature`
5. open a pull request

read more at [git guides](https://github.com/git-guides/)


```sql
CREATE DATABASE abc_cinema;


USE abc_cinema;

CREATE TABLE employee
(
    emp_id INT AUTO_INCREMENT,
    e_name VARCHAR(256) NOT NULL,
    e_email VARCHAR(256) NOT NULL,
    e_password VARCHAR(256) NOT NULL,
    PRIMARY KEY(emp_id)
);

ALTER TABLE employee AUTO_INCREMENT = 100;


CREATE TABLE manager
(
    emp_id INT,
    PRIMARY KEY(emp_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

ALTER TABLE manager AUTO_INCREMENT = 100;

CREATE TABLE staff
(
    emp_id INT,
    PRIMARY KEY(emp_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

ALTER TABLE staff AUTO_INCREMENT = 100;

CREATE TABLE movie_show
(
    show_id INT AUTO_INCREMENT,
    show_date_time DATETIME NOT NULL,
    m_id INT NOT NULL,
    emp_id INT  NULL,
    PRIMARY KEY(show_id),
    FOREIGN KEY (m_id) REFERENCES movie(m_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
); 

CREATE TABLE movie
(
    m_id INT AUTO_INCREMENT,
    m_name VARCHAR(256) NOT NULL,
    m_language VARCHAR(256) NOT NULL,
    runtime TIME NOT NULL,
    description VARCHAR(500) NOT NULL,
    m_status BOOLEAN NOT NULL,
    PRIMARY KEY(m_id)
); 


CREATE TABLE movie_genre
(
    m_id INT,
    genre VARCHAR(256) NOT NULL,
    PRIMARY KEY(m_id),
    FOREIGN KEY (m_id) REFERENCES movie(m_id)
);


CREATE TABLE seats
(
    seat_no VARCHAR(2) PRIMARY KEY,
    seat_status BOOLEAN NOT NULL,
    show_id INT,
    FOREIGN KEY (show_id) REFERENCES movie_show(show_id)
);

CREATE TABLE tickets
(
    t_id INT PRIMARY KEY,
    seat_no VARCHAR(2),
    show_id INT,
    c_id INT,
    FOREIGN KEY (seat_no) REFERENCES seats(seat_no),
    FOREIGN KEY (show_id) REFERENCES movie_show(show_id),
    FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

CREATE TABLE adult_tickets
(
    t_id INT PRIMARY KEY,
    a_price INT,
    FOREIGN KEY (t_id) REFERENCES tickets(t_id)
);

CREATE TABLE child_tickets
(
    t_id INT PRIMARY KEY,
    c_price INT,
    FOREIGN KEY (t_id) REFERENCES tickets(t_id)
);

    
CREATE TABLE customer
(
    c_id INT AUTO_INCREMENT,
    c_fname VARCHAR(256) NOT NULL,
    c_lname VARCHAR(256) NOT NULL,
    c_mobile VARCHAR(10) NOT NULL,
    c_email VARCHAR(256) NOT NULL,
    c_password VARCHAR(256) NOT NULL,
    PRIMARY KEY(c_id)
);

ALTER TABLE customer AUTO_INCREMENT = 2000;

CREATE TABLE payment
(
    pay_id INT PRIMARY KEY,
    total_amount INT,
    c_id INT,
    FOREIGN KEY (C_id) REFERENCES customer(c_id)
);
```
