drop table if exists staff;
drop table if exists languages;
drop table if exists attendances;
drop table if exists classes;
drop table if exists modules;
drop table if exists teachers;
drop table if exists students;

CREATE TABLE languages (
    id      SERIAL PRIMARY KEY,
    name    TEXT
);

CREATE TABLE teachers (
    id        SERIAL PRIMARY KEY,
    name      TEXT NOT NULL,
    email     TEXT NOT NULL,
    country   VARCHAR(20),
    language  SERIAL REFERENCES languages(id)
);

CREATE TABLE staff (
    id              SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    email           TEXT NOT NULL,
    address         TEXT,
    bank_account    VARCHAR(15),
    phone_number    TEXT,
    position        TEXT,
    language        SERIAL REFERENCES languages(id)
);

CREATE TABLE students (
    id              SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    email           TEXT NOT NULL,
    address         TEXT,
    phone_number    TEXT,
    batch           VARCHAR(9) CHECK (batch IN ('JUL2020-1', 'JUL2020-2', 'MAR2020-1', 'MAR2020-2', 'OCT2019-1', 'OCT2019-2')),
    status          TEXT CHECK (status IN ('Studying', 'Graduated', 'Dropped Out'))
);

CREATE TABLE modules (
    id          SERIAL PRIMARY KEY,
    name        TEXT,
    language    SERIAL REFERENCES languages(id)
);

CREATE TABLE classes (
    id          SERIAL PRIMARY KEY,
    datetime    TIMESTAMP NOT NULL,
    topic       SERIAL REFERENCES modules(id),
    teacher     SERIAL REFERENCES teachers(id)
);

CREATE TABLE attendances (
     id             SERIAL PRIMARY KEY,
     student_id     SERIAL REFERENCES students(id),
     class_id       SERIAL REFERENCES classes(id)
);
