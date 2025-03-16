# Liquibase Rollback

This project demonstrates how to use Liquibase for database version control and rollback operations.

## Project Structure

- `event.json`: Sample event data.
- `pom.xml`: Maven configuration file.
- `run-act.sh`: Shell script to run the application.
- `src/main/java/com/example/App.java`: Main application code.
- `src/main/resources/application*.yaml`: Configuration files for different environments.
- `src/main/resources/db/changelog/`: Liquibase changelog files.
- `src/test/java/com/example/AppTest.java`: Unit tests.
- `target/`: Compiled classes and build artifacts.

## Getting Started

1. Clone the repository:

```sh
$ git clone https://github.com/IreneLin77/liquibase-rollback.git
```

2. Navigate to the project directory:

```sh
$ cd liquibase-rollback
```

3. Build the project using Maven:

```sh
$ mvn clean install
```

4. Run the application:

```sh
$ ./run-act.sh
```

## Running Tests

To run the tests, use the following command:

```sh
$ mvn test
```

## License

This project is licensed under the MIT License.
