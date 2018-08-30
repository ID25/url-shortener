import React, { Component } from 'react';
import CrossSvg from 'images/cross';

export default class CopyForm extends Component {
  copyToClipboard = (e) => {
    navigator.clipboard.writeText(this.props.shorten_url).then(() => {
      return;
    }, err => {
      return;
    });

    e.preventDefault();
  };

  render() {
    const { shorten_url, original_url, toggleForm } = this.props;

    return (
      <div className="shorten_form">
        <form onSubmit={this.copyToClipboard}>
          <input type="text" readOnly value={shorten_url} className="url_input"/>
          <img src={CrossSvg} className="cross_svg" onClick={toggleForm}/>
          <input type="submit" value='Copy' className="submit_btn"/>
        </form>
          <div className="shortening">
            <a href={shorten_url} target="_blank" className="shortening_link">{original_url}</a>
            <p className="shortening_text">shortening</p>
          </div>
      </div>
    );
  }
}
