class sliderToggle {

  constructor(element) {
    this.element = element;
    this.colors = ['#F2C287', '#823E2A', '#7A2F22', '#5E180A', '#4A0900', '#330600', '#1A0300', '#0F0300'];
    this.defaultColor = "#DBDBDB";
    this.roasts = document.querySelectorAll(".roasts__view");
    this.brandWrappers = document.querySelectorAll(".roasts__brands-wrapper");

    for (var i = 0, len = this.roasts.length; i < len; i++) {
      this.roasts[i].classList.add("hidden");
      this.brandWrappers[i].classList.add("hidden");
    }
    this.addEvents();
    this.updateContent(this.element.value);
  }

  addEvents() {
    this.element.addEventListener('input', this.rangeChange.bind(this));
  }

  rangeChange() {
    this.updateSlider();
    this.updateContent(this.element.value);
  }

  updateSlider() {
    var percentage = ((parseFloat(this.element.value))/7)*100 + '%';
    var backgroundStyles = "linear-gradient(to right, " + this.colors[this.element.value] + " " + percentage + ", " + this.defaultColor + " 0%)";
    this.element.style.background = backgroundStyles;
  }


  updateContent(value) {
    for (var i = 0, len = this.roasts.length; i < len; i++) {
      this.roasts[i].classList.add("hidden");
      this.brandWrappers[i].classList.add("hidden");
    }
    var roast = document.getElementById('roast' + value);
    var brand = document.getElementById('brand-wrapper' + value);

    if (roast != null) roast.classList.remove("hidden");
    if (brand != null) brand.classList.remove("hidden");
  }

};

var elements = document.querySelectorAll("[data-feature='sliderToggle']");
for (var i=0; i < elements.length; i++) {
  var element = elements[i];
  new sliderToggle(element);
}

module.exports = sliderToggle
