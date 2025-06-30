USE `hubgourmet`;

-- Inserindo dados na tabela `Usuario`
INSERT INTO `Usuario` (`email`, `nome`, `senha`) VALUES
-- Expositores (Pessoas e Empresas de Gastronomia)
('joao.silva@email.com', 'João Silva', 'senha123'),
('maria.souza@email.com', 'Maria Souza', 'senha456'),
('doces.artesanais@empresa.com', 'Doçuras Caseiras Ltda', 'doce123'),
('sabores.do.mundo@empresa.com', 'Sabores do Mundo Cozinha', 'sabor456'),

-- Organizadores (Pessoas e Empresas de Eventos)
('pedro.lima@email.com', 'Pedro Lima', 'senha789'),
('eventos.master@empresa.com', 'Eventos Master Corp', 'eventosabc'),
('ana.costa@email.com', 'Ana Costa', 'senha010'),
('organiza.tudo@empresa.com', 'Organiza Tudo Soluções', 'organiza789'),

-- Colaboradores
('carlos.santos@email.com', 'Carlos Santos', 'colab123'),

-- Fiscalizadores
('fernanda.oliveira@email.com', 'Fernanda Oliveira', 'fiscal456'),

-- Parceiros
('bruno.gomes@email.com', 'Bruno Gomes', 'parceiro789'),

-- Visitantes
('larissa.almeida@email.com', 'Larissa Almeida', 'visitante01'),
('rafael.pereira@email.com', 'Rafael Pereira', 'visitante02'),

-- Administrador
('admin@hubgourmet.com', 'Admin HubGourmet', 'adminpass');

-- Inserindo dados na tabela `Expositor`
INSERT INTO `Expositor` (`Usuario_email`, `descricao`, `contato`) VALUES
('joao.silva@email.com', 'Chef especialista em culinária mediterrânea.', 'joao.chef@contato.com'),
('maria.souza@email.com', 'Confeiteira com foco em bolos decorados.', 'maria.bolos@contato.com'),
('doces.artesanais@empresa.com', 'Empresa de doces finos e sobremesas gourmets.', 'contato@docesartesanais.com'),
('sabores.do.mundo@empresa.com', 'Restaurante de culinária internacional com food truck.', 'contato@saboresdomundo.com');

-- Inserindo dados na tabela `Organizador`
INSERT INTO `Organizador` (`Usuario_email`) VALUES
('pedro.lima@email.com'),
('eventos.master@empresa.com'),
('ana.costa@email.com'),
('organiza.tudo@empresa.com');

-- Inserindo dados na tabela `Colaborador`
INSERT INTO `Colaborador` (`Usuario_email`) VALUES
('carlos.santos@email.com');

-- Inserindo dados na tabela `Fiscalizador`
INSERT INTO `Fiscalizador` (`Usuario_email`) VALUES
('fernanda.oliveira@email.com');

-- Inserindo dados na tabela `Parceiro`
INSERT INTO `Parceiro` (`Usuario_email`) VALUES
('bruno.gomes@email.com');

-- Inserindo dados na tabela `Produto`
INSERT INTO `Produto` (`nome`, `Expositor_Usuario_email`, `preco`, `descricao`) VALUES
-- Produtos de João Silva
('Paella Valenciana', 'joao.silva@email.com', 75.00, 'Arroz com frutos do mar, frango e açafrão.'),
('Salmão Grelhado com Legumes', 'joao.silva@email.com', 60.00, 'Salmão fresco com mix de legumes assados.'),
('Tapas Variadas', 'joao.silva@email.com', 35.00, 'Seleção de petiscos espanhóis.'),
('Risoto de Funghi Secchi', 'joao.silva@email.com', 50.00, 'Risoto cremoso com cogumelos secos.'),
('Mousse de Chocolate Belga', 'joao.silva@email.com', 20.00, 'Sobremesa clássica de chocolate.'),

-- Produtos de Maria Souza
('Bolo de Aniversário Red Velvet', 'maria.souza@email.com', 180.00, 'Bolo aveludado com cream cheese frosting.'),
('Cupcakes Decorados', 'maria.souza@email.com', 15.00, 'Cupcakes com temas variados.'),
('Docinhos Gourmet Caixa', 'maria.souza@email.com', 45.00, 'Caixa com 20 docinhos artesanais.'),
('Torta Holandesa Fatia', 'maria.souza@email.com', 25.00, 'Fatia de torta com biscoito e ganache.'),

