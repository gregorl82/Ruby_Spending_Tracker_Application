DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR
)
