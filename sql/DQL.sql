-- Criacao: 29/10/2023
-- Autores: Yago Amin
-- Descrição: Criação dos SELECTS e UPDATES para o funcionamento do jogo (DQL)

-- Instruções SQL ao iniciar um game
-- Obs: Propriedade ":carrega%" será atribuído na lógica do código
BEGIN;

    -- Busca os dados do Personagem
    SELECT
        p.nome AS nomePersonagem,
        pj.sanidade AS sanidadePersonagem,
        pj.fome AS fomePersonagem,
        inv.idItem AS idItemInventario,
        inv.quantidade AS quantidadeItemInventario
    FROM Personagem AS P
    INNER JOIN PersonagemJogavel AS pj ON p.id = pj.idPersonagem
    LEFT JOIN Inventario AS inv ON pj.id = pc.idPersonagemJogavel
    WHERE pj.id = :carregaIdPersonagemJogavel;

    -- Busca todos os usuários
    SELECT
        u.nomeUsuario AS "Nome de Usuário",
        u.nome AS Nome
    FROM Usuario u;

    -- Busca informações de associação de Personagem Usuário
    SELECT
        pu.id AS ID,
        pu.nomeUsuario AS "Nome de Usuário",
        pu.idPersonagemJogavel AS "ID do Personagem Jogável"
    FROM PersonagemUsuario pu;

    -- Busca informações de Diálogos
    SELECT
        d.id AS ID,
        d.textoFala AS "Texto da Fala",
        d.dialogoVinculo AS "ID do Diálogo Vinculado"
    FROM Dialogo d;

    -- Busca informações de Instâncias de Personagens Jogáveis
    SELECT
        ipc.id AS ID,
        ipc.idPersonagemJogavel AS "ID do Personagem Jogável",
        ipc.vidaAtual AS "Vida Atual",
        ipc.fomeAtual AS "Fome Atual",
        ipc.sanidadeAtual AS "Sanidade Atual",
        ipc.modoFantasma AS "Modo Fantasma",
        ipc.x AS "Coordenada X",
        ipc.y AS "Coordenada Y",
        ipc.z AS "Coordenada Z"
    FROM InstanciaPC ipc
    WHERE ipc.id = :carregaId;

    -- Busca informações de Instâncias de NPCs
    SELECT
        inpc.id AS ID,
        inpc.idNpc AS "ID do NPC",
        inpc.vidaAtual AS "Vida Atual",
        inpc.x AS "Coordenada X",
        inpc.y AS "Coordenada Y",
        inpc.z AS "Coordenada Z",
		npc.tiponpc AS "Tipo NPC",
		npc.eboss AS Boss
    FROM InstanciaNpc inpc JOIN npc ON npc.id = inpc.id
    WHERE npc.id = :carregaIdNPC;

    -- Busca informações de Alianças
    SELECT
        a.id AS ID,
        a.idInstanciaPc AS "ID da Instância do PC",
        a.idInstanciaNpc AS "ID da Instância do NPC"
    FROM Alianca a;

    -- Busca informações do Inventário
    SELECT
        i.id AS ID,
        i.idPersonagemJogavel AS "ID do Personagem Jogável",
        i.idItem AS "ID do Item",
        i.quantidade AS "Quantidade"
    FROM Inventario i;

    -- Busca informações do Mundo
    SELECT
        m.id AS "ID do Mundo",
        m.idUsuario AS "ID do Usuário",
        m.tipo AS "ID do Tipo de Mundo",
        u.nome AS "Nome de Usuário",
        tm.nome AS "Nome do Tipo de Mundo",
        m.nome AS "Nome do Mundo",
        m.estacao AS Estação,
        m.temEstrada AS "Tem Estrada"
    FROM Mundo m
    INNER JOIN Usuario u ON m.idUsuario = u.nomeUsuario
    INNER JOIN TipoMundo tm ON m.tipo = tm.id
    WHERE m.id = :carregaIdMundo;

    -- Busca informações do Tipo de Mundo
    SELECT
        id AS ID,
        nome AS Nome,
        x AS "Coordenada X",
        y AS "Coordenada Y",
        z AS "Coordenada Z"
    FROM TipoMundo AS tm
    WHERE tm.id = :carregaIdTipoMundo;

    -- Busca informações da Receita
    SELECT
        r.itemReceita AS "ID do Item de Receita",
        r.item1 AS "ID do Item 1",
        r.item2 AS "ID do Item 2",
        r.item3 AS "ID do Item 3",
        r.quantidade1 AS "Quantidade do Item 1",
        r.quantidade2 AS "Quantidade do Item 2",
        r.quantidade3 AS "Quantidade do Item 3"
    FROM Receita r;

    -- Busca informações dos Consumíveis
    SELECT
        c.id AS "ID do Consumível",
        c.idItem AS "ID do Item",
        c.vida AS "Vida do Consumível",
        c.sanidade AS "Sanidade do Consumível",
        c.fome AS "Fome do Consumível",
        c.tempoApodrecimento AS "Tempo de Apodrecimento"
    FROM Consumivel c;

    -- Busca informações dos Equipamentos
    SELECT
        e.id AS "ID do Equipamento",
        e.idItem AS "ID do Item",
        e.parteCorpo AS "Parte do Corpo",
        e.durabilidade AS "Durabilidade do Equipamento",
        e.protecao AS "Proteção do Equipamento",
        i.nome AS "Nome do Item"
    FROM Equipamento e
    INNER JOIN Item i ON e.idItem = i.id;

    -- Busca informações dos Colocáveis
    SELECT
        cl.id AS "ID do Colocável",
        cl.idItem AS "ID do Item",
        cl.tamanho AS "Tamanho do Colocável",
        cl.temColisao AS "Tem Colisão",
        cl.durabilidade AS "Durabilidade do Colocável",
        cl.eEstacaoCraft AS "Estação de Craft do Colocável",
        i.nome AS "Nome do Item"
    FROM Colocavel cl
    INNER JOIN Item i ON cl.idItem = i.id;

    -- Busca informações das Instâncias dos Colocáveis
    SELECT
        ic.id AS "ID da Instância do Colocável",
        ic.idColocavel AS "ID do Colocável",
        ic.idMundo AS "ID do Mundo",
        ic.x AS "Coordenada X",
        ic.y AS "Coordenada Y",
        ic.z AS "Coordenada Z",
        ic.durabilidadeAtual AS "Durabilidade Atual",
        cl.tamanho AS "Tamanho do Colocável"
    FROM InstanciaColocavel ic
    INNER JOIN Colocavel cl ON ic.idColocavel = cl.id;

    -- Busca informações das Habilidades
    SELECT
        h.id AS "ID da Habilidade",
        h.idHabPreReq AS "ID da Habilidade Pré-Requisito",
        h.idItemGerado AS "ID do Item Gerado",
        h.nome AS "Nome da Habilidade",
        h.descricao AS "Descrição da Habilidade",
        h.eOfensiva AS "Habilidade Ofensiva",
        h.dano AS "Dano da Habilidade",
        h.casting AS "Tempo de Casting",
        i.nome AS "Nome do Item Gerado"
    FROM Habilidade h
    LEFT JOIN Item i ON h.idItemGerado = i.id;

