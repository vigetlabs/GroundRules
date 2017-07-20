class NavToggle {

	constructor(element) {
		this.el = element;
		this.addEvents();
	}

	addEvents() {
		console.log(this.el);
		this.el.addEventListener('click', this.doClick.bind(this));
	}

	doClick() {
		console.log('clicked!');
	}
};

var elements = document.querySelectorAll("[data-feature='navToggle']");
for (var i=0; i < elements.length; i++) {
	var element = elements[i];
	new NavToggle(element);
}