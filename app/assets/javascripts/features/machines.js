const buttons = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

var first_device = {
  device: document.querySelector('.device__1'),
  list: document.querySelector('.device-1__problems')
}
var second_device = {
  device: document.querySelector('.device__2'),
  list: document.querySelector('.device-2__problems')
}
var third_device = {
  device: document.querySelector('.device__3'),
  list: document.querySelector('.device-3__problems')
}

var devices = [first_device, second_device, third_device]

const removeThis = i => {
  devices.forEach(i => {
    i.device.classList.remove('device-selected')
    i.list.classList.add('__inactive')
  })
}

const addThis = i => {
  i.device.classList.add('device-selected')
  i.list.classList.remove('__inactive')
}

devices.map(function(i) {
  i.device.onclick = function() {
    if (this.classList.contains('device-selected')) {
    } else {
      removeThis(i)
      addThis(i)
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
