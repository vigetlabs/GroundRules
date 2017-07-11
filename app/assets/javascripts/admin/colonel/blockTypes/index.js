/**
 * BlockTypes
 */

module.exports = [
  {
    id:        'youtube',
    label:     'Youtube',
    component: require('colonel-kurtz/addons/youtube')
  },
  {
    id: 'image',
    label: 'Image',
    component: require('colonel-kurtz/addons/image')
  },
  {
    id: 'text',
    label: 'Text',
    component : require('colonel-kurtz/addons/medium')
  }
]
