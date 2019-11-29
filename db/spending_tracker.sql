DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR NOT NULL
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR NOT NULL
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id),
  amount DECIMAL(4,2)
)
