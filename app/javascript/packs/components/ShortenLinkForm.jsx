import React, { Component } from 'react'
import { generateShortCode, linkValidator } from '../utils/utils'

export default class ShortenLinkForm extends Component {
  handleSubmit = (e) => {
    if (linkValidator(this.refs._original_url.value)) {
      this.handleShortenLink(this.refs._original_url.value)

      this.props.toggleForm()
    }
    e.preventDefault()
  }

  handleShortenLink = (original_url) => {
    const short_code = generateShortCode()

    this.postShortenLink(short_code, original_url)
    this.updateLinksState(short_code, original_url)
  }

  updateLinksState = (short_code, original_url) => {
    this.props.updateLinks({
      shorten_url: `${window.location.origin}/${short_code}`,
      original_url: original_url
    })
  }

  postShortenLink = (short_code, original_url) => {
    fetch(`${window.location.origin}/api/links`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        original_url: original_url,
        short_code: short_code
      }),
    })
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className='shorten_form'>
        <input type='text' ref='_original_url' className='url_input' placeholder='Paste URL here'/>
        <input type='submit' value='Shorten' className='submit_btn'/>
      </form>
    );
  }
}
