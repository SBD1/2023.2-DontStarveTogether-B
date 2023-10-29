-- Criacao: 29/10/2023
-- Autores: Yago Amin
-- Descrição: Criação dos SELECTS e UPDATES para o funcionamento do jogo (DQL)

-- Instruções SQL ao iniciar um game
BEGIN;

    -- Busca os dados do personagem para carregar o jogo
    SELECT
        P.nome AS nomePersonagem,
        PJ.sanidade AS sanidadePersonagem,
        PJ.fome AS fomePersonagem,
        Inv.idItem AS idItemInventario,
        Inv.quantidade AS quantidadeItemInventario
    FROM Personagem AS P
    INNER JOIN PersonagemJogavel AS PJ ON P.id = PJ.idPersonagem
    LEFT JOIN Inventario AS Inv ON PJ.id = PC.idPersonagemJogavel -- tabela não existe ainda
    WHERE P.id = 2;

    -- Busca todos os usuários
    SELECT
        u.nomeUsuario AS "Nome de Usuário",
        u.nome AS "Nome"
    FROM Usuario u; -- ver se pega só o que tá no mundo

    -- Busca informações de associação de personagem a usuário
    SELECT
        pu.id AS "ID",
        pu.nomeUsuario AS "Nome de Usuário",
        pu.idPersonagemJogavel AS "ID do Personagem Jogável"
    FROM PersonagemUsuario pu;

    -- Busca informações de diálogos
    SELECT
        d.id AS "ID",
        d.textoFala AS "Texto da Fala",
        d.dialogoVinculo AS "ID do Diálogo Vinculado"
    FROM Dialogo d;

    -- Busca informações de instâncias de personagens jogáveis
    SELECT
        ipc.id AS "ID",
        ipc.idPersonagemJogavel AS "ID do Personagem Jogável",
        ipc.vidaAtual AS "Vida Atual",
        ipc.fomeAtual AS "Fome Atual",
        ipc.sanidadeAtual AS "Sanidade Atual",
        ipc.modoFantasma AS "Modo Fantasma",
        ipc.x AS "Coordenada X",
        ipc.y AS "Coordenada Y",
        ipc.z AS "Coordenada Z"
    FROM InstanciaPC ipc;

    -- Busca informações de instâncias de NPCs
    SELECT
        inpc.id AS "ID",
        inpc.idNpc AS "ID do NPC",
        inpc.vidaAtual AS "Vida Atual",
        inpc.x AS "Coordenada X",
        inpc.y AS "Coordenada Y",
        inpc.z AS "Coordenada Z",
		npc.tiponpc AS "Tipo NPC",
		npc.eboss AS "Boss"
    FROM InstanciaNpc inpc
	    JOIN npc
	     ON npc.id = inpc.id;

    -- Busca informações de alianças entre personagens
    SELECT
        a.id AS "ID",
        a.idInstanciaPc AS "ID da Instância do PC",
        a.idInstanciaNpc AS "ID da Instância do NPC"
    FROM Alianca a;

    -- Busca informações sobre o inventário de personagens
    SELECT
        i.id AS "ID",
        i.idPersonagemJogavel AS "ID do Personagem Jogável",
        i.idItem AS "ID do Item",
        i.quantidade AS "Quantidade"
    FROM Inventario i; -- tabela não existe ainda

    -- Busca informações do mundo
        -- tabela não existe ainda

    -- Busca informações do tipoMundo
         -- tabela não existe ainda
        
    -- Busca informações da receita
         -- tabela não existe ainda

    -- Busca informações dos consumíveis
         -- tabela não existe ainda

    -- Busca informações dos equipamentos
         -- tabela não existe ainda

    -- Busca informações dos colocáveis
         -- tabela não existe ainda

    -- Busca informações das isntâncias dos colocáveis
         -- tabela não existe ainda
    
    -- Busca informações das habilidades
         -- tabela não existe ainda
    
    -- Busca informações dos itens
         -- tabela não existe ainda
    
COMMIT;


-- Instruções SQL quando game save (auto ou manual)
-- Obs: "":nova%" será atribuído na lógica do código
BEGIN;

    -- Atualizar os dados da instância do personagem jogável
    UPDATE InstanciaPC
    SET vidaAtual = :novaVidaAtual, fomeAtual = :novaFomeAtual, sanidadeAtual = :novaSanidadeAtual,
        modoFantasma = :novoModoFantasma, x = :novaCoordenadaX, y = :novaCoordenadaY, z = :novaCoordenadaZ
    WHERE id = :idInstanciaPC;

    -- Atualizar os dados da instância do NPC
    UPDATE InstanciaNpc
    SET vidaAtual = :novaVidaAtual
    WHERE id = :idInstanciaNpc;

    -- Atualizar os itens do inventário
    UPDATE Inventario -- tabela não existe ainda
    SET quantidade = :novaQuantidade
    WHERE idItem = :idItem AND idPersonagemJogavel = :idPersonagemJogavel;

    -- Atualizar os equipamentos dos personagens

    -- Atualizar as instâncias dos colocáveis do personagem no save game

COMMIT;