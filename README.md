# Expense Tracker App

## Overview
Expense Tracker is a web application built with Ruby on Rails for the backend, React for the frontend, and SQLite3 for the database. It allows users to manage their expenses without requiring authentication. Users can switch between different accounts to view their respective expenses.

## API Endpoints

### Expenses
- **GET** `/v1/users/:user_id/expenses/index`: Retrieve a list of all expenses for a specific user.
- **POST** `/v1/users/:user_id/expenses/create`: Create a new expense for a specific user.
- **GET** `/v1/users/:user_id/expenses/:id`: Retrieve details of a specific expense for a user.
- **PUT** `/v1/users/:user_id/expenses/:id/update`: Update details of a specific expense for a user.
- **DELETE** `/v1/users/:user_id/expenses/:id/delete`: Delete a specific expense for a user.
- **GET** `/v1/users/:user_id/expenses/summary`: Get a summary of expenses for a specific user.

## Getting Started

To set up the project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/DmytroKorobkoUA/expense_tracker.git
   ```

2. Navigate to the project directory:
   ```bash
   cd expense_tracker
   ```
   
3. Install Ruby dependencies using Bundler:
   ```bash
   bundle install
   ```
   
4. Install JavaScript dependencies using Yarn:
   ```bash
   yarn install
   ```
   
5. Migrate the database:
   ```bash
   rake db:migrate
   ```
   
6. Seed the database with sample data:
   ```bash
   rake db:seed
   ```
   
7. Start the Rails server:
   ```bash
   rails server
   ```
   
8. Run tests for be shure with correct set up:
   ```bash
   rails test
   ```
   
9. Navigate to http://localhost:3000 in your web browser to access the application.
   ```bash
   http://localhost:3000
   ```
   
   
   
   
   
   
   
   
   
