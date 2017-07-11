/**
 * Persist
 * Listen to a Colonel Kurtz instance and spit the result
 * into an input.
 */

module.exports = {

  register: function(app, nodes, next) {

    app.listen(function() {
      nodes.el.value = JSON.stringify(app)
    })

    // Trigger an update to persist potential updates
    // to the data structure
    app.emit()

    next()
  }

}
