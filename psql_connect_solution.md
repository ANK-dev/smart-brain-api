# [Postgresql: password authentication failed for user “postgres” - Stack Overflow][1]
**Q:** I have installed PostgreSQL 8.4, Postgres client and Pgadmin 3.
Authentication failed for user "postgres" for both console client and
Pgadmin. I have typed user as "postgres" and password "postgres", because it
worked before. But now authentication is failed. I did it before a couple of
times without this problem. What should I do? And what happens?

    psql -U postgres -h localhost -W
    Password for user postgres:
    psql: FATAL:  password authentication failed for user "postgres"
    FATAL:  password authentication failed for user "postgres"

--------------------------------------------------------------------------------

**A:** If I remember correctly the user `postgres` has no **DB** password set
on Ubuntu by default. That means, that you can login to that account only by
using the `postgres` **OS user** account.

Assuming, that you have `root` access on the box you can do:

	sudo -u postgres psql

If that fails with a `database "postgres" does not exists error`, then you are
most likely not on a Ubuntu or Debian server :-) In this case simply add
`template1` to the command:

	sudo -u postgres psql template1

If any of those commands fail with an error `psql: FATAL:  password
authentication failed for user "postgres"` then check the file
`/etc/postgresql/8.4/main/pg_hba.conf`: There must be a line like this as the
first non-comment line:

    local   all         postgres                          ident

For newer versions of PostgreSQL `ident` actually might be `peer`. That's OK
also.

Inside the `psql` shell you can give the **DB user** `postgres` a password:

    ALTER USER postgres PASSWORD 'newPassword';

You can leave the `psql` shell by typing <kbd>Ctrl</kbd><kbd>D</kbd> or with
the command `\q`.

Now you should be able to give pgAdmin a valid password for the DB superuser
and it will be happy too. :-)

[1]:(https://stackoverflow.com/questions/7695962/postgresql-password-authentication-failed-for-user-postgres)