COMMIT;

-- Instruções SQL quando game save (auto ou manual)
-- Obs: Propriedade ":nova%" será atribuído na lógica do código
BEGIN;

    -- Atualizar os dados da instância do personagem jogável
    UPDATE InstanciaPC
    SET
        vidaAtual = :novaVidaAtual,
        fomeAtual = :novaFomeAtual,
        sanidadeAtual = :novaSanidadeAtual,
        modoFantasma = :novoModoFantasma,
        x = :novaCoordenadaX,
        y = :novaCoordenadaY,
        z = :novaCoordenadaZ
    WHERE id = :idInstanciaPC;

    -- Atualizar Instância do NPC
    UPDATE InstanciaNpc
        SET vidaAtual = :novaVidaAtual
            x = :novaCoordenadaX,
            y = :novaCoordenadaY,
            z = :novaCoordenadaZ
    WHERE id = :idInstanciaNpc;

    -- Atualizar Inventário
    UPDATE Inventario
        SET quantidade = :novaQuantidade
    WHERE  
        idItem = :idItem AND 
        idPersonagemJogavel = :idPersonagemJogavel;

    -- Atualizar Mundo
    UPDATE Mundo
        SET
            estacao = :novaEstacao
    WHERE id = :idMundo;

-- Atualiza a Instância do Colocável
    UPDATE InstanciaColocavel
        SET
            x = :novaCoordenadaX,
            y = :novaCoordenadaY,
            z = :novaCoordenadaZ,
            durabilidadeAtual = :novaDurabilidadeAtual
    WHERE id = :idInstanciaColocavel;

COMMIT;