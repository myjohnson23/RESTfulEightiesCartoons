CREATE DATABASE eighties_cartoons;
\c eighties_cartoons
CREATE TABLE funny_cartoons (id SERIAL PRIMARY KEY, name VARCHAR(255), plot VARCHAR(255), watch_again BOOLEAN);
