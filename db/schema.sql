-- HealthTracker App - database schema (HTA-8)
CREATE TABLE users (
  id            SERIAL PRIMARY KEY,
  email         VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name     VARCHAR(120),
  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE health_logs (
  id          SERIAL PRIMARY KEY,
  user_id     INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  log_date    DATE NOT NULL,
  steps       INT DEFAULT 0,
  water_ml    INT DEFAULT 0,
  sleep_hours NUMERIC(4,1),
  heart_rate  INT,
  UNIQUE (user_id, log_date)
);

CREATE TABLE goals (
  id          SERIAL PRIMARY KEY,
  user_id     INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  metric      VARCHAR(20) NOT NULL CHECK (metric IN ('steps','water_ml','sleep_hours')),
  target      NUMERIC(8,1) NOT NULL,
  active      BOOLEAN DEFAULT TRUE
);
