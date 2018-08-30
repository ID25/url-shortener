import React, { Component } from 'react'
import { generateShortCode, linkValidator } from '../utils/utils';

export default class ShortenLinkForm extends Component {
  state = {
    original_url: ''
  };

  handleChange = (e) => {
    this.setState({ original_url: e.target.value });
  };

  updateLinksState = (short_code) => {
    let links = {
      shorten_url: `${window.location.origin}/${short_code}`,
      original_url: this.state.original_url
    }

    this.props.updateLinks(links);
  };

  handleSubmit = (e) => {
    if (linkValidator(this.state.original_url)) {
      let short_code = generateShortCode();

      this.postShortenLink(short_code);

      this.updateLinksState(short_code);

      this.props.toggleForm();
    }
    e.preventDefault();
  };

  postShortenLink = (short_code) => {
    let body = {
      original_url: this.state.original_url,
      short_code: short_code
    };

    fetch(`${window.location.origin}/api/links`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(body),
    });
  };

  render() {
    const { original_url } = this.state;

    return (
      <form onSubmit={this.handleSubmit} className="shorten_form">
        <input type="text" value={original_url} className="url_input" placeholder='Paste URL here' onChange={this.handleChange}/>
        <input type="submit" value='Shorten' className="submit_btn"/>
      </form>
    );
  }
}
