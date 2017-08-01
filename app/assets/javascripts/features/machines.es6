const button = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

headers.map(x => {
  x.onclick = function() {
    console.log(this.nextSibling.nextSibling)
    this.nextSibling.nextSibling.classList.toggle('shown')
    this.nextSibling.nextSibling.classList.toggle('screenreader-only')
  }
})

// device and list changer
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
    i.device.classList.remove('device-selected')
    i.list.classList.add('__inactive')
  })
}
const addThis = i => {
  devices.forEach(i => {
    i.device.classList.add('device-selected')
    i.list.classList.remove('__inactive')
  })
}

devices.map(function(i) {
  i.device.onclick = function() {
    if (i.device.classList.contains('device-selected')) {
    } else {
      removeThis(i)
      i.device.classList.add('device-selected')
      i.list.classList.remove('__inactive')
    }
  }
})
