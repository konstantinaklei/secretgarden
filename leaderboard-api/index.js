const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose'); // Πρώτα ορίζουμε το mongoose!

const app = express();
app.use(cors());
app.use(express.json());

// 1. Σύνδεση στη βάση (Βάλε το δικό σου URI εδώ)
const mongoURI = "mongodb+srv://juniorklei2_db_user:122112@cluster0.bziskud.mongodb.net/leaderboard?retryWrites=true&w=majority";

mongoose.connect(mongoURI)
    .then(() => console.log('🎉 MongoDB Atlas connected successfully!'))
    .catch(err => console.error('❌ MongoDB connection error:', err));

// 2. Ορισμός του Schema (Τι μορφή έχουν τα δεδομένα)
const scoreSchema = new mongoose.Schema({
    name: String,
    score: Number,
    date: { type: Date, default: Date.now }
});
const Score = mongoose.model('Score', scoreSchema);

// 3. Route για POST (Αποστολή σκορ από Godot/Thunder Client)
app.post('/api/scores', async (req, res) => {
    try {
        const newScore = new Score(req.body);
        await newScore.save();
        res.status(201).json(newScore);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// 4. Route για GET (Λήψη σκορ για το leaderboard)
app.get('/api/scores', async (req, res) => {
    try {
        const scores = await Score.find().sort({ score: -1 }).limit(10);
        res.status(200).json(scores);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 5. Εκκίνηση του Server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server is running on http://localhost:${PORT}`);
});