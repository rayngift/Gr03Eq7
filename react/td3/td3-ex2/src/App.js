import { useState } from "react";
import donnees from "./Data";
import "./App.css";

function App() {
  const [hobbies, setHobbies] = useState(donnees);

  function handleChange(id) {
    setHobbies(
      hobbies.map((hobby) =>
        hobby.id === id
          ? { ...hobby, completed: !hobby.completed } // new object, state is not mutated
          : hobby
      )
    );
  }

  return (
    <div className="App">
      <ul>
        {hobbies.map((hobby) => (
          <li key={hobby.id}>
            <label>
              <input
                type="checkbox"
                checked={hobby.completed}
                onChange={() => handleChange(hobby.id)}
              />
              {hobby.text}
            </label>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;