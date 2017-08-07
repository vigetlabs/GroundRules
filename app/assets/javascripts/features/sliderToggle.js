class sliderToggle {

  constructor(element) {
    this.element = element;
    this.visibleRoast = document.getElementById("roast"+this.element.value);
    this.visibleBrands = document.getElementById("brand-wrapper"+this.element.value).querySelector('.brands__wrapper');
    this.colors = ['#F2C287', '#823E2A', '#7A2F22', '#5E180A', '#4A0900', '#330600', '#1A0300', '#0F0300'];
    this.defaultColor = "#DBDBDB";
    this.roasts = document.querySelectorAll(".roasts__view");
    this.brandWrappers = document.querySelectorAll(".roasts__brands-wrapper");

    for (var i = 0, len = this.roasts.length; i < len; i++) {
      this.roasts[i].classList.add("hidden");
      this.brandWrappers[i].classList.add("hidden");
    }
    var roast = document.getElementById('roast' + this.element.value);
    var brand = document.getElementById('brand-wrapper' + this.element.value);
    if (roast != null) roast.classList.remove("hidden");
    if (brand != null) brand.classList.remove("hidden");

    this.addEvents();
    // this.updateContent(this.element.value);
  }

  addEvents() {
    this.element.addEventListener('input', this.rangeChange.bind(this));
  }

  rangeChange() {
    for (var i = 0, len = this.roasts.length; i < len; i++) {
      this.brandWrappers[i].classList.add("hidden");
    }
    var brands = document.getElementById('brand-wrapper' + this.element.value);
    if (brands != null) brands.classList.remove("hidden");

    this.updateSlider();
    console.log(this.updateContent(this.element.value, brands));
  }

  updateSlider() {
    var percentage = ((parseFloat(this.element.value))/7)*100 + '%';
    var backgroundStyles = "linear-gradient(to right, " + this.colors[this.element.value] + " " + percentage + ", " + this.defaultColor + " 0%)";
    this.element.style.background = backgroundStyles;
  }


  updateContent(value, brands) {
    var brand = brands.querySelector('.brands__wrapper');

    var roastArr = [this.visibleRoast];
    var brandArr = [this.visibleBrands];
    var roast = document.getElementById('roast' + value);


    roastArr = makeVisible(roast, roastArr, 5, true);
    this.visibleRoast = roastArr[0];

    brandArr = makeVisible(brand, brandArr, 20, false);
    this.visibleBrands = brandArr[0];

    return roastArr;
  }

};

var elements = document.querySelectorAll("[data-feature='sliderToggle']");
for (var i=0; i < elements.length; i++) {
  var element = elements[i];
  new sliderToggle(element);
}


function makeVisible(x, vis, timer, bool)
{
  var timerDuration = timer;
  var op = 1;
  var y = x;
  if (vis.length > 0) {
    for (var i = 0; i < vis.length; i++) {
      var z = vis[i];
      if (!bool) {
        y.style.opacity = 0;
        y.classList.remove("hidden");
      }
      if (z == y) return;

      var timer = setInterval(function () {
        if (op <= 0.1) {
          clearInterval(timer);
          z.classList.add("hidden");
          z.style.opacity = 1;
          y.style.opacity = 1;
          y.style.filter = "none";
          y.classList.remove("hidden");
        }
        else {
          z.style.opacity = op;
          y.style.opacity = 1-op;
          z.style.filter = 'alpha(opacity=' + op * 100 + ")";
          y.style.filter = 'alpha(opacity=' + (1-op) * 100 + ")";
          op -= op * 0.1;
        }
      }, timerDuration);

      op = 1;
      vis.splice(i, 1);
    }
  } else {
    y.classList.remove("hidden");
    y.style.opacity = 1;
    y.style.filter = "none";
  }
  vis.push(x);
  return vis;
}

module.exports = sliderToggle
