var axios = require('axios')

class axiosSample {
  constructor(element) {
    this.element = element;
    this.buttons = this.element.querySelectorAll('.button');
    this.addEvents();
  }

  addEvents() {
    for (var i=0, len=this.buttons.length; i < len; i++) {
      var button = this.buttons[i];
      button.addEventListener('click', this.onButtonClick.bind(this));
    }

    // ES6 version with map
    // this.buttons.map(button => {
    //   button.addEventListener('click', this.onButtonClick.bind(this));
    // })
  }

  onButtonClick(e) {
    var target = e.currentTarget;
    var url = target.getAttribute('href');

    axios.get(url)
      .then(this.onSuccess.bind(this))
      .catch(this.onError.bind(this));

    e.preventDefault();
  }

  onSuccess(response) {
    var html   = response.request.response;
    var newDOM = document.createElement('html');
    newDOM.innerHTML = html

    var content = newDOM.querySelector('.home__inner-section')
    this.element.appendChild(content)
  }

  onError() {
    // could not load - show message
    console.log('error', error);
  }
};

var elements = document.querySelectorAll("[data-feature='axiosSample']");
for (var i=0; i < elements.length; i++) {
  var element = elements[i];
  new axiosSample(element);
}
