const express = require('express');
const router = express.Router();

router.post('/login', async (req, res) => {
  res.json({
    success: true,
    token: 'demo-token'
  });
});

module.exports = router;