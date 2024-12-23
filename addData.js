import { initializeApp } from "firebase/app";
import { getDatabase, ref, set } from "firebase/database";

// Firebase Config (πάρε το από το Firebase Console)
const firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
  databaseURL: "https://YOUR_PROJECT_ID.firebaseio.com",
  projectId: "YOUR_PROJECT_ID",
  storageBucket: "YOUR_PROJECT_ID.appspot.com",
  messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  appId: "YOUR_APP_ID"
};

// Αρχικοποίηση Firebase
const app = initializeApp(firebaseConfig);
const database = getDatabase(app);

// Συνάρτηση για εισαγωγή δεδομένων
async function addData(gameCode) {
  try {
    const dbRef = ref(database, `games/${gameCode}`);
    await set(dbRef, {
      createdAt: new Date().toISOString(),
      status: "waiting"
    });
    console.log(`Game room ${gameCode} created successfully!`);
  } catch (error) {
    console.error("Error adding data: ", error);
  }
}

// Χρήση της συνάρτησης
const gameCode = "ABCD"; // Μπορείς να αλλάξεις αυτόν τον κωδικό
addData(gameCode);
