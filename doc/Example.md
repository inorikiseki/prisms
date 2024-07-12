# Example Use Case

**Use Case Name**: User Registration

- **Actors**:
    * Primary: *User*
    * Secondary: *System Administrator*

- **Preconditions**:
    * The user must have a `valid email address`.
    * The registration page must be available.

- **Postconditions**:
    * The user is registered and can log in to the system.
    * The user’s information is stored in the database.

- **Main Success Scenario**:
    * The user navigates to the registration page.
    * The user enters their email, username, and password.
    * The user submits the registration form.
    * The system validates the input.
    * The system stores the user’s information in the database.
    * The system sends a confirmation email to the user.
    * The user receives a message indicating successful registration.

- **Extensions**:
    * 4a. If the email is already registered, the system prompts the
      user to use a different email.
    * 4b. If the input validation fails, the system highlights the errors.

