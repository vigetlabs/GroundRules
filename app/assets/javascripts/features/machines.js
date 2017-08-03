const buttons = [...document.querySelectorAll('button')]
const solutions = [...document.querySelectorAll('.problem__solutions')]
const headers = [...document.querySelectorAll('.device__problems header')]

const devices = [
  {
    device: document.querySelector('.device__1'),
    list: document.querySelector('.device-1__problems')
  },
  {
    device: document.querySelector('.device__2'),
    list: document.querySelector('.device-2__problems')
  },
  {
    device: document.querySelector('.device__3'),
    list: document.querySelector('.device-3__problems')
  }
]

const hideAll = () => {
  devices.forEach(device => {
    device.device.classList.remove('device-selected')
    device.list.classList.add('-inactive')
  })
}

const addAll = i => {
  i.device.classList.add('device-selected')
  i.list.classList.remove('-inactive')
}

const addThis = i => {
  i.device.classList.add('device-selected')
  i.list.classList.remove('-inactive')
}

devices.map(function(i) {
  i.device.onclick = function() {
    if (!this.classList.contains('device-selected')) {
      hideAll()
      addAll(i)
    } else {
    }
  }
})

// Problem Statements
headers.map(x => {
  x.onclick = function() {
    const problem = this.nextSibling.nextSibling.classList
    const button = this.parentNode.querySelector('button')
    const caret = this.childNodes[2].nextSibling.classList
    problem.toggle('shown')
    problem.toggle('-inactive-list-item')
    caret.toggle('-flip-caret')
    button.setAttribute('aria-expanded', 'true')
  }
})
