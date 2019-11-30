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
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  amount DECIMAL(15,2),
  transaction_time TIMESTAMP
)
