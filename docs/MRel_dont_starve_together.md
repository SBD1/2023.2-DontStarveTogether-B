# Modelo Relacional (MRel)

### Versão 1
<div align="center">
  <img src="../assets/Modelo-Relacional.drawio.png" aly="Modelo relacional" style="width: 700px">
</div>

### Versão 2
<div align="center">
  <img src="../assets/Modelo-Relacionalv2.png" aly="Modelo relacional v2" style="width: 900px">
</div>

<p align="justify">
  A versão 2 contempla a abstração de diversas entidades nas seguintes tabelas: DialogoNpc, Dialogo, Usuario, PersonagemJogavel, Mundo, TipoMundo, EquipamentoPersonagem, Equipamento, Item, Consumivel, Colocavel, InstanciaColocavel, além de contemplar a normalização até a 3FN.
</p>

### Versão 2.1
<div align="center">
  <img src="../assets/Modelo-Relacionalv3.png" aly="Modelo relacional v3" style="width: 900px">
</div>

<p align="justify">
  A versão 2.1 contempla a criação da tabela de iventário, que é uma simples tabela com relacionamento n:n da Instância do PC com a tabela Item. Esta tabela possui chave composta, que são os ids de ambas tabelas. Também contempla os auto relacionamentos da tabela Item, que permite a criação de um item a partir de uma receita. Além disso, pequenas modificações nos tipos de outras tabelas, tal como o DECIMAL(6,6) das coordenadas das instâncias, que se transformaram em INTEGER.
</p>


# Histórico de Versão

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 02/10/2023 | Criação do Documento | [Levi Queiroz](https://github.com/LeviQ27) |
| 1.1 | 02/10/2023 | Adiciona Mrel | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) |
| 2.0 | 23/10/2023 | Cria versão 2 | [Luis Bruno](https://github.com/lbrunofidelis) |
| 2.1 | 28/10/2023 | Cria versão 2.1 | [Luis Bruno](https://github.com/lbrunofidelis) |
