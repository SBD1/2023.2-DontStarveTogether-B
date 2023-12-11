import { carregarDados } from "../dadosSessao.js";
import inquirer from "inquirer";
import{ atacar } from "../acoes.js";

export async function menuAtaque() {
  console.clear();
  const instanciasNpc = carregarDados().instanciasNpc;

  const escolhaAtaque = await inquirer.prompt([
    {
      type: 'list',
      name: 'npcEscolhido',
      message: 'Escolha um NPC para atacar:',
      choices: [
        instanciasNpc.map((npc, index) => ({
          name: `${index + 1}. ${npc.nomepersonagem} ${npc.vidaatual} HP`,
          value: npc,
        })),
        { name: 'Cancelar', value: 'cancelar' },
      ]
    },
  ]);

  const npcEscolhido = escolhaAtaque.npcEscolhido;
  if (npcEscolhido === 'cancelar') {
    return npcEscolhido;
  }

  const dano = await atacar(npcEscolhido.idinstancianpc);
  return dano;
}
