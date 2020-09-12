window.addEventListener('load', function(){
const price = document.getElementById("item-price")
price.addEventListener("keyup", function(){
  
    let amount = price.value;
    let tax = Math.ceil(amount * 0.1);
    let profit = Math.floor(amount * 0.9);
    document.getElementById('add-tax-price').innerHTML = tax;
    document.getElementById('profit').innerHTML = profit;
  });
 })