import React, { Component } from 'react';
import ShortenLinkForm from './components/ShortenLinkForm';
import CopyForm from './components/CopyForm';
import LogoSvg from 'images/logo';

export default class App extends Component {
  state = {
    url_shorted: false,
    shorten_link: ''
  };

  toggleForm = () => {
    this.setState({ url_shorted: !this.state.url_shorted });
  };

  updateShortenLink = (link) => {
    this.setState({ shorten_link: link });
  }

  renderForm = () => {
    if (this.state.url_shorted) {
      return (
        <CopyForm shorten_link={this.state.shorten_link} toggleForm={this.toggleForm}/>
      );
    }
    return (
      <ShortenLinkForm toggleForm={this.toggleForm} updateShortenLink={this.updateShortenLink}/>
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
