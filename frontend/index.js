var files = []

getTransactionsByStore()

async function getTransactionsByStore() {
  const response = await fetch('http://localhost:3000/transactions/by_store');
  var data = await response.json();
  console.log(data);

  temp = ''

  Object.entries(data).forEach((store) => {
    temp += `<h2 class="store-title">${store[0]}</h2>`
    temp_data = ''
    store[1].transactions.forEach(transaction => {
      temp_data += ` 
      <tr class="${transaction.type_transaction.value ? 'line-green' : 'line-red'}">
      <td>${transaction.id}</td>
      <td>${transaction.type_transaction.description}</td>
      <td>${transaction.date}</td>
      <td>${transaction.cpf}</td>
      <td>${transaction.card}</td>
      <td>${transaction.hour}</td>
      <td>${transaction.store_manager}</td>
      <td>R$ ${transaction.value}</td>
    </tr>
    `
    })

    temp += `
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Tipo</th>
          <th>Data</th>
          <th>CPF</th>
          <th>CARTÃO</th>
          <th>HORA</th>
          <th>DONO DA LOJA</th>
          <th>Valor</th>
        </tr>
      </thead>
      <tbody id="data"> 
      ${temp_data}
      </tbody>
    </table>`

    temp += `<h2 class="${store[1].total >= 0 ? 'line-green' : 'line-red'} total">R$ ${store[1].total}</h2>`
  });
  document.getElementById('container-table').innerHTML = temp;
}

const fileInput = document.querySelector("#fileInput");

const uploadFile = async file => {
  try {
    const formData = new FormData();
    formData.append('file', file)
    const response = await fetch('http://localhost:3000/transactions', {
      method: 'POST',
      body: formData
    });

    getTransactionsByStore()

    console.log(response);
  } catch (error) {
    console.error(error);
  }

};

fileInput.addEventListener("change", event => {
  files = event.target.files;
});

const button = document.querySelector("#create-transactions");

button.addEventListener('click', updateButton);

function updateButton() {
  uploadFile(files[0]);
}
