const button = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

headers.map(x => {
  x.onclick = function() {
    console.log(this.nextSibling.nextSibling)
    this.nextSibling.nextSibling.classList.add('shown')
    this.nextSibling.nextSibling.classList.remove('screenreader-only')
  }
})

var keurig = {
  device: document.querySelector('.__keurig'),
  list: document.querySelector('.keurig__problems')
}
var drip = {
  device: document.querySelector('.__maker'),
  list: document.querySelector('.maker__problems')
}
var press = {
  device: document.querySelector('.__press'),
  list: document.querySelector('.press__problems')
}
var devices = [keurig, drip, press]

const removeThis = i => {
  devices.forEach(i => {
<<<<<<< HEAD
    i.device.classList.remove('device-selected')
=======
    i.device.classList.remove('device-selcted')
    // i.device.classList.add('inactive')
    // i.list.classList.remove('active');
>>>>>>> device page js functionality part 1
    i.list.classList.add('__inactive')
    console.log('should have worked')
  })
}

devices.map(function(i) {
  i.device.onclick = function() {
    if (i.device.classList.contains('device-selected')) {
      removeThis(i)
      // i.device.classList.remove('inactive')
      i.device.classList.add('device-selected')
<<<<<<< HEAD
    } else {
=======
    } else if (!i.device.classList.contains('device-selected')) {
>>>>>>> device page js functionality part 1
      removeThis(i)

      i.device.classList.add('device-selected')
      // i.device.classList.remove('inactive')
      i.list.classList.remove('__inactive')
<<<<<<< HEAD
=======
    } else {
      // i.device.classList.remove('inactive')
>>>>>>> device page js functionality part 1
    }
  }
})
