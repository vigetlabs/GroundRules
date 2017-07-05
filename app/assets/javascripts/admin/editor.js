/**
 * Editor
 * Configures Colonel Kurtz and is responsible for applying it
 * within the admin
 */

var ColonelKurtz = require('colonel-kurtz');
var blockTypes   = require('./colonel/blockTypes');
var persist      = require('./colonel/plugins/persist');

var Editor = {

  filterBlockTypes(types, whitelist) {
    return types.filter(function(type) {
      return whitelist.indexOf(type.id) > -1;
    });
  },

  /**
   * Given an `el` element, create a new ColonelKurtz instance after
   * attempting to scrape JSON from a child input
   */
  install(container) {
    var el     = container.querySelector('.colonel-kurtz-editor');
    var blocks = container.querySelector('input');

    var editor = new ColonelKurtz({ el, blocks, blockTypes });

    editor.addPlugin(persist, { el: blocks  });

    editor.start();
  },

  /**
   * Find all instances of `.colonel-kurtz` and execute `Editor.install`
   * on each found element
   */
  bootstrap() {
    $(".colonel_kurtz").toArray().forEach(Editor.install);
  }

};


/**
 * Wrapped in document.ready until ActiveAdmin places script tags
 * at the bottom of the document
 */

$(document).ready(Editor.bootstrap);
