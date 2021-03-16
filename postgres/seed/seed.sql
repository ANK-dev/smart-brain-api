BEGIN TRANSACTION;

INSERT INTO users (name, email, entries, joined) values (
    'Jessie',
    'jessie@gmail.com',
    5,
    '2018-01-01'
);
INSERT INTO login (hash, email) values (
    -- password: '123' (no quotes)
    '$2a$10$joqwWutyIxfucntraGDg8OujeyT3lIbro9PF9N6o6vXX.gxXKdaTu',
    'jessie@gmail.com'
);

COMMIT;