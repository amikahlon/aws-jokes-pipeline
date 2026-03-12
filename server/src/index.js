const express = require("express");
const axios = require("axios");
const cors = require("cors");

const app = express();
const PORT = 3001;

app.use(cors());

app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

app.get("/api/joke", async (req, res) => {
  try {
    const response = await axios.get(
      "https://official-joke-api.appspot.com/random_joke"
    );
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch joke" });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});