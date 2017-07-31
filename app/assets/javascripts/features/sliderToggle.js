class sliderToggle {

  constructor(element) {
    this.element = element;
    this.element.array = ['#F2C287', '#823E2A', '#7A2F22', '#5E180A', '#4A0900', '#330600', '#1A0300', '#0F0300'];
    this.addEvents();
  }

  addEvents() {
    this.element.addEventListener('input', this.rangeChange.bind(this));
  }

  rangeChange() {
    var percentage = ((parseFloat(this.element.value))/7)*100 + '%';
    var backgroundStyles = "linear-gradient(to right, " + this.element.array[this.element.value] + " " + percentage + ", #DBDBDB 0%)";
    this.element.style.background = backgroundStyles;
  }

};

var elements = document.querySelectorAll("[data-feature='sliderToggle']");
for (var i=0; i < elements.length; i++) {
  var element = elements[i];
  new sliderToggle(element);
}

// const testArray = [0, 1, 2, 3];

// testArray.map((i) => {
//   // add sliderToggle to i
//   console.log(i)
// })

