
async function checkin() {
  let bookingId = document.getElementById('book_id').value;

  let procName = 'spGetBookingDetails';
  let procParams = {
    'book_id': bookingId
  }

  let data = await getData(procName, procParams);
  console.log(data);

  document.getElementById('fname').value = data[0][0].book_cust_fName;
  document.getElementById('lname').value = data[0][0].book_cust_lName;
  document.getElementById('address').value = data[0][0].book_cust_address;
  document.getElementById('email').value = data[0][0].book_cust_email;
  document.getElementById('phone_no').value = data[0][0].book_cust_ph_num;
  document.getElementById('arr_date').value = data[0][0].arr_date;
  document.getElementById('dep_date').value = data[0][0].dep_date;

  let table = document.getElementById('room_table').getElementsByTagName('tbody')[0];

  for (let room of data[1]) {
    // Insert a row at the end of table
    let newRow = table.insertRow();
    let keys = Object.keys(room);

    keys.forEach((key, idx) => {
      createTableCell(newRow, room[`${key}`]);
    });
  }
}

function createTableCell(newRow, nodeText) {
  // Insert a cell at the end of the row
  let newCell = newRow.insertCell();

  // Append a text node to the cell
  let newText = document.createTextNode(nodeText);
  newCell.appendChild(newText);
}

async function processCheckin() {
  let bookId = document.getElementById('book_id').value;
  let checkinDate = document.getElementById('checkin_date').value;
  checkinDate = `${checkinDate.substr(8, 2)}-${checkinDate.substr(5, 2)}-${checkinDate.substr(0, 4)}`;
  let cleanStatus = document.getElementById('clean_status').checked;
  let fridgeStatus = document.getElementById('fridge_status').checked;
  let maintStatus = document.getElementById('maint_status').checked;

  let procName = 'spNewCheckin';
  let procParams = {
    'book_id': bookId,
    'checkin_date': checkinDate,
    'cin_clean_status': cleanStatus,
    'cin_fridge_status': fridgeStatus,
    'cin_maint_status': maintStatus
  };

  let result = await postData(procName, procParams);
  if(result[0][0].result_id == '1') {
    alert(`Customer checked in successfully`);
}
}