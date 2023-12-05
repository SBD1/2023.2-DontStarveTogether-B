import chalk from 'chalk';
import inquirer from 'inquirer';
import readline from 'readline';
import { loginUser } from './usuario/user.js';
import { getWorldsByUser } from './mundo/mundo.js';
import { getCharacterNamesByUser } from './personagem/personagem.js';

export const startGame = async () => {
  console.log(chalk.green(' ---- Mini game Dont Starve Together CLI! ----'));

  const username = await loginUser();

  try {
    const worlds = await getWorldsByUser(username.nomeusuario);
    let chosenWorld;
    if (worlds.length === 0) {
      console.log(chalk.yellow('Você não possui mundos.'));
    } else {
      console.log(chalk.yellow(`Selecione um mundo:`));
      worlds.forEach((world) => {
        console.log(`- Mundo ${world.nome}, Estação: ${world.estacao}, Dia Atual: ${world.diaatual}`);
      });

      chosenWorld = await chooseWorld(worlds);
    }

    const characters = await getCharacterNamesByUser(username.nomeusuario);

    if (characters.length === 0) {
      console.log(chalk.yellow('Você não possui personagens.'));
    } else {
      console.log(chalk.yellow('Personagens:'));
      characters.forEach((character) => {
        console.log(`- Personagem ${character.nome}`);
      });
    }
      const chosenCharacter = await chooseCharacter(characters);
      console.log(chalk.green(`\nVocê escolheu o mundo: ${chosenWorld.nome}`));
      console.log(chalk.green(`Você escolheu o personagem: ${chosenCharacter.nome}`));
      await pressEnterToStart();

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

async function chooseCharacter(characters) {
  const characterChoices = characters.map((character) => ({
    name: character.nome,
    value: character,
  }));

  const answer = await inquirer.prompt([
    {
      type: 'list',
      name: 'chosenCharacter',
      message: 'Escolha um personagem:',
      choices: characterChoices,
    },
  ]);

  return answer.chosenCharacter;
}

async function pressEnterToStart() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise((resolve) => {
    rl.question(chalk.yellow('\nPressione Enter para iniciar o jogo.'), () => {
      rl.close();
      resolve();
    });
  });
}

export default startGame;
