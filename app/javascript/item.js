
window.addEventListener('load', function(){
   const fee = document.getElementById("item-price")
      fee.addEventListener("keyup",()=>{
     const addFee =  document.getElementById('add-tax-price')   
          addFee.innerText=Math.floor(fee.value*0.1) 
     const profit = document.getElementById('profit')  
          profit.innerText=fee.value-Number(addFee.innerText)  
   })

})