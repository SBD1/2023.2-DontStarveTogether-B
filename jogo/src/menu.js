import chalk from 'chalk';
import inquirer from 'inquirer';
import { menuAtaque } from './menus/menuAtaque.js';
import { carregarDados } from './dadosSessao.js';

export async function exibirMenu() {
  while (true) {
    let dadosSessao = await carregarDados();
    console.log(chalk.yellow('╔════════════════════════════╗'));
    console.log(chalk.yellow('║     Escolha uma opção      ║'));
    console.log(chalk.yellow('╚════════════════════════════╝\n'));

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
        await menuAtaque();
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

    //await new Promise(resolve => setTimeout(resolve, 1000));
  }
}
