window.onload = test;
function test() {

    // GET Method
    // let procName = 'get_countries';
    // let procParams = {
    //     'show_inactive': 1,
    // };
    // let url = `http://localhost:3000/get_data?proc_name=${procName}&proc_params=${JSON.stringify(procParams)}`;
    // fetch(url)
    //     .then(async res => {
    //         let data = await res.json();
    //         console.log('res', data); 
    //     })
    //     .catch(err => { console.log(err) });



    // POST Method
    let procName = 'spGetHotelDetails';
    let procParams = {};
    let url = `http://localhost:3000/post_data`;

    let data = {
        'proc_name': procName,
        'proc_params': procParams,
    }

    let params = {
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
        },
        body: JSON.stringify(data),
        method: "POST",
    }
    let result = await fetch(url);
    fetch(url, params)
        .then(async res => { 
            let data = await res.text();
            console.log('res', data);
        })
        .catch(err => { console.log(err) });
}