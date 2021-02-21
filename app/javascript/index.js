function pullDown() {

  var parent = document.querySelectorAll(".list");
  var node = Array.prototype.slice.call(parent, 0);

  node.forEach(function (element) {
    element.addEventListener(
      "mouseover",
      function () {
        element.querySelector(".show-lists").classList.add("active");
      },
      false
    );
    element.addEventListener(
      "mouseout",
      function () {
        element.querySelector(".show-lists").classList.remove("active");
      },
      false
    );
  });
}

window.addEventListener('turbolinks:load', pullDown)