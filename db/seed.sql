-- HTA-8 sample data for local testing
INSERT INTO users (email, password_hash, full_name) VALUES ('demo@healthtracker.app', 'x', 'Demo User');
INSERT INTO health_logs (user_id, log_date, steps, water_ml, sleep_hours, heart_rate) VALUES (1, CURRENT_DATE, 8200, 2100, 7.5, 72);
INSERT INTO goals (user_id, metric, target) VALUES (1, 'steps', 10000), (1, 'water_ml', 2500);
