CREATE TABLE projects (
  id   SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE environments (
  id   SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE deployments (
  id             SERIAL PRIMARY KEY,
  project_id     INTEGER REFERENCES projects (id) NOT NULL,
  environment_id INTEGER REFERENCES environments (id) NOT NULL,
  branch         VARCHAR NOT NULL,
  deployed_at    TIMESTAMPTZ NOT NULL
);
