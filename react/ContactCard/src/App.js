import React, { Component } from "react";
import ContactCard from "./ContactCard";
import "./App.css";

class App extends Component {
  render() {
    return (
      <div className="contacts">
        <ContactCard
          img="https://placecats.com/300/200" 
          name="Mr. Whiskerson"
          phone="(212) 555-1234"
          email="mr.whiskaz@catnap.meow"
        />
        <ContactCard
          img="https://placecats.com/400/200"
          name="Fluffykins"
          phone="(212) 555-2345"
          email="fluff@me.com"
        />
        <ContactCard
           img="https://placecats.com/400/300"
          name="Destroyer"
          phone="(212) 555-3456"
          email="ofworlds@yahoo.com"
        />
        <ContactCard
           img="https://placecats.com/200/100" 
          name="Felix"
          phone="(212) 555-4567"
          email="thecat@hotmail.com"
        />
      </div>
    );
  }
}

export default App;