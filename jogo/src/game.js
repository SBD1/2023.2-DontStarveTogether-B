import chalk from 'chalk';
import inquirer from 'inquirer';
import { loginUser } from './usuario/user.js';
import { getWorldsByUser } from './mundo/mundo.js';

export const startGame = async () => {
  console.log(chalk.green('Bem-vindo ao Dont Starve Together CLI!'));

  const username = await loginUser();

  try {
    const worlds = await getWorldsByUser(username.nomeusuario);

    if (worlds.length === 0) {
      console.log(chalk.yellow('Você não possui mundos.'));
    } else {
      console.log(chalk.yellow(`Selecione um mundo:`));
      worlds.forEach((world) => {
        console.log(`- Mundo ${world.nome}, Estação: ${world.estacao}, Dia Atual: ${world.diaatual}`);
      });

      const chosenWorld = await chooseWorld(worlds);
      console.log(chalk.green(`Você escolheu o mundo: ${chosenWorld.nome}`));
    }
  } catch (error) {
    console.error('Erro ao buscar mundos:', error);
  }

  console.log(chalk.yellow('O jogo foi encerrado'));
};

async function chooseWorld(worlds) {
  const worldChoices = worlds.map((world) => ({
    name: world.nome,
    value: world,
  }));

  const answer = await inquirer.prompt([
    {
      type: 'list',
      name: 'chosenWorld',
      message: 'Escolha um mundo:',
      choices: worldChoices,
    },
  ]);

  return answer.chosenWorld;
}

// agora com o nome do usuario, o mundo escolhido vamos criar a logica de escolher o personagem e então chamaremos uma função de jogar, por exemplo xd

export default startGame;
