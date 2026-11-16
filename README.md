# Flutter CRUD App

A Flutter-based mobile application that integrates with the [JSONPlaceholder REST API](https://jsonplaceholder.typicode.com/) to demonstrate full CRUD (Create, Read, Update, and Delete) operations. The application allows users to fetch and manage post data through an interactive mobile interface.

## Overview

This project was developed to explore mobile application development with Flutter and REST API integration. It demonstrates how a Flutter application communicates with an external API, processes JSON responses, and handles data operations through HTTP requests.

The application uses JSONPlaceholder as a mock REST API, making it suitable for learning and experimenting with client-side CRUD implementation.

## Features

- **Read Posts** — Fetch and display post data from JSONPlaceholder API.
- **Create Posts** — Add a new post using a form with input validation.
- **Update Posts** — Edit existing post titles and content.
- **Delete Posts** — Remove posts with a confirmation dialog.
- **Pull to Refresh** — Reload the post list from the API.
- **Loading & Error States** — Display loading indicators and error messages during API requests.
- **Form Validation** — Validate required fields and minimum input lengths.

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Mobile application framework |
| Dart | Programming language |
| HTTP | REST API communication |
| JSONPlaceholder | Mock REST API |
| Material 3 | User interface components |

## API Integration

This application uses the JSONPlaceholder `/posts` resource.

| Operation | HTTP Method | Endpoint |
|---|---|---|
| Fetch posts | GET | `/posts` |
| Create post | POST | `/posts` |
| Update post | PUT | `/posts/{id}` |
| Delete post | DELETE | `/posts/{id}` |

Base URL: `https://jsonplaceholder.typicode.com`

**Note:** JSONPlaceholder is a fake online REST API. Create, update, and delete requests return simulated responses, but the changes are not permanently stored on the server.

## Project Structure

```text
lib/
├── models/
│   └── post.dart
├── screens/
│   ├── home_screen.dart
│   └── post_form_screen.dart
├── services/
│   └── post_service.dart
├── widgets/
│   └── post_card.dart
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- Internet connection

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/alaiaeiz/flutter-crud-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd flutter-crud-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Learning Objectives

Through this project, I explored:

- Integrating REST APIs into Flutter applications.
- Sending HTTP requests using the HTTP package.
- Converting JSON responses into Dart model objects.
- Implementing CRUD operations.
- Managing asynchronous operations and application states.
- Building reusable UI components and handling form validation.

## Project Status

Completed as a mobile application development project for practicing Flutter, REST API integration, and CRUD operations.
