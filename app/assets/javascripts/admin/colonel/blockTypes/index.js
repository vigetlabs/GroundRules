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
    id:         'icon',
    label:      'Icon',
    component:  require('./Icon')
  },
  {
    id:         'text',
    label:      'Text',
    component:  require('colonel-kurtz/addons/medium')
  }
]
