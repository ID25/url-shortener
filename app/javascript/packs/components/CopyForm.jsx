import React, { Component } from 'react';
import CrossSvg from 'images/cross';

export default class CopyForm extends Component {
  copyToClipboard = (e) => {
    navigator.clipboard.writeText(this.props.shorten_link).then(() => {
      return;
    }, err => {
      return;
    });

    e.preventDefault();
  };

  render() {
    const { shorten_link, toggleForm } = this.props;

    return (
      <form className="shorten_form" onSubmit={this.copyToClipboard}>
        <input type="text" readOnly value={shorten_link} className="url_input"/>
        <img src={CrossSvg} className="cross_svg" onClick={toggleForm}/>
        <input type="submit" value='Copy' className="submit_btn"/>
      </form>
    );
  }
}
