window.addEventListener('load', function(){
  
  // const cardNumber =  document.getElementById('card-number') 
  //    cardNumber.addEventListener("keyup",()=>console.log(cardNumber.value))

  // const cardExpMonth =  document.getElementById("card-exp-month") 
  //    cardExpMonth.addEventListener("keyup",()=>console.log(cardExpMonth.value))

  // const cardExpYear =  document.getElementById('card-exp-year')
  //    cardExpYear.addEventListener("keyup",()=>console.log(cardExpYear.value))

  // const cardCvc =  document.getElementById('card-cvc')
  //    cardCvc.addEventListener("keyup",()=>console.log(cardCvc.value))
  
  // let cardInfo=[cardNumber,cardExpMonth,cardExpYear,cardCvc] 
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵

  const buy = document.getElementById("button")
     buy.addEventListener("click",(e)=>{
      e.preventDefault()
    
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);


    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
   
   console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        // console.log(response)
        const token = response.id;
        // console.log(token)

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name"); //フォームにあるカード情報を削除しサーバーには送信しない。トークンのみを送信する

       document.getElementById("charge-form").submit();//フォーム送信
    });
   
    

  })

})