-- Produtos da Doçuras Caseiras Ltda
('Brigadeiro Gourmet Sortido', 'doces.artesanais@empresa.com', 4.00, 'Brigadeiros com diversos sabores e coberturas.'),
('Macarons Franceses (unidade)', 'doces.artesanais@empresa.com', 8.00, 'Doces delicados com recheios variados.'),
('Cheesecake de Frutas Vermelhas', 'doces.artesanais@empresa.com', 30.00, 'Fatia de cheesecake cremoso.'),
('Pudim de Leite Condensado', 'doces.artesanais@empresa.com', 22.00, 'Pudim tradicional com calda de caramelo.'),
('Biscoitos Amanteigados', 'doces.artesanais@empresa.com', 18.00, 'Pacote de biscoitos feitos artesanalmente.'),

-- Produtos da Sabores do Mundo Cozinha
('Pad Thai de Frango', 'sabores.do.mundo@empresa.com', 40.00, 'Macarrão de arroz tailandês com frango e amendoim.'),
('Tacos Mexicanos (3 unidades)', 'sabores.do.mundo@empresa.com', 30.00, 'Tortillas de milho com recheios diversos.'),
('Sushi Combo (12 peças)', 'sabores.do.mundo@empresa.com', 55.00, 'Seleção de sushis e sashimis.'),
('Pizza Margherita (individual)', 'sabores.do.mundo@empresa.com', 38.00, 'Pizza clássica italiana.'),
('Burger Artesanal com Fritas', 'sabores.do.mundo@empresa.com', 48.00, 'Hambúrguer com blend de carnes e batatas fritas.');

-- Inserindo dados na tabela `Unidade_federacao`
INSERT INTO `Unidade_federacao` (`sigla`, `nome`) VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais'),
('DF', 'Distrito Federal'),
('PR', 'Paraná');

