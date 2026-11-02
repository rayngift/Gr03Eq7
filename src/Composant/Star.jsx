import React from 'react';

class Star extends React.Component {
  constructor(props) {
    super(props);
    this.state = { on: false };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
  this.setState((prev) => ({ on: !prev.on }));
  }
  render() {
    return (
      <img
        src={
          this.state.on
            ? process.env.PUBLIC_URL + '/star_On.png'
            : process.env.PUBLIC_URL + '/star_Off.png'
        }
        alt="étoile"
        onClick={this.handleClick}
        style={{ width: 30, height: 30, cursor: 'pointer' }}
      />
    );
  }
}

export default Star;