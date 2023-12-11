import chalk from 'chalk';
import inquirer from 'inquirer';
import { menuAtaque } from './menus/menuAtaque.js';
import { carregarDados } from './dadosSessao.js';
import { atualizaDiaAtual } from './mundo/mundo.js';

export async function exibirMenu() {
  let tempo = 0;  // cada unidade em tempo equivale a 1/5 de 1 dia
  while (true) {
    let dadosSessao = await carregarDados();

    if(tempo === 5) {
      console.log(chalk.yellow('╔════════════════════════════╗'));
      console.log(chalk.yellow('║  Um novo dia se inicia   ☀ ║'));
      console.log(chalk.yellow('╚════════════════════════════╝\n'));
      
      await atualizaDiaAtual(dadosSessao.instanciaPc.idmundo);
      tempo = 0;
    } else {
      console.log(chalk.yellow('╔════════════════════════════╗'));
      console.log(chalk.yellow('║     Escolha uma ação       ║'));
      console.log(chalk.yellow('╚════════════════════════════╝\n'));
    }

    const menu = await inquirer.prompt([
      {
        type: 'list',
        name: 'opcao',
        message: 'Escolha uma opção:',
        choices: [
          { name: 'Atacar', value: 'atacar' },
          { name: 'Consumir Item', value: 'consumirItem' },
          { name: 'Pegar Item', value: 'pegarItem' },
          { name: 'Derrubar Item', value: 'derrubarItem' },
          { name: 'Craftar Item', value: 'craftarItem' },
          { name: 'Caminhar', value: 'caminhar' },
          { name: 'Salvar e Sair', value: 'salvarSair' },
        ],
      },
    ]);

    switch (menu.opcao) {
      case 'atacar':
        const dano = await menuAtaque();
        if(dano === 'cancelar') {
          return;
        }
        console.log(chalk.red("Você causou " + dano + " de dano!"));
        break;
      case 'consumirItem':

        break;
      case 'pegarItem':

        break;
      case 'derrubarItem':

        break;

      case 'craftarItem':

        break;
      case 'caminhar':

        break;
      case 'salvarSair':
        console.log(chalk.magenta('O jogo foi encerrado.\nSalvando e saindo...'));

        return 'salvarSair';
      default:
        console.log(chalk.red('Opção inválida'));
    }
    tempo ++;
    //await new Promise(resolve => setTimeout(resolve, 1000));
  }
}
