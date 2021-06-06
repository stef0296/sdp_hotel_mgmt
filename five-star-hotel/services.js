var select = document.getElementById("service");
let serviceArr = [
    {
        service_id: 0,
        service_desc: 'Food',
        service_price: 100,
    },
    {
        service_id: 1,
        service_desc: 'Valet Parking',
        service_price: 200,
    },
    {
        service_id: 2,
        service_desc: 'Drinks',
        service_price: 300,
    },
];

serviceArr.forEach((service) => {
    var option = document.createElement("OPTION");
    option.value = service.service_id;
    option.text = service.service_desc;
    select.appendChild(option, select.lastChild);
});

function service() {
    var book_id = document.getElementById('book_id').value;
    var room_no = document.getElementById('room_no').value;
    console.log(book_id);
    console.log(room_no)
    console.log(document.getElementById('service').value);
}
