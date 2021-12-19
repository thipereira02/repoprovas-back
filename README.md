# Repoprovas

In Repoprovas people can share the tests they have anonymously.

Try it out now at 

## About

This is an web application where it is possible to view old tests separated by professor or subject and also send tests. Below are the implemented features:

- Send a test
- See the test by subjects
- See the tests by teachers

By using this app any user can improve their studies through targeted practice.

## Technologies
The following tools and frameworks were used in the construction of the project:<br>

  ![NodeJS](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)&nbsp;
  ![Express](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)&nbsp;
  ![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)&nbsp;
  ![Jest](https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white)&nbsp;
  ![PostgresSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)&nbsp;
  ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)&nbsp;
  
  ## How to run

1. Clone this repository
```bash
git clone https://github.com/thipereira02/Repoprovas_Back.git
```

2. Create a Database using the ``dump.sql`` file inside the ``dump`` folder by following these steps:
    - 2.1 Open your terminal. **Important: the terminal must be opened in the same path as the ``dump.sql`` file is located.**
    - 2.2 Access PostgreSQL using the command ``sudo su postgres`` and enter your password when prompted.
    - 2.3 Next, type ``psql postgres`` and hit enter.
    - 2.4 Create a database by typing ``CREATE DATABASE repoprovas;`` and hitting enter.
    - 2.5 Type ``\q`` and hit enter.
    - 2.6 Finally, type ```psql repoprovas < dump.sql``` and hit enter. Your database should be ready after this step.
2. Set the environment variables by following these steps:
    - 3.1 Create a ``.env`` file in the folder root
    - 3.2 Copy the content of the ``.env.example`` into it
    - 3.3 Set the ``DATABASE_URL`` in this format: "postgres://user:password@host:port/repoprovas"
    - 3.4 Set the ``PORT`` for 4000
3. In your terminal, go back to the root folder and install the dependencies
```bash
npm i
```
5. Also in the root folder, run the back-end with
```bash
npm start
```
6. Your server should be running now.
7. After that, you can optionally test the project following these steps:
    - 7.1 Open your terminal.
    - 7.2 Access PostgreSQL using the command ``sudo su postgres`` and enter your password when prompted.
    - 7.3 Next, type ``psql postgres`` and hit enter.
    - 7.4 Create a test database by typing ``CREATE DATABASE repoprovas_test TEMPLATE repoprovas;`` and hitting enter. Your database test should be ready after this step.
    - 7.5 Set the enviroment variable following the step 5 again, with the following changes:
      - 7.5.1 The file must be called ``.env.test``
      - 7.5.2 The ``DATABASE_URL`` must be in this format: "postgres://user:password@host:port/repoprovas_test"
    - <b>Important</b>: the tests assume that some tables are pre-populated. Therefore, it is important to use the dump provided to create the test database.

8. In your terminal, go to the root folder and run the tests with:
```bash
npm run test
```