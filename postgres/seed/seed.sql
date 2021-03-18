BEGIN TRANSACTION;

INSERT INTO users (name, email, entries, joined) values (
    'Jessie',
    'jessie@gmail.com',
    5,
    '2018-01-01'
);

INSERT INTO users (name, email, entries, joined) values (
    'a',
    'a@a.com',
    5,
    '2018-01-01'
);

INSERT INTO login (hash, email) values (
    -- password: '123' (no quotes)
    '$2a$10$joqwWutyIxfucntraGDg8OujeyT3lIbro9PF9N6o6vXX.gxXKdaTu',
    'jessie@gmail.com'
);

INSERT INTO login (hash, email) values (
    '$2a$10$WAK21U0LWl7C//jJ.DOB2uPP1DJQh7KUDgasdyQeGzkop2Pzl8W7u',
    'a@a.com'
);

COMMIT;