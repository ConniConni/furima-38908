window.addEventListener('load', () => {
 
const priceInput = document.getElementById('item-price');


priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const taxInput = document.getElementById('add-tax-price');
  const profitInput = document.getElementById('profit');

  taxInput.innerHTML = Math.floor(inputValue * 0.1)
  profitInput.innerHTML = inputValue - Math.floor(inputValue * 0.1)
})

});