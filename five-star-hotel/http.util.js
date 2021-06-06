
async function getData(procName, procParams) {
    return new Promise((resolve, reject) => {
        let baseUrl = 'http://localhost:3000/get_data';
        let url = `${baseUrl}?proc_name=${procName}&proc_params=${JSON.stringify(procParams)}`;
        fetch(url)
            .then(async res => {
                let data = await res.json();
                // console.log('res', data);
                resolve(data);
            })
            .catch(err => {
                console.log(err);
                return [];
            });
    });
}

async function postData(procName, procParams) {
    return new Promise((resolve, reject) => {
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
        };
    
        fetch(url, params)
            .then(async res => {
                let data = await res.json();
                resolve(data);
            })
            .catch(err => {
                console.log(err);
                return [];
            });
    });
}