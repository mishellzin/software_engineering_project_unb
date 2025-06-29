USE `hubgourmet`;

-- Inserindo dados na tabela `Usuário`
INSERT INTO `Usuário` (`id_usuário`, `nome`) VALUES
(1, 'João Silva'),
(2, 'Maria Souza'),
(3, 'Pedro Lima'),
(4, 'Ana Costa'),
(5, 'Carlos Santos'),
(6, 'Mariana Oliveira'),
(7, 'Fernando Pereira'),
(8, 'Beatriz Almeida'),
(9, 'Roberto Gomes'),
(10, 'Patrícia Rocha');

-- Inserindo dados na tabela `Expositor`
INSERT INTO `Expositor` (`Usuário_id_usuário`, `descricao`, `contato`) VALUES
(1, 'Expositor de doces artesanais', 'docearte@email.com'),
(2, 'Expositor de comidas típicas', 'saboresdobrasil@email.com'),
(3, 'Expositor de bebidas especiais', 'bebidasfinas@email.com');

-- Inserindo dados na tabela `Organizador`
INSERT INTO `Organizador` (`Usuário_id_usuário`) VALUES
(4),
(5);

-- Inserindo dados na tabela `Colaborador`
INSERT INTO `Colaborador` (`Usuário_id_usuário`) VALUES
(6);

-- Inserindo dados na tabela `Fiscalizador`
INSERT INTO `Fiscalizador` (`Usuário_id_usuário`) VALUES
(7);

-- Inserindo dados na tabela `Parceiro`
INSERT INTO `Parceiro` (`Usuário_id_usuário`) VALUES
(8);

-- Inserindo dados na tabela `Produto`
INSERT INTO `Produto` (`Expositor_Usuário_id_usuário`, `nome`, `preco`, `descricao`) VALUES
(1, 'Brigadeiro Gourmet', 3.50, 'Brigadeiro feito com chocolate belga.'),
(1, 'Beijinho de Coco', 2.80, 'Doce tradicional de coco.'),
(2, 'Acarajé', 15.00, 'Acarajé baiano com camarão e vatapá.'),
(2, 'Moqueca Capixaba', 45.00, 'Prato típico capixaba com peixe e frutos do mar.'),
(3, 'Cerveja Artesanal IPA', 25.00, 'Cerveja de lúpulo intenso.'),
(3, 'Vinho Tinto Chileno', 80.00, 'Vinho Cabernet Sauvignon reserva.');

-- Inserindo dados na tabela `Unidade_federacao`
INSERT INTO `Unidade_federacao` (`sigla`, `nome`) VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais'),
('DF', 'Distrito Federal');

-- Inserindo dados na tabela `Cidade`
INSERT INTO `Cidade` (`municipio`, `Unidade_federacao_sigla`) VALUES
('São Paulo', 'SP'),
('Campinas', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Brasília', 'DF');

-- Inserindo dados na tabela `Local`
INSERT INTO `Local` (`id_local`, `nome`, `endereco`, `referencia`, `Cidade_nome_cidade`, `Cidade_Unidade_federacao_sigla`) VALUES
(101, 'Centro de Convenções Norte', 'Av. Exemplo, 123', 'Próximo ao metrô', 'São Paulo', 'SP'),
(102, 'Parque da Cidade', 'Rua das Flores, 45', 'Ao lado do lago', 'Brasília', 'DF'),
(103, 'Pavilhão de Eventos', 'Av. Principal, 789', 'Perto do shopping', 'Rio de Janeiro', 'RJ');

-- Inserindo dados na tabela `Feira`
INSERT INTO `Feira` (`Organizador_Usuário_id_usuário`, `nome`, `descricao`, `data_inicio`, `data_termino`, `Local_id_local`, `Local_Cidade_nome_cidade`, `Local_Cidade_Unidade_federacao_sigla`) VALUES
(4, 'Feira Gourmet SP 2025', 'Maior feira de gastronomia de São Paulo.', '2025-08-10', '2025-08-15', 101, 'São Paulo', 'SP'),
(5, 'Festival de Sabores DF', 'Festival de comidas e bebidas do Distrito Federal.', '2025-09-01', '2025-09-07', 102, 'Brasília', 'DF');

-- Inserindo dados na tabela `Visitante`
INSERT INTO `Visitante` (`Usuário_id_usuário`) VALUES
(9),
(10);

-- Inserindo dados na tabela `Ingresso`
INSERT INTO `Ingresso` (`Visitante_Usuário_id_usuário`, `Feira_Organizador_Usuário_id_usuário`, `Feira_nome`, `numero`, `data`) VALUES
(9, 4, 'Feira Gourmet SP 2025', 1001, '2025-08-10'),
(9, 4, 'Feira Gourmet SP 2025', 1002, '2025-08-11'),
(10, 5, 'Festival de Sabores DF', 2001, '2025-09-02');

-- Inserindo dados na tabela `Lista_produto`
INSERT INTO `Lista_produto` (`Expositor_Usuário_id_usuário`, `id`, `apelido`) VALUES
(1, 1, 'Doces Favoritos'),
(2, 1, 'Pratos Regionais');

-- Inserindo dados na tabela `Lista_produto_has_Produto`
INSERT INTO `Lista_produto_has_Produto` (`Lista_produto_Expositor_Usuário_id_usuário`, `Produto_Expositor_Usuário_id_usuário`, `Produto_nome`) VALUES
(1, 1, 'Brigadeiro Gourmet'),
(1, 1, 'Beijinho de Coco'),
(2, 2, 'Acarajé'),
(2, 2, 'Moqueca Capixaba');

-- Inserindo dados na tabela `Feira_has_Lista_produto`
INSERT INTO `Feira_has_Lista_produto` (`Feira_Organizador_Usuário_id_usuário`, `Feira_nome`, `Lista_produto_Expositor_Usuário_id_usuário`) VALUES
(4, 'Feira Gourmet SP 2025', 1),
(5, 'Festival de Sabores DF', 2);

-- Inserindo dados na tabela `Administrador`
INSERT INTO `Administrador` (`Usuário_id_usuário`) VALUES
(1); -- Supondo que o João Silva também seja um administrador