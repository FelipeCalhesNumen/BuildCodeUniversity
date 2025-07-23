
// let server = http.createServer( (request, response) {  });
// server.listen(8080); // listens on port 8080 
const express = require('express');
const app = express();
const port = 8000;
app.use(express.json());

const calc = function (num1, num2, op) {
  let resultado = {
    valor: '',
    status: ''
  }
  const n1 = parseFloat(num1);
  const n2 = parseFloat(num2);

  if (isNaN(n1) || isNaN(n2)) {
    resultado.status = 400
    resultado.valor = "Erro: num1 e num2 devem ser números.";
    return resultado
  }

  switch (op) {
    case '+':
      resultado.valor = n1 + n2;
      break;
    case '-':
      resultado.valor = n1 - n2;
      break;
    case '*':
      resultado.valor = n1 * n2;
      break;
    case '/':
      if (n2 === 0) {
        resultado.status = 400
        resultado.valor = "Erro: divisão por zero.";
        return resultado;
      }
      resultado.valor = n1 / n2;
      break;
    default:
      resultado.status = 400
      resultado.valor = "Operação inválida. Use '+', '-', '*', ou '/'.";
      return resultado;
  }
  return resultado;
}

// Rota principal para cálculo
app.get('/calcular', (req, res) => {
  const { num1, num2, op } = req.query;

  const n1 = parseFloat(num1);
  const n2 = parseFloat(num2);

  if (isNaN(n1) || isNaN(n2)) {
    return res.status(400).send("Erro: num1 e num2 devem ser números.");
  }

  let resultado;

  switch (op) {
    case '+':
      resultado = n1 + n2;
      break;
    case '-':
      resultado = n1 - n2;
      break;
    case '*':
      resultado = n1 * n2;
      break;
    case '/':
      if (n2 === 0) {
        return res.status(400).send("Erro: divisão por zero.");
      }
      resultado = n1 / n2;
      break;
    default:
      return res.status(400).send("Operação inválida. Use '+', '-', '*', ou '/'.");
  }
  const ops = [encodeURI('+'),encodeURI('-'),encodeURI('*'),encodeURI('/')].join(' ')
  resultado = 'Operações possíveis: ' + ops + '\n\n' + resultado;
  res.send(`Resultado: ${resultado}`);
});

app.post('/calc', (req, res) => {
  const params = req.body;
  const result = calc(params.num1, params.num2, params.op)
  res.status(200).send(result)
})

// Inicia o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
