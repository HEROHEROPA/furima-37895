
window.addEventListener('load', function(){
   const fee = document.getElementById("item-price")
      fee.addEventListener("keyup",()=>{
      console.log(fee.value)
     const addFee =  document.getElementById('add-tax-price')   
          addFee.innerText=Math.floor(fee.value*1.1) 
   })

})