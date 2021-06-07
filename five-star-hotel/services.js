
let serviceArr = [];
let hidden_price="";
window.onload = main();

async function main() {
    let service = document.getElementById('service');
   
    serviceArr = await getServicelList();
    for (let ser of serviceArr[0]) {
        let option = document.createElement('option');
        option.value = [ser.service_id, ser.service_price];
        option.text = ser.service_desc + " - " +ser.service_price + " €";
      
        service.appendChild(option);
    }
}


async function getServicelList() {
    let procName = 'spGetServiceDetails';
    let procParams = {};
    return await getData(procName, procParams);
}

async function addVas() {
    let book_id = document.getElementById('book_id').value;
    let serviceid_price = document.getElementById('service').value;
    let values = [];
    `${values = serviceid_price.split(",")}`;

    let service_id=values[0];
    let service_price=values[1];
    console.log(book_id,service_id,service_price);
    let procName = 'spNewVasDetailsRecord';
    let procParams = {
        'vas_book_id':book_id,
		'vas_service_id':service_id,
		'vas_price':service_price,

    };

    let result = await postData(procName, procParams);
    console.log(result);
    if(result[0][0].result_id == '1') {
    alert(`Service is added`);
    }


}