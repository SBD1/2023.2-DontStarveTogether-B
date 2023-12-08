import chalk from 'chalk';
import inquirer from 'inquirer';
import { loginUser } from './usuario/usuario.js';
import { buscaMundosUsuario } from './mundo/mundo.js';
import { buscaPersonagensUsuario } from './personagem/personagem.js';
import { pressioneEnter } from './utils/pressioneEnter.js';
import { geraArteAsciiGhost } from './utils/arteAscii.js';

export const startGame = async () => {
  const dontStarveCli = geraArteAsciiGhost("Don't Starve CLI");
  console.log(chalk.blue.bold(dontStarveCli));

  const username = await loginUser();

  try {
    const worlds = await buscaMundosUsuario(username.nomeusuario);
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

    const characters = await buscaPersonagensUsuario(username.nomeusuario);

    if (characters.length === 0) {
      console.log(chalk.yellow('Você não possui personagens.'));
    } else {
      console.log(chalk.yellow('Personagens:'));
      characters.forEach((character) => {
        console.log(`- Personagem ${character.nome}`);
      });
    }
      const chosenCharacter = await escolhePersonagem(characters);
      console.log(chalk.green(`\nVocê escolheu o mundo: ${chosenWorld.nome}`));
      console.log(chalk.green(`Você escolheu o personagem: ${chosenCharacter.nome}`));
      await pressioneEnter('Pressione Enter para iniciar o jogo');

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

async function escolhePersonagem(characters) {
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

export default startGame;
