-- Create a sample products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO products (name, description, price, stock) VALUES
    ('Laptop Pro', 'High-performance laptop with 16GB RAM', 1299.99, 50),
    ('Wireless Mouse', 'Ergonomic wireless mouse with long battery life', 29.99, 100),
    ('Mechanical Keyboard', 'RGB mechanical keyboard with Cherry MX switches', 159.99, 30),
    ('4K Monitor', '27-inch 4K Ultra HD display', 499.99, 25),
    ('USB-C Hub', 'Multi-port adapter with HDMI and USB ports', 45.99, 75); 
    