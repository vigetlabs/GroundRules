const mainMachines = document.querySelector('main.devices')

if (mainMachines && mainMachines.dataset.jsload == 'true') {
  var whatInput = require('what-input')

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

  const hideHeaders = () => {
    headers.forEach(header => {
      header.nextSibling.nextSibling.classList.remove('shown')
      header.nextSibling.nextSibling.classList.add('-inactive-list-item')
      header.childNodes[2].nextSibling.classList.remove('-flip-caret')
    })
  }

  devices.map(i => {
    let handler = () => {
      if (!i.device.classList.contains('device-selected')) {
        hideHeaders()
        hideAll()
        addAll(i)
      } else {
      }
    }
    i.device.addEventListener('click', () => {
      handler()
    })
    i.device.addEventListener('keydown', e => {
      if (e.keyCode == 13 || e.keyCode == 32) {
        handler()
      } else {
      }
    })
  })

  headers.map(header => {
    hideHeaders()
    const problem = header.nextSibling.nextSibling.classList
    const button = header.parentNode.querySelector('button')
    const caret = header.childNodes[2].nextSibling.classList

    header.addEventListener('click', () => {
      if (!problem.contains('shown')) {
        hideHeaders()
        problem.add('shown')
        problem.remove('-inactive-list-item')
        caret.add('-flip-caret')

        if (button.getAttribute('aria-expanded') == 'false') {
          button.setAttribute('aria-expanded', 'true')
        } else {
          button.setAttribute('aria-expanded', 'false')
        }
      } else {
        problem.remove('shown')
        problem.add('-inactive-list-item')
        caret.remove('-flip-caret')
      }
    })
  })
} else if (mainMachines == null) {
} else {
}