-- Inserindo dados na tabela `Cidade`
INSERT INTO `Cidade` (`municipio`, `Unidade_federacao_sigla`) VALUES
('São Paulo', 'SP'),
('Campinas', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Brasília', 'DF'),
('Curitiba', 'PR');

-- Inserindo dados na tabela `Local`
INSERT INTO `Local` (`id_local`, `nome`, `endereco`, `referencia`, `Cidade_nome_cidade`, `Cidade_Unidade_federacao_sigla`) VALUES
(101, 'Expo Center Norte', 'Rua José Bernardo Pinto, 333', 'Próximo à estação Santana', 'São Paulo', 'SP'),
(102, 'Centro de Convenções Ulysses Guimarães', 'Eixo Monumental, S/N', 'Ao lado do Estádio Nacional', 'Brasília', 'DF'),
(103, 'Marina da Glória', 'Av. Infante Dom Henrique, S/N', 'Com vista para o Pão de Açúcar', 'Rio de Janeiro', 'RJ'),
(104, 'Parque Barigui', 'Av. Cândido Hartmann, S/N', 'Ao lado do Museu do Automóvel', 'Curitiba', 'PR');

-- Inserindo dados na tabela `Feira`
INSERT INTO `Feira` (`nome`, `Organizador_Usuario_email`, `descricao`, `data_inicio`, `data_termino`, `Local_id_local`, `Local_Cidade_nome_cidade`, `Local_Cidade_Unidade_federacao_sigla`) VALUES
('Expo Sabores Brasil 2025', 'eventos.master@empresa.com', 'A maior feira de gastronomia do Brasil, com expositores nacionais e internacionais.', '2025-08-15', '2025-08-20', 101, 'São Paulo', 'SP'),
('Festival Gourmet Brasília', 'pedro.lima@email.com', 'Celebração da culinária local e nacional em Brasília.', '2025-09-05', '2025-09-07', 102, 'Brasília', 'DF'),
('Rio Food & Drink Fair', 'organiza.tudo@empresa.com', 'Evento com foco em bebidas artesanais e culinária carioca.', '2025-10-10', '2025-10-12', 103, 'Rio de Janeiro', 'RJ');

-- Inserindo dados na tabela `Visitante`
INSERT INTO `Visitante` (`Usuario_email`) VALUES
('larissa.almeida@email.com'),
('rafael.pereira@email.com');

-- Inserindo dados na tabela `Ingresso`
-- Os números de ingresso serão auto-incrementados, não precisamos especificá-los.
INSERT INTO `Ingresso` (`Feira_nome`, `Visitante_Usuario_email`, `data`) VALUES
('Expo Sabores Brasil 2025', 'larissa.almeida@email.com', '2025-08-15'),
('Expo Sabores Brasil 2025', 'rafael.pereira@email.com', '2025-08-16'),
('Festival Gourmet Brasília', 'larissa.almeida@email.com', '2025-09-05');

-- Inserindo dados na tabela `Lista_produto`
INSERT INTO `Lista_produto` (`id`, `Expositor_Usuario_email`, `apelido`) VALUES
(1, 'joao.silva@email.com', 'Especialidades do Chef João'),
(2, 'maria.souza@email.com', 'Doces da Maria'),
(3, 'doces.artesanais@empresa.com', 'Melhores Doces Artesanais'),
(4, 'sabores.do.mundo@empresa.com', 'Viagem Gastronômica');

-- Inserindo dados na tabela `Lista_produto_has_Produto`
INSERT INTO `Lista_produto_has_Produto` (`Lista_produto_id`, `Lista_produto_Expositor_Usuario_email`, `Produto_nome`, `Produto_Expositor_Usuario_email`) VALUES
-- Lista de João Silva
(1, 'joao.silva@email.com', 'Paella Valenciana', 'joao.silva@email.com'),
(1, 'joao.silva@email.com', 'Salmão Grelhado com Legumes', 'joao.silva@email.com'),
(1, 'joao.silva@email.com', 'Tapas Variadas', 'joao.silva@email.com'),
(1, 'joao.silva@email.com', 'Risoto de Funghi Secchi', 'joao.silva@email.com'),

-- Lista de Maria Souza
(2, 'maria.souza@email.com', 'Bolo de Aniversário Red Velvet', 'maria.souza@email.com'),
(2, 'maria.souza@email.com', 'Cupcakes Decorados', 'maria.souza@email.com'),
(2, 'maria.souza@email.com', 'Docinhos Gourmet Caixa', 'maria.souza@email.com'),

-- Lista da Doçuras Caseiras Ltda
(3, 'doces.artesanais@empresa.com', 'Brigadeiro Gourmet Sortido', 'doces.artesanais@empresa.com'),
(3, 'doces.artesanais@empresa.com', 'Macarons Franceses (unidade)', 'doces.artesanais@empresa.com'),
(3, 'doces.artesanais@empresa.com', 'Cheesecake de Frutas Vermelhas', 'doces.artesanais@empresa.com'),
(3, 'doces.artesanais@empresa.com', 'Pudim de Leite Condensado', 'doces.artesanais@empresa.com'),

-- Lista da Sabores do Mundo Cozinha
(4, 'sabores.do.mundo@empresa.com', 'Pad Thai de Frango', 'sabores.do.mundo@empresa.com'),
(4, 'sabores.do.mundo@empresa.com', 'Tacos Mexicanos (3 unidades)', 'sabores.do.mundo@empresa.com'),
(4, 'sabores.do.mundo@empresa.com', 'Sushi Combo (12 peças)', 'sabores.do.mundo@empresa.com'),
(4, 'sabores.do.mundo@empresa.com', 'Burger Artesanal com Fritas', 'sabores.do.mundo@empresa.com');

-- Inserindo dados na tabela `Feira_has_Lista_produto`
INSERT INTO `Feira_has_Lista_produto` (`Feira_nome`, `Feira_Organizador_Usuario_email`, `Lista_produto_id`, `Lista_produto_Expositor_Usuario_email`) VALUES
('Expo Sabores Brasil 2025', 'eventos.master@empresa.com', 1, 'joao.silva@email.com'),
('Expo Sabores Brasil 2025', 'eventos.master@empresa.com', 3, 'doces.artesanais@empresa.com'),
('Festival Gourmet Brasília', 'pedro.lima@email.com', 2, 'maria.souza@email.com'),
('Festival Gourmet Brasília', 'pedro.lima@email.com', 4, 'sabores.do.mundo@empresa.com'),
('Rio Food & Drink Fair', 'organiza.tudo@empresa.com', 1, 'joao.silva@email.com'),
('Rio Food & Drink Fair', 'organiza.tudo@empresa.com', 3, 'doces.artesanais@empresa.com');

-- Inserindo dados na tabela `Administrador`
INSERT INTO `Administrador` (`Usuario_email`) VALUES
('admin@hubgourmet.com');