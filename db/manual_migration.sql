/* CREATE TABLES*/

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id varchar(255) NOT NULL,
  status varchar(20) NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp
);

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  restaurant_id integer NOT NULL,
  title varchar(255) NOT NULL,
  description text NOT NULL,
  image text NOT NULL,
  price_cents integer NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp,
  CONSTRAINT fk_restaurant_on_products FOREIGN KEY ("restaurant_id") REFERENCES restaurants ("id")
);

CREATE TABLE ingredients (
  id SERIAL PRIMARY KEY,
  product_id integer NOT NULL,
  name varchar(255) NOT NULL,
  group_name varchar(20) NOT NULL,
  price_cents integer NOT NULL,
  basic boolean,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp,
  CONSTRAINT fk_product_on_ingredients FOREIGN KEY ("product_id") REFERENCES products ("id")
);

CREATE TABLE products_orders (
  id SERIAL PRIMARY KEY,
  product_id integer NOT NULL,
  order_id integer NOT NULL,
  quantity integer NOT NULL,
  total_price_cents integer NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp,
  CONSTRAINT fk_product_on_product_orders FOREIGN KEY ("product_id") REFERENCES products ("id"),
  CONSTRAINT fk_order_on_product_orders FOREIGN KEY ("order_id") REFERENCES orders ("id")
);

CREATE TABLE ingredients_orders (
  product_order_id integer NOT NULL,
  ingredient_id integer NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp,
  CONSTRAINT fk_product_on_ingredients_orders FOREIGN KEY ("product_order_id") REFERENCES products_orders ("id"),
  CONSTRAINT fk_ingredient_on_ingredients_orders FOREIGN KEY ("ingredient_id") REFERENCES ingredients ("id")
);

CREATE TABLE evaluations (
  id SERIAL PRIMARY KEY,
  user_id varchar(255) NOT NULL,
  product_id integer NOT NULL,
  score integer NOT NULL,
  inserted_at timestamp DEFAULT now(),
  updated_at timestamp,
  CONSTRAINT fk_product_on_evaluations FOREIGN KEY ("product_id") REFERENCES products ("id")
);

/* CREATE INDEX */

CREATE INDEX idx_restaurant_on_products ON products USING btree (restaurant_id);
CREATE INDEX idx_product_on_ingredients ON ingredients USING btree (product_id);
CREATE INDEX idx_product_on_products_orders ON products_orders USING btree (product_id);
CREATE INDEX idx_order_on_products_orders ON products_orders USING btree (order_id);
CREATE INDEX idx_product_order_on_ingredients_orders ON ingredients_orders USING btree (product_order_id);
CREATE INDEX idx_ingredient_on_ingredients_orders ON ingredients_orders USING btree (ingredient_id);
CREATE INDEX idx_product_on_evaluations ON evaluations USING btree (product_id);
