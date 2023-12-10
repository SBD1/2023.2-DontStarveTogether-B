import chalk from 'chalk';
import inquirer from 'inquirer';

export async function exibirMenu() {
  while (true) {
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
          { name: 'Pegar Item', value: 'pegarItem' },
          { name: 'Consumir Item', value: 'consumirItem' },
          { name: 'Caminhar', value: 'caminhar' },
          { name: 'Salvar e Sair', value: 'salvarSair' },
        ],
      },
    ]);

    switch (menu.opcao) {
      case 'atacar':
        
        break;
      case 'pegarItem':

        break;
      case 'consumirItem':

        break;
      case 'caminhar':

        break;
      case 'salvarSair':
        console.log(chalk.magenta('Salvando e saindo...'));

        return;
      default:
        console.log(chalk.red('Opção inválida'));
    }

    //await new Promise(resolve => setTimeout(resolve, 1000));
  }
}
