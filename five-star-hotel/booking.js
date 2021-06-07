let hotelList = [];

window.onload = main();
async function main() {
    let hotelSelect = document.getElementById('hotel_id');
    hotelList = await getHotelList();
    for (let hotel of hotelList[0]) {
        let option = document.createElement('option');
        option.value = hotel.hotel_id;
        option.text = hotel.hotel_location;
        hotelSelect.appendChild(option);
    }
}

async function getHotelList() {
    let procName = 'spGetHotelDetails';
    let procParams = {};
    return await getData(procName, procParams);
}

async function getAvailableRooms() {
    let hotelId = document.getElementById('hotel_id').value;
    let checkinDate = document.getElementById('checkin_date').value;
    let checkoutDate = document.getElementById('checkout_date').value;

    checkinDate = `${checkinDate.substr(8, 2)}-${checkinDate.substr(5, 2)}-${checkinDate.substr(0, 4)}`;
    checkoutDate = `${checkoutDate.substr(8, 2)}-${checkoutDate.substr(5, 2)}-${checkoutDate.substr(0, 4)}`;

    let procName = 'spGetAvailableRooms';
    let procParams = {
        'hotel_id': hotelId,
        'arr_date': checkinDate,
        'dep_date': checkoutDate,
    }

    let rooms = await getData(procName, procParams);
    console.log(rooms[0]);
    let tbodyRef = document.getElementById('avlRooms').getElementsByTagName('tbody')[0];
    for (let room of rooms[0]) {
        // Insert a row at the end of table
        let newRow = tbodyRef.insertRow();
        let keys = Object.keys(room);

        keys.forEach((key, idx) => {
            if (key != 'room_id')
                createTableCell(newRow, room[`${key}`]);
        });
        let checkbox = document.createElement('input');
        checkbox.type = "checkbox";
        checkbox.id = `${room.room_id}`;
        // Insert a cell at the end of the row
        let newCell = newRow.insertCell();
        newCell.appendChild(checkbox);
    }
}

function createTableCell(newRow, nodeText) {
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();

    // Append a text node to the cell
    let newText = document.createTextNode(nodeText);
    newCell.appendChild(newText);
}

async function addBooking() {
    let hotelId = document.getElementById('hotel_id').value;
    let checkinDate = document.getElementById('checkin_date').value;
    let checkoutDate = document.getElementById('checkout_date').value;

    checkinDate = `${checkinDate.substr(8, 2)}-${checkinDate.substr(5, 2)}-${checkinDate.substr(0, 4)}`;
    checkoutDate = `${checkoutDate.substr(8, 2)}-${checkoutDate.substr(5, 2)}-${checkoutDate.substr(0, 4)}`;

    let fname = document.getElementById('fname').value;
    let lname = document.getElementById('lname').value;
    let email = document.getElementById('email').value;
    let address = document.getElementById('address').value;
    let phn = document.getElementById('phn').value;
    let bookingmode = document.getElementById('mode').value;
    let roomId = 0;
    let roomPrice = 0;
    let status = document.getElementById('status').value;

    let tbodyRef = document.getElementById('avlRooms').getElementsByTagName('tbody')[0];

    for(let i = 0; i < tbodyRef.rows.length; i++) {
        let children = tbodyRef.rows.item(i).cells.item(6).children;
        for(let child of children) {
            if(child.checked){
                roomId = child.id;
                roomPrice = tbodyRef.rows.item(i).cells.item(5).innerText;
                console.log(roomId, roomPrice);
            }

        }
    }

    let procName = 'spNewHotelBooking';
    let procParams = {
        'hotel_id': hotelId,
        'employee_id': 2,
        'book_type': bookingmode,
        'discount': '0.0',
        'book_arrival_date': checkinDate,
        'book_departure_date': checkoutDate,
        'room_id': roomId,
        'price': roomPrice,
        'book_cust_fName': fname,
        'book_cust_mName': null,
        'book_cust_lName': lname,
        'book_cust_doc_id': null,
        'book_cust_address': address,
        'book_cust_ph_num': phn,
        'book_cust_email': email,
        'book_status': status,
    };
    let result = await postData(procName, procParams);
    if(result[0][0].result_id == '1') {
        alert(`Your booking confirmation number is ${result[1][0].booking_id}`)
    }
}