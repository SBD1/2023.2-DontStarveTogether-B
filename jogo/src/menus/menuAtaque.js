import { carregarDados } from "../dadosSessao.js";
import inquirer from "inquirer";
import chalk from "chalk";

export async function menuAtaque() {
  console.clear();
  const instanciasNpc = carregarDados().instanciasNpc;

  const escolhaAtaque = await inquirer.prompt([
    {
      type: 'list',
      name: 'npcEscolhido',
      message: 'Escolha um NPC para atacar:',
      choices: instanciasNpc.map((npc, index) => ({
        name: `${index + 1}. ${npc.nomepersonagem} ${npc.vidaatual} HP`,
        value: npc,
      })),
    },
  ]);

  const npcEscolhido = escolhaAtaque.npcEscolhido;

  await atacar(npcEscolhido.idinstancianpc);
}
