/**
 * BlockTypes
 */

module.exports = [
  {
    id:          'photo',
    label:       'Photo',
    component:   require('./PhotoPicker')
  },
  {
    id:         'text',
    label:      'Text',
    component:  require('colonel-kurtz/addons/medium')
  }
]
