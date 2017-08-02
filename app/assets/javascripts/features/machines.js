const buttons = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

var first_device = {
  device: document.querySelector('.__1'),
  list: document.querySelector('.1__problems')
}
var second_device = {
  device: document.querySelector('.__2'),
  list: document.querySelector('.2__problems')
}
var third_device = {
  device: document.querySelector('.__3'),
  list: document.querySelector('.3__problems')
}
var devices = [first_device, second_device, third_device]

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
