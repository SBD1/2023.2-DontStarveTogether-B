import chalk from 'chalk';
import { buscarInstancia } from './instanciaPc/instanciaPc.js';
import { buscarBiomaMundo } from './bioma/bioma.js';
import { pressioneEnter } from './utils/console.js';
import { buscarInstanciasNpc } from './instanciaNpc/instanciaNpc.js';
import { buscarInstanciaItens } from './instanciaItem/instanciaItem.js';
import { exibirMenu } from './menu.js';
import { carregarDados, salvarDados } from './dadosSessao.js';
import { buscarEquipamentosPersonagem } from './equipamento/equipamento.js';
import { buscarInventario } from './inventario/inventario.js';

async function game(nomeUsuario, idPersonagemJogavel) {
  while(true) {
    await buscarDadosBiomaAtual(nomeUsuario, idPersonagemJogavel);
    await imprimeStatus();
    await imprimeEquipamento();
    await imprimeInventario();
    await imprimeLocalizacao();
    await pressioneEnter('Pressione Enter para continuar');

    const opcao = await exibirMenu();
    if(opcao === 'salvarSair') {

      break;
    }
  }
}

async function buscarDadosBiomaAtual(nomeUsuario, idPersonagemJogavel) {
  const instanciaPc = await buscarInstancia(nomeUsuario, idPersonagemJogavel);
  const biomaMundo = await buscarBiomaMundo(instanciaPc.idmundo, instanciaPc.idbioma);
  const instanciasNpc = await buscarInstanciasNpc(instanciaPc.idmundo, instanciaPc.idbioma);
  const instanciasItens = await buscarInstanciaItens(instanciaPc.idmundo, instanciaPc.idbioma);
  const equipamentos = await buscarEquipamentosPersonagem(nomeUsuario, idPersonagemJogavel);
  const inventario = await buscarInventario(nomeUsuario, idPersonagemJogavel);

  const dadosBiomaAtual = {
    instanciaPc,
    biomaMundo,
    instanciasNpc,
    instanciasItens,
    equipamentos,
    inventario
  }

  salvarDados(dadosBiomaAtual);
}

async function imprimeStatus() {
  const dadosBiomaAtual = carregarDados();
  const instanciaPc = dadosBiomaAtual.instanciaPc;
  const equipamentos = dadosBiomaAtual.equipamentos;
  const inventario = dadosBiomaAtual.inventario;

  console.log(chalk.white('Personagem: ', instanciaPc.nome));
  if(instanciaPc.vidaatual >= 150) {
    console.log(chalk.green('HP: ', instanciaPc.vidaatual, ' / ', instanciaPc.vida));
  } else if (instanciaPc.vidaatual <= 149 && instanciaPc.vidaatual >= 100) {
    console.log(chalk.yellow('HP: ', instanciaPc.vidaatual, ' / ', instanciaPc.vida));
  } else {
    console.log(chalk.red('HP: ', instanciaPc.vidaatual, ' / ', instanciaPc.vida));
  }
  console.log(chalk.yellow('Fome: ', instanciaPc.fomeatual, ' / ', instanciaPc.fome));
  console.log(chalk.blueBright('Sanidade: ', instanciaPc.sanidadeatual, ' / ', instanciaPc.sanidade, '\n'));
}

async function imprimeEquipamento() {
  const dadosBiomaAtual = carregarDados();
  const equipamentos = dadosBiomaAtual.equipamentos;

  console.log(chalk.white('Equipamentos:'));
  equipamentos.forEach((equipamento) => {
    console.log(chalk.yellow('  • ', equipamento.nome, ' - ', equipamento.descricao, ' (Durabilidade: ', equipamento.durabilidadeatual, ')'));
  });
}

async function imprimeInventario() {
  const dadosBiomaAtual = carregarDados();
  const inventario = dadosBiomaAtual.inventario;

  console.log(chalk.white('Inventario:'));
  inventario.forEach((item) => {
    console.log(chalk.yellow('  • ', item.nome, `(x${item.quantidade})`, ' - ', item.descricao));
  });
}

async function imprimeLocalizacao() {
  const dadosBiomaAtual = carregarDados();
  const biomaMundo = dadosBiomaAtual.biomaMundo;
  const instanciasNpc = dadosBiomaAtual.instanciasNpc;
  const instanciaPc = dadosBiomaAtual.instanciaPc;
  const instanciasItens = dadosBiomaAtual.instanciasItens;

  console.log(chalk.blue('\n', biomaMundo.nomemundo, "  -  ", biomaMundo.nomeestacao, "  -  ", "Dia: ", biomaMundo.diaatual));
  console.log(chalk.blue('Você está em um(a) ' + biomaMundo.nomebioma, ', ' + biomaMundo.descricao));

  console.log(chalk.white('\nNeste(a) ', biomaMundo.nomebioma, ' possui:'));
  console.log('NPCs:');
  
  instanciasNpc.forEach((instanciaNpc) => {
    if(instanciaNpc.tipoNpc === 'H') {
      console.log(chalk.red("  • ", instanciaNpc.nomepersonagem, ' - ', instanciaNpc.descricaopersonagem));
    } else {
      console.log(chalk.green("  • ", instanciaNpc.nomepersonagem, ' - ', instanciaNpc.descricaopersonagem));
    }
  });

  console.log('Itens:');
  instanciasItens.forEach((instanciaItem) => {
    console.log(chalk.green("  • ", instanciaItem.nome, `(x${instanciaItem.quantidade})`, ' - ', instanciaItem.descricao));
  });
}

export default game;
