import fs from 'fs';

const pathArquivo = 'dadosSessao.json';

export function salvarDados(data) {
  const dadosJson = JSON.stringify(data, null, 2);
  fs.writeFileSync(pathArquivo, dadosJson);
}

export function carregarDados() {
  try {
    const dadosJson = fs.readFileSync(pathArquivo, 'utf8');
    return JSON.parse(dadosJson);
  } catch (error) {
    return {};
  }
}

export function apagarDados() {
  salvarDados({});
}
