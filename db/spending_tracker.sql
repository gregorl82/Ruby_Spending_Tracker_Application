DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS budgets;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR NOT NULL
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR NOT NULL
);

CREATE TABLE budgets (
  id SERIAL PRIMARY KEY,
  budget_name VARCHAR,
  budget_amount DECIMAL(15,2)
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  budget_id INT REFERENCES budgets(id) ON DELETE CASCADE,
  amount DECIMAL(15,2),
  transaction_time TIMESTAMP
)
