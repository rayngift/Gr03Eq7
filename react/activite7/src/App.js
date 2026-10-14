import React from 'react';
import cloche1 from './cloche1.png'; 
import cloche2 from './cloche2.png';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      msg: "Veuillez vous inscrire",
      ins: "Inscription",
      cloche: cloche1
    };
  }

  styles = {
    fontWeight: "bold",
    color: "teal"
  };

  stylesCloche = {
    width: "80px",
    height: "80px"
  };

   changement = () => {
    this.setState({
      msg: "Suivez les màj",
      ins: "Déjà inscrit"
    });
  };

   survol = () => {
    this.setState({ cloche: cloche2 });
  };
 
  sortie = () => {
    this.setState({ cloche: cloche1 });
  };

  render() {
    return (
      <div>
        <h1 style={this.styles}> {this.state.msg} </h1>
        <button onClick={this.changement}>{this.state.ins} </button>
           <br />
        <br />
        <img
          src={this.state.cloche}
          alt="cloche"
          style={this.stylesCloche}
          onMouseOver={this.survol}
          onMouseOut={this.sortie}
        />
      </div>
    );
  }
}

export default App;