import React from "react";
import Icone from "./Icone";
class Pictogramme extends React.Component {
    render() {
      return (
    <div>
        <Icone />
        <hr />
        <div>
          <button
            type="button"
            className="btn no-outline btn-secondary"
            onClick={this.props.onAimer}
          >
            <i className="fa fa-thumbs-o-up fa-4 align-middle" aria-hidden="true"></i>
            &nbsp;
            <span className="align-middle">Aimer</span>
          </button>
        </div>
      </div>
        )
    }
    }
export default Pictogramme;