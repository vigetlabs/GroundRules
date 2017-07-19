var ArsArsenal = require('ars-arsenal').component
var React      = require('react')

module.exports = React.createClass({
  getDefaultProps() {
    return {
      label: 'Photo',
      content: {
        photo_id : null
      }
    }
  },

  renderLabel() {
    return this.props.label ? (
      <p className="col-block__label">{ this.props.label }</p>
    ) : null
  },

  render() {
    let photoProps = {
      makeQuery : (term) => `q[name_contains]=${ term }`,
      onChange  : this._onPhotoChange,
      picked    : this.props.content.photo_id,
      url       : ADMIN_PHOTOS_PATH // see env.js.erb
    }

    let linkProps = {
      target    : "_blank",
      className : "photo-picker-button",
      href      : ADMIN_NEW_PHOTO_PATH
    }

    return (
      <div>
        { this.renderLabel() }

        <ArsArsenal { ...photoProps } />

        <a { ...linkProps } >New</a>
      </div>
    )
  },

  _onPhotoChange(photo_id) {
    this.props.onChange({ photo_id })
  }
})
