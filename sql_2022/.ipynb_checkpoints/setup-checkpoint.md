# Setup ~ SQL [EmployeeDatabase]

```{admonition} Last Updated
:class: important
18 July 2022
```

## Table of Contents

* [GitHub](#github)
* [Terminal](#terminal)
* [Starter Code](#starter-code)
* [Project Structure](#project-structure)
* [Special Instructions](#special-instructions)
  * [psql](#psql)
* [Tools and Technologies](#tools-and-technologies)
* [Resources to pass along to the student](#resources-to-pass-along-to-the-student)



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## GitHub

In the web browser, navigate to your GitHub account and create a new GitHub repository called

```
07-Pewlett-Hackard-Analysis
```

You may or may not decide to include such files as a README or one of the provided .gitignore templates.

**When you have created your GitHub repo you are ready to move on to the Terminal step.**



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Terminal

In the terminal, navigate to your local program directory

```
cd $BOOTCAMP_HOME
```

and then make a copy of your GitHub repo in your local program directory.

```
git clone git@github.com:$GITHUB_USERNAME/07-Pewlett-Hackard-Analysis.git
```

Navigate into your local copy

```
cd 07-Pewlett-Hackard-Analysis
```

and then get a status update.

`````{tab-set}
````{tab-item} Single Line
:sync: singleline
```
pwd && ls -al && git status -u && git remote get-url origin --all
```
````
````{tab-item} Multi Line
:sync: multiline
```
pwd           &&
ls -al        &&
git status -u &&
git remote get-url origin --all
```
````
`````

Your GitHub repo and your local copy of it will now look similar to the following.

```
07-Pewlett-Hackard-Analysis
.
├── README.md
└── .gitignore

0 directories, 2 files
```

**At this point, your GitHub repo (the remote) and your local copy of it (the local) are connected and ready to go and you are ready to move on to the starter code step.**



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Starter Code

Download the starter code

[`Employee_Challenge_starter_code.sql`](https://davefriedman01.github.io/2U/d/b/07-SQL/starter/starter-code.html)

and place it in your local project directory.

`````{tab-set}
````{tab-item} Single Line
:sync: singleline
```
mv ~/Downloads/startercode $BOOTCAMP_HOME/07-Pewlett-Hackard-Analysis
```
````
````{tab-item} Multi Line
:sync: multiline
```
mv \
~/Downloads/startercode \
$BOOTCAMP_HOME/07-Pewlett-Hackard-Analysis
```
````
`````

**When you have your starter code in your local project directory you are ready to move on to creating a development environment with Conda and an associated Jupyter kernel dedicated to this unit.**



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Project Structure

`````{tab-set}
````{tab-item} Starter Structure
```
07-Pewlett-Hackard-Analysis
.
├── Data
├── Queries
│   └── Employee_Database_starter_code.sql
├── README.md
└── .gitignore

2 directories, 3 files
```
````
````{tab-item} Submission Structure
```
07-Pewlett-Hackard-Analysis
.
├── Data
│   ├── mentorship_eligibility.csv
│   ├── retirement_titles.csv
│   ├── retiring_titles.csv
│   └── unique_titles.csv
├── Queries
│   └── Employee_Database_challenge.sql
├── README.md
└── .gitignore

2 directories, 7 files
```
````
`````



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Special Instructions

### psql

#### psql commands

List databases.

```
psql -l
```

Open psql in database `employeedb`.

```
psql employeedb
```

Create a new database called `employeedb` and display the SQL syntax for doing so.

```
createdb employeedb -e
```

Destroy the database called `employeedb` and display the SQL syntax for doing so.

```
dropdb employeedb -e
```

Create a new database user called `postgres` along with a password and display the SQL syntax for doing so.

```
createuser postgres -P -e
```

#### internal commands

List database tables.

```
\dt+
```

List information about database table `employees`.

```
\d+ employees
```

List database users.

```
\du+
```

Switch to database `employeedb`.

```
\c employeedb
```

Quit psql.

```
\q
```



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Tools and Technologies



---

<hr style="background-color: #0096FF;  height: 100px;">

---



## Resources to pass along to the student

* Postgres
  * [Docs](https://www.postgresql.org/docs/14/index.html)
* PostgreSQL
  * [COPY](https://www.postgresql.org/docs/current/sql-copy.html)
  * [CREATE TABLE](https://www.postgresql.org/docs/current/sql-createtable.html)
  * [DROP TABLE](https://www.postgresql.org/docs/current/sql-droptable.html)
* [Clients](https://www.postgresql.org/docs/current/reference-client.html)
  * [createdb](https://www.postgresql.org/docs/current/app-createdb.html)
  * [createuser](https://www.postgresql.org/docs/current/app-createuser.html)
  * [dropdb](https://www.postgresql.org/docs/current/app-dropdb.html)
  * [dropuser](https://www.postgresql.org/docs/current/app-dropuser.html)
  * [pg_config](https://www.postgresql.org/docs/current/app-pgconfig.html)
  * [psql](https://www.postgresql.org/docs/current/app-psql.html)