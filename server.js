const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    message: 'Hello from Cloud Computing App!',
    timestamp: new Date().toISOString(),
    env: process.env.NODE_NEW || 'development',
    server: 'VPS Ubuntu'
  });
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP', uptime: process.uptime() });
});

app.listen(3000, '0.0.0.0', () => {
  console.log(`Server running on prot 3000`);
});
