# Algebra Relacional

## Instruções para iniciar um game

### Buscar dados do personagem

``` π P.nome, PJ.sanidade, PJ.fome, PC.idItem, PC.quantidade (
    σ PJ.id = carregaIdPersonagemJogavel (
        Personagem ⨝_{P.id = PJ.idPersonagem} PersonagemJogavel PJ
        ⨝_{PJ.id = PC.idPersonagemJogavel} Inventario PC
    )
)
 ```

### Busca todos os usuários

```
π u.nomeUsuario, u.nome (Usuario u)
```

### Busca informações de associação de Personagem Usuário

```
π pu.id, pu.nomeUsuario, pu.idPersonagemJogavel (PersonagemUsuario pu)
```

### Busca informações de Diálogos
```
π d.id, d.textoFala, d.dialogoVinculo (Dialogo d)
```

### Busca informações de Instâncias de Personagens Jogáveis
```
π ipc.id, ipc.idPersonagemJogavel, ipc.vidaAtual, ipc.fomeAtual, ipc.sanidadeAtual, ipc.modoFantasma, ipc.x, ipc.y, ipc.z (InstanciaPC ipc)
σ ipc.id = carregaId (InstanciaPC ipc)
```

### Busca informações de Instâncias de NPCs
```
π inpc.id, inpc.idNpc, inpc.vidaAtual, inpc.x, inpc.y, inpc.z, npc.tiponpc, npc.eboss (
    InstanciaNpc inpc ⨝_{npc.id = inpc.id} npc
)
σ npc.id = carregaIdNPC (
    InstanciaNpc inpc ⨝_{npc.id = inpc.id} npc
)
```
### Busca informações de Alianças
```
π a.id, a.idInstanciaPc, a.idInstanciaNpc (Alianca a)
```
### Busca informações do Inventário
```
π i.id, i.idPersonagemJogavel, i.idItem, i.quantidade (Inventario i)
```

### Busca informações do Mundo
```
π m.id, m.idUsuario, m.tipo, u.nome, tm.nome, m.nome, m.estacao, m.temEstrada (
    Mundo m ⨝_{m.idUsuario = u.nomeUsuario} Usuario u
    ⨝_{m.tipo = tm.id} TipoMundo tm
)
σ m.id = carregaIdMundo (
    Mundo m ⨝_{m.idUsuario = u.nomeUsuario} Usuario u
    ⨝_{m.tipo = tm.id} TipoMundo tm
)
```
### Busca informações do Tipo de Mundo
```
π tm.id, tm.nome, tm.x, tm.y, tm.z (TipoMundo tm)
σ tm.id = carregaIdTipoMundo (TipoMundo tm)
```
### Busca informações da Receita
```
π r.itemReceita, r.item1, r.item2, r.item3, r.quantidade1, r.quantidade2, r.quantidade3 (Receita r)
```
### Busca informações dos Consumíveis
```
π c.id, c.idItem, c.vida, c.sanidade, c.fome, c.tempoApodrecimento (Consumivel c)
```

### Busca informações dos Equipamentos
```
π e.id, e.idItem, e.parteCorpo, e.durabilidade, e.protecao, i.nome (
    Equipamento e ⨝_{e.idItem = i.id} Item i
)
```
### Busca informações dos Colocáveis
```
π cl.id, cl.idItem, cl.tamanho, cl.temColisao, cl.durabilidade, cl.eEstacaoCraft, i.nome (
    Colocavel cl ⨝_{cl.idItem = i.id} Item i
)
```

### Busca informações das Instâncias dos Colocáveis
```
π ic.id, ic.idColocavel, ic.idMundo, ic.x, ic.y, ic.z, ic.durabilidadeAtual, cl.tamanho (
    InstanciaColocavel ic ⨝_{ic.idColocavel = cl.id} Colocavel cl
)
```
### Busca informações das Habilidades
```
π h.id, h.idHabPreReq, h.idItemGerado, h.nome, h.descricao, h.eOfensiva, h.dano, h.casting, i.nome (
    Habilidade h ⨝_{h.idItemGerado = i.id} Item i
)
```
## Instruções para um save game

### Atualizar os dados da instância do personagem jogável
```
InstanciaPC ← InstanciaPC - σ id = idInstanciaPC (InstanciaPC)
InstanciaPC ← InstanciaPC ∪ {idInstanciaPC, novaVidaAtual, novaFomeAtual, novaSanidadeAtual, novoModoFantasma, novaCoordenadaX, novaCoordenadaY, novaCoordenadaZ}
```

### Atualizar Instância do NPC
```
InstanciaNpc ← InstanciaNpc - σ id = idInstanciaNpc (InstanciaNpc)
InstanciaNpc ← InstanciaNpc ∪ { (idInstanciaNpc, novaVidaAtua, novaCoordenadaX, novaCoordenadaY, novaCoordenadaZl) }
```

### Atualizar Inventário
```
Inventario ← Inventario - σ idItem = idItem AND idPersonagemJogavel = idPersonagemJogavel (Inventario)
Inventario ← Inventario ∪ { (idItem, idPersonagemJogavel, novaQuantidade) }
```

### Atualizar Mundo
```
Mundo ← Mundo - σ id = idMundo (Mundo)
Mundo ← Mundo ∪ { (idMundo, novaEstacao) }
```

### Atualiza a Instância do Colocável
```
InstanciaColocavel ← InstanciaColocavel - σ id = idInstanciaColocavel (InstanciaColocavel)
InstanciaColocavel ← InstanciaColocavel ∪ { (idInstanciaColocavel, novaCoordenadaX, novaCoordenadaY, novaCoordenadaZ, novaDurabilidadeAtual) }
```

## Histórico de Versão

| Verção    | Data | Descrição | Autor |
| -------- | ------- | -------| -------|
| 1.0 | 30/10/2023   | Criação do Documento | [Andre Goretti](https://github.com/AGoretti) |
| 1.1 | 30/10/2023   | Update |[Andre Goretti](https://github.com/AGoretti) |
