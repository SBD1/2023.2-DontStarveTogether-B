import chalk from 'chalk';
import { loginUser } from './usuario/user.js';

export const startGame = async () => {
  console.log(chalk.green('Bem-vindo ao Dont Starve Together CLI!'));

  await loginUser();

  console.log(chalk.yellow('O jogo foi encerrado'));
};

export default startGame;
