let book_id, room_total, disc_perc, disc_val, vas_total, gr_total;

async function getCheckoutDetails() {
    let roomNo = document.getElementById('room_no').value;
    let procName = 'spGetCheckoutDetails';
    let procParams = {
        'room_no': roomNo
    };
    let result = await getData(procName, procParams);
    console.log(result);

    book_id = result[0][0].book_id;
    document.getElementById('book_id').value = result[0][0].book_id;

    room_total = result[3][0].room_total;
    disc_perc = result[3][0].disc_perc;
    disc_val = result[3][0].disc_val;
    vas_total = result[3][0].vas_total;
    gr_total = result[3][0].gr_total;

    let roomTable = document.getElementById('room_table').getElementsByTagName('tbody')[0];
    for (let room of result[1]) {
        // Insert a row at the end of table
        let newRow = roomTable.insertRow();
        let keys = Object.keys(room);

        keys.forEach((key, idx) => {
            if (key != 'room_id')
                createTableCell(newRow, room[`${key}`]);
        });
    }

    document.getElementById('room_total_price').innerText = `Eur. ${room_total}`;

    let vasTable = document.getElementById('vas_table').getElementsByTagName('tbody')[0];
    for (let vas of result[2]) {
        // Insert a row at the end of table
        let newRow = vasTable.insertRow();
        let keys = Object.keys(vas);

        keys.forEach((key, idx) => {
            if (key != 'vas_id')
                createTableCell(newRow, vas[`${key}`]);
        });
    }

    document.getElementById('vas_total').innerText = `Eur. ${result[3][0].vas_total}`;
    
    document.getElementById('room_gr_tot').innerText = `Eur. ${room_total}`;
    document.getElementById('room_disc').innerText = `Eur. ${disc_val} (${disc_perc}%)`;
    document.getElementById('vas_gr_total').innerText = `Eur. ${vas_total}`;
    document.getElementById('gr_total').innerText = `Eur. ${gr_total}`;
}

function createTableCell(newRow, nodeText) {
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();

    // Append a text node to the cell
    let newText = document.createTextNode(nodeText);
    newCell.appendChild(newText);
}


async function processCheckout() {
    let procName = 'spNewCheckout';
    let procParam = {
        'cout_book_id': book_id,
        'room_total': room_total,
        'vas_total': vas_total,
        'disc_perc': disc_perc,
        'disc_val': disc_val,
        'gr_total': gr_total,
    };
    let result = await postData(procName, procParam);
    if(result[0][0].result_id == '1') {
        alert(`Successfully checked out customer. Checkout ID: ${result[1][0].cout_id}`)
    }
}