import readline from 'readline';
import chalk from 'chalk';

export async function pressioneEnter(mensagem) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise((resolve) => {
    rl.question(chalk.yellow(`\n-- ${mensagem} -- \n`), () => {
      rl.close();
      resolve();
    });
  });
}