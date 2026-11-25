import { Routes, Route } from "react-router-dom";
import MonMenu from "./MonMenu";
import Accueil from "./Accueil";
import Apropos from "./Apropos";
import Contact from "./Contact";

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<MonMenu />}>
          <Route index element={<Accueil />} />
          <Route path="apropos" element={<Apropos />} />
          <Route path="contact" element={<Contact />} />
        </Route>
      </Routes>
    </div>
  );
}

export default App;