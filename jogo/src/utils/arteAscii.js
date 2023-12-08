import figlet from 'figlet';

export function geraArteAsciiGhost(text) {
  return figlet.textSync(text, {
    font: 'Ghost',
    horizontalLayout: 'default',
    verticalLayout: 'default',
  });
}

export function geraArteAscii(text) {
  return figlet.textSync(text, {
    font: 'Standard',
    horizontalLayout: 'default',
    verticalLayout: 'default',
  });
}
