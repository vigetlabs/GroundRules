/**
 * Picker
 * Configures ArsArsenal and is responsible for applying it
 * within the admin
 */

var ArsArsenal = require('ars-arsenal')

/**
 * To prevent duplication, store the picker at the following key:
 */
var STORAGE = 'picker'

var Picker = {

  /**
   * These styles are used to visually hide an element
   */
  visuallyHidden: { position: 'absolute', clip: 'rect(0, 0, 0, 0)' },

  /**
   * Given an `el` element, hide all items that are not neccessary
   * after applying the picker
   */
  hide(el) {
    var $el = $(el)

    $el.find('.image-preview').hide()
    $el.find('input').css(Picker.visuallyHidden)
  },

  /**
  * Given an `el` element, extract the expected API endpoint location
   */
  getEndpoint(el) {
    return $(el).find('input').data('url')
  },

  /**
   * Given an `el` element, check if it includes an existing reference to
   * the picker
   */
  shouldInstall(el) {
    return !$(el).data(STORAGE)
  },

  /**
   * Given an `select` element, validate that it contains the properties neccessary
   * to produce a valid picker.
   */
  isValid(el) {
    var hasEndpoint = Picker.getEndpoint(el)

    return [ hasEndpoint ].every(Boolean)
  },

  /**
   * Given an `el` element, create a new ArsArsenal instance after
   * attempting to scrape JSON from a child input
   */
  install(el) {
    var $el    = $(el)
    var input  = $el.find('input')
    var picker = document.createElement('div')

    if (Picker.isValid(el) === false) {
      return console.warn('Selected element could not be turned into a picker', el)
    }

    Picker.hide(el)

    /**
     * At the moment, we apply ArsArsenal to an empty div that is appended
     * to the element. This is so that we can allow default behavior should
     * something go horribly wrong.
     */
    el.appendChild(picker)

    console.log('Added ArsArsenal Picker')

    ArsArsenal.render(picker, {
      url       : Picker.getEndpoint(el),
      resource  : input.data('resource'),
      picked    : input.val(),
      onChange  : input.val.bind(input),
      makeQuery : (term) => `q[name_contains]=${ term }`
    })

    /**
     * Save a reference so that we do not apply this behavior again on
     * the element
     */
    $el.data(STORAGE, true)
  },

  /**
   * Find all instances of `.photo_select` and execute `Picker.install`
   * on each found element
   */
  bootstrap() {
    $('.photo_select, .file_upload_select').toArray()
      .filter(Picker.shouldInstall)
      .forEach(Picker.install)
  }

}

/**
 * When ready, and whenever the has_many.js script has added a new item,
 * bootstrap the picker onto the page. We can carelessly apply this as much
 * as we want because of the filtering occuring in `Picker.bootstrap`.
 */

$(document).ready(Picker.bootstrap)
           .on('has_many_add:after', Picker.bootstrap)
