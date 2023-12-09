import inquirer from 'inquirer';
import db from '../db/db.js';

export const loginUser = async () => {
  const credentials = await inquirer.prompt([
    { type: 'nomeUsuario', name: 'nomeUsuario', message: 'Digite seu nome de usuário:' },
    { type: 'password', name: 'senha', message: 'Digite sua senha:' },
  ]);

  try {
    const user = await db.oneOrNone('SELECT * FROM Usuario WHERE nomeUsuario = $1 AND senha = $2', [  // Na evolução do trabalho a gente vai arrumar isso daqui - sei que tá feio      
      credentials.nomeUsuario,
      credentials.senha,
    ]);
  
    if (user) {
      console.log(`Bem-vindo, ${user.nome}!`);
      return user;
    } else {
      console.log('Credenciais inválidas. Tente novamente.');
      await loginUser();
    }
  } catch (e) {
    console.log(e);
  }
};
