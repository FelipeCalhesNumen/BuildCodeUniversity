// Lê argumentos da linha de comando
const args = process.argv.slice(2);

if (args.length !== 3) {
  console.error("Uso: node calculadora.js <num1> <num2> <operação>");
  console.error("Exemplo: node calculadora.js 1 1 '+'");
  process.exit(1);
}

const [num1Str, num2Str, op] = args;
const num1 = parseFloat(num1Str);
const num2 = parseFloat(num2Str);

// Validação básica
if (isNaN(num1) || isNaN(num2)) {
  console.error("Erro: num1 e num2 devem ser números.");
  process.exit(1);
}

let resultado;

switch (op) {
  case '+':
    resultado = num1 + num2;
    break;
  case '-':
    resultado = num1 - num2;
    break;
  case '*':
    resultado = num1 * num2;
    break;
  case '/':
    if (num2 === 0) {
      console.error("Erro: divisão por zero.");
      process.exit(1);
    }
    resultado = num1 / num2;
    break;
  default:
    console.error("Operação inválida. Use '+', '-', '*', ou '/'.");
    process.exit(1);
}

console.log(resultado);
