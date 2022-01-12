DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS product_categories CASCADE;

CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  dateTime TIMESTAMP,
  totalAmount INTEGER 
);

CREATE TABLE product_categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR (255),
  description VARCHAR (255),
  thumbnail VARCHAR (255)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR (255),
  price INTEGER,
  description VARCHAR (255),
  thumbnail VARCHAR (255),
  image VARCHAR (255),
  quantity INTEGER,
  category_id INTEGER REFERENCES product_categories(id) ON DELETE CASCADE
);

CREATE TABLE order_details (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
  amount INTEGER,
  quantity INTEGER
);

