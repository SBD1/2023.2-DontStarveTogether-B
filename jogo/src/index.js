import chalk from 'chalk';
import inquirer from 'inquirer';
import { loginUser } from './usuario/usuario.js';
import { buscarMundosUsuario } from './mundo/mundo.js';
import { buscarPersonagensUsuario } from './personagem/personagem.js';
import { limparTela, pressioneEnter } from './utils/console.js';
import { geraArteAsciiGhost } from './utils/arteAscii.js';
import game from './game.js';
import { apagarDados } from './dadosSessao.js';

export const menuPrincipal = async () => {
  const dontStarveCli = geraArteAsciiGhost("Don't Starve CLI");
  console.log(chalk.white(dontStarveCli));
  
  const larguraTerminal = process.stdout.columns;
  const lbrunofidelis = '@lbrunofidelis';
  const padding = ' '.repeat(larguraTerminal - lbrunofidelis.length);
  console.log(chalk.gray(padding + lbrunofidelis));

  const username = await loginUser();

  try {
    const worlds = await buscarMundosUsuario(username.nomeusuario);
    let mundoSelecionado;
    if (worlds.length === 0) {
      console.log(chalk.yellow('Você não possui mundos.'));
    } else {
      console.log(chalk.yellow(`Selecione um mundo:`));
      worlds.forEach((world) => {
        console.log(`- Mundo ${world.nome}, Estação: ${world.estacao}, Dia Atual: ${world.diaatual}`);
      });

      mundoSelecionado = await chooseWorld(worlds);
    }

    const characters = await buscarPersonagensUsuario(username.nomeusuario);

    if (characters.length === 0) {
      console.log(chalk.yellow('Você não possui personagens.'));
    } else {
      console.log(chalk.yellow('Personagens:'));
      characters.forEach((character) => {
        console.log(`- Personagem ${character.nome}`);
      });
    }
      const personagemSelecionado = await escolhePersonagem(characters);
      console.log(chalk.green(`\nVocê escolheu o mundo: ${mundoSelecionado.nome}`));
      console.log(chalk.green(`Você escolheu o personagem: ${personagemSelecionado.nome}`));
      await pressioneEnter('Pressione Enter para iniciar o jogo');

      await limparTela();
      await game(personagemSelecionado.nomeusuario, personagemSelecionado.idpersonagemjogavel);
      // await game('teste', 3);
  } catch (error) {
    console.error('Erro:', error);
  }
  
  // apagarDados();
  console.log(chalk.yellow('~ bye'));
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

menuPrincipal();

