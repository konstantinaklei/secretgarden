const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose'); 

// 2. ΑΡΧΙΚΟΠΟΙΗΣΗ ΤΟΥ EXPRESS
const app = express();
app.use(cors());
app.use(express.json());

// Βάλτε εδώ το URI που πήρατε από το Atlas, αφού βάλετε τον κωδικό και το όνομα χρήστη
const ATLAS_URI = "http://localhost:3000/api/scores";

mongoose.connect(ATLAS_URI)
    .then(() => {
        console.log('🎉 MongoDB Atlas connected successfully!');
        // ... (κώδικας για εκκίνηση του server)
    })
    .catch(err => {
        console.error('❌ MongoDB connection error:', err);
    });
// 4. (ΣΥΝΕΧΕΙΑ) ΟΡΙΣΜΟΣ SCHEMAS, MODELS, ΚΑΙ ROUTES...

// 5. ΕΚΚΙΝΗΣΗ ΤΟΥ SERVER
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Leaderboard API is running on port ${PORT}`);
});