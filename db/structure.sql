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

CREATE VIEW deployments_report AS
SELECT
  p.name AS project,
  e.name AS environment,
  d.branch,
  d.deployed_at
FROM deployments AS d
JOIN projects AS p
  ON d.project_id = p.id
JOIN environments AS e
  ON d.environment_id = e.id
ORDER BY d.deployed_at DESC;
