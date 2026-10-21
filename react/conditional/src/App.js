import React from "react";

function App() {
  const heure = new Date().getHours();

  const message =
    heure < 12 ? "Bonjour" : heure < 18 ? "Bonne après-midi" : "Bonne nuit";

  const couleur =
    heure < 12 ? "#04567F" : heure < 18 ? "#0914A3" : "#D90000";

  const styleObject = {
    fontSize: 100,
    color: couleur,
  };

  return <h1 style={styleObject}>{message}</h1>;
}

export default App;