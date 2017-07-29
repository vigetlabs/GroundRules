var dank = document.querySelectorAll('button')

dank.map(x => {
  x.onclick = function() {
    alert(x)
    this.classList.add('shown')
  }
})
// dank[0].onclick = function() {
//   alert('hi')
//   this.classList.add('shown')
// }
// dank[1].onclick = function() {
//   alert('bye')
// }
// console.log(dank)
