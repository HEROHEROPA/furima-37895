window.addEventListener('load', function(){
  
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵

  const buy = document.getElementById("button")
     buy.addEventListener("click",(e)=>{
      e.preventDefault()
    
      const formResult = document.getElementById("charge-form");//フォームの要素を全て取得している
      const formData = new FormData(formResult);//フォームデータメソッド


    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
   
   console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name"); //フォームにあるカード情報を削除しサーバーには送信しない。トークンのみを送信する

       document.getElementById("charge-form").submit();//フォーム送信
    });
   
    

  })

})