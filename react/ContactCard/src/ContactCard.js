import React, { Component } from "react";

class ContactCard extends Component {
  render() {
    return (
      <div className="contact-card">
        <img src={this.props.img} alt={this.props.name} />
        <h3>{this.props.name}</h3>
        <p>Phone: {this.props.phone}</p>
        <p>Email: {this.props.email}</p>
      </div>
    );
  }
}

export default ContactCard;