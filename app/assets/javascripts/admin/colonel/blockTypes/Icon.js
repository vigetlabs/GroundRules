var React = require('react')
var Select = require('./Select')

module.exports = React.createClass({

  getDefaultProps() {
    return {
      content: { id: '' }
    }
  },

  render: function() {
    return (
      <div>
        <p className="col-block__label">Icon</p>
        <Select
          onChange={ this.onChange }
          items={ AVAILABLE_ICONS.map(this.toItem) }
          selected={ this.props.content.id }
          message={ 'Select an Icon' }
          renderOption={ this.renderOption }
        />
      </div>
    )
  },

  onChange: function(id) {
    this.props.onChange({ id })
  },

  toItem: function(filepath) {
    var array = filepath.split('/')
    var filename = array[array.length-1].replace(/[\.].+$/, '').replace('_', ' ')
    var label = filename.charAt(0).toUpperCase() + filename.slice(1)
    return { filepath, label }
  },

  renderOption: function(item) {
    return <option key={ item.filepath } value={ item.filepath }>{ item.label }</option>
  }
})
