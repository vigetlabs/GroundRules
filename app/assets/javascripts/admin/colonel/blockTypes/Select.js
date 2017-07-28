var React = require('react')

module.exports = React.createClass({
  propTypes: {
    multiple     : React.PropTypes.bool,
    renderOption : React.PropTypes.func,
    onChange     : React.PropTypes.func.isRequired,
    items        : React.PropTypes.array.isRequired,
    includeBlank : React.PropTypes.bool,
    selected     : React.PropTypes.oneOfType([
                     React.PropTypes.array,
                     React.PropTypes.string
                   ]),
    message      : React.PropTypes.string
  },

  getDefaultProps: function() {
    return {
      multiple     : false,
      includeBlank : true,
      selected     : '',
      items        : [],
      message      : 'Select an option',
      renderOption : function(item) {
        return <option key={ item }>{ item }</option>
      }
    }
  },

  renderBlank: function() {
    if (this.props.includeBlank) {
      return <option value=''>{ this.props.message }</option>
    }
  },

  render: function() {
    return (
      <select
        multiple={ this.props.multiple }
        value={ this.props.selected }
        onChange={ this.onChange }
      >
        { this.renderBlank() }
        { this.props.items.map(this.props.renderOption) }
      </select>
    )
  },

  onChange: function(event) {
    this.props.onChange(event.target.value)
  }
})
