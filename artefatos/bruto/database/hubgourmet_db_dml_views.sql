USE `hubgourmet`;

-- View para a entidade Feira
CREATE OR REPLACE VIEW `view_feiras` AS
SELECT
    f.nome AS nome_feira,
    f.descricao AS descricao_feira,
    f.data_inicio AS data_inicio,
    f.data_termino AS data_termino,
    l.nome AS local,
    c.municipio AS cidade,
    uf.sigla AS estado
FROM
    `Feira` AS f
JOIN
    `Local` AS l ON f.Local_id_local = l.id_local
    AND f.Local_Cidade_nome_cidade = l.Cidade_nome_cidade
    AND f.Local_Cidade_Unidade_federacao_sigla = l.Cidade_Unidade_federacao_sigla
JOIN
    `Cidade` AS c ON l.Cidade_nome_cidade = c.municipio
    AND l.Cidade_Unidade_federacao_sigla = c.Unidade_federacao_sigla
JOIN
    `Unidade_federacao` AS uf ON c.Unidade_federacao_sigla = uf.sigla;

-- View para a entidade Expositor
CREATE OR REPLACE VIEW `view_expositores` AS
SELECT
    u.nome AS nome_expositor,
    e.descricao AS descricao_expositor,
    e.contato AS contato_expositor
FROM
    `Expositor` AS e
JOIN
    `Usuario` AS u ON e.Usuario_email = u.email;

-- View para a entidade Produto
CREATE OR REPLACE VIEW `view_produtos` AS
SELECT
    p.nome AS nome_produto,
    p.descricao AS descricao_produto,
    p.preco AS preco_produto
FROM
    `Produto` AS p;

-- View para a entidade Ingresso
CREATE OR REPLACE VIEW `view_ingressos` AS
SELECT
    i.Feira_nome AS nome_da_feira,
    LPAD(i.numero, 9, '0') AS numero_de_ingresso,
    i.data AS data_ingresso
FROM
    `Ingresso` AS i;
