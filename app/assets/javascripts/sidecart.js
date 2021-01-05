/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openCart() {
    document.getElementById("mySidecart").style.width = "20%";
    document.getElementById("main").style.marginLeft = "80%";
  }
  /* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
  function closeCart() {
    document.getElementById("mySidecart").style.width = "0";
    document.getElementById("main").style.marginLeft = "100%";
  }