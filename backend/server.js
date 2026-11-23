// HealthTracker App - backend health-data services (HTA-7)
const express = require('express');
const app = express();
app.use(express.json());

const logs = []; // replaced by the HTA-8 database in API integration (HTA-9)

app.get('/health', (req, res) => res.json({ status: 'ok' }));

app.post('/api/logs', (req, res) => {
  const { userId, date, steps, waterMl, sleepHours } = req.body;
  if (!userId || !date) return res.status(400).json({ error: 'userId and date are required' });
  const entry = { userId, date, steps: steps || 0, waterMl: waterMl || 0, sleepHours: sleepHours || null };
  logs.push(entry);
  res.status(201).json(entry);
});

app.get('/api/logs/:userId', (req, res) => {
  res.json(logs.filter(l => String(l.userId) === req.params.userId));
});

module.exports = app;
if (require.main === module) app.listen(3000, () => console.log('HealthTracker API on :3000'));
