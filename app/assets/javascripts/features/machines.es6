const buttons = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

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
      removeThis(i)
      i.device.classList.add('device-selected')
    } else {
      removeThis(i)
      i.device.classList.add('device-selected')
      i.list.classList.remove('__inactive')
    }
  }
})

// Problem Statements
headers.map(x => {
  x.onclick = function() {
    this.nextSibling.nextSibling.classList.toggle('shown')
    this.nextSibling.nextSibling.classList.toggle('__inactive-list-item')
    this.childNodes[2].nextSibling.classList.toggle('-flip-caret')
  }
})
