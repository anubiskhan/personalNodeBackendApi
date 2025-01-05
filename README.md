# Personal Node Backend API

A simple Node.js backend API with PostgreSQL database integration using Docker.

## Features

- Express.js REST API
- PostgreSQL database integration
- Docker containerization
- Sample products endpoint
- CORS enabled
- Environment variable support

## Prerequisites

- Docker and Docker Compose
- Node.js (for local development)

## Setup

1. Clone the repository:

2. Create a `.env` file (see `.env.example` for reference)

3. Start the application:


## API Endpoints

- `GET /api/products` - Retrieve all products

## Development

To run locally without Docker:
1. Install dependencies: `npm install`
2. Start PostgreSQL database
3. Set up environment variables
4. Run the server: `npm start`

## Database

The PostgreSQL database includes a sample products table. Initial data is seeded via `init.sql`.

## Environment Variables

- `PORT` - Server port (default: 3000)
- `DATABASE_URL` - PostgreSQL connection string