import React, { Component, Fragment } from 'react'
import ShortenLinkForm from './components/ShortenLinkForm'
import CopyShortLinkForm from './components/CopyShortLinkForm'

export default class App extends Component {
  state = {
    url_shorted: false,
    shorten_url: '',
    original_url: ''
  }

  toggleForm  = () => this.setState({ url_shorted: !this.state.url_shorted })
  updateLinks = links => { this.setState(links) }

  renderForm = () => {
    if (this.state.url_shorted) {
      return (
        <CopyShortLinkForm
          shorten_url={this.state.shorten_url}
          original_url={this.state.original_url}
          toggleForm={this.toggleForm}
        />
      );
    }
    return (
      <ShortenLinkForm toggleForm={this.toggleForm} updateLinks={this.updateLinks}/>
    );
  }

  render() {
    return (
      <Fragment>
        {this.renderForm()}
      </Fragment>
    )
  }
}
