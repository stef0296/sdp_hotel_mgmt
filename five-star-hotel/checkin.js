
  function Checkin() {

    var bookigid = document.querySelector("#book_id").value;
    var bookingdate = document.querySelector('#checkin_date').value;
    console.log(bookigid);
    console.log(bookingdate);
  }

  function CleanCheck() {
    var cleaned = document.getElementById("Clean").checked;

    if (cleaned == true) {
      cleaned = 1;
    }
    else {
      cleaned = 0;
    }
    console.log(cleaned);
    var fridge = document.getElementById("Fridge").checked;
    if (fridge == true) {
      fridge = 1;
    }
    else {
      fridge = 0;
    }

    console.log(fridge);
    var fridge = document.getElementById("Maintain").checked;
    if (fridge == true) {
      fridge = 1;
    }
    else {
      fridge = 0;
    }
    console.log(fridge);

  }


