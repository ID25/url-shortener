import React, { Component } from 'react';
import ShortenLinkForm from './components/ShortenLinkForm';
import CopyForm from './components/CopyForm';
import LogoSvg from 'images/logo';

export default class App extends Component {
  state = {
    url_shorted: false,
    shorten_url: '',
    original_url: ''
  };

  toggleForm = () => {
    this.setState({ url_shorted: !this.state.url_shorted });
  };

  updateLinks = (links) => { this.setState(links); }

  renderForm = () => {
    if (this.state.url_shorted) {
      return (
        <CopyForm
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
      <div className="root">
        <img src={LogoSvg} className="logo_svg"/>
        {this.renderForm()}
      </div>
    )
  }
}
