   // server.js
   const express = require('express');
   const cors = require('cors');
   const { Pool } = require('pg');
   require('dotenv').config();

   const app = express();
   const port = process.env.PORT || 3000;

   // Middleware
   app.use(cors());
   app.use(express.json());

   // PostgreSQL connection
   const pool = new Pool({
       connectionString: process.env.DATABASE_URL,
   });

   // Example route
   app.get('/api/data', async (req, res) => {
       try {
           const result = await pool.query('SELECT * FROM your_table');
           res.json(result.rows);
       } catch (err) {
           console.error(err);
           res.status(500).send('Server error');
       }
   });

   // GET endpoint to fetch all products
   app.get('/api/products', async (req, res) => {
       try {
           const result = await pool.query('SELECT * FROM products');
           res.json(result.rows);
       } catch (err) {
           console.error('Error fetching products:', err);
           res.status(500).json({ error: 'Internal server error' });
       }
   });

   app.listen(port, () => {
       console.log(`Server running on port ${port}`);
   });