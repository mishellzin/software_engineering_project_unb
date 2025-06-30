import mysql.connector
import streamlit as st

HOST = st.secrets["host"]
USER = st.secrets["user"]
PASSWORD = st.secrets["password"]
DATABASE = st.secrets["database"]

TIPO_USUARIO = {
    "ADMIN": "Administrador",
    "EXPOSITOR": "Expositor",
    "VISITANTE": "Visitante",
    "COLABORADOR": "Colaborador",
    "ORGANIZADOR": "Organizador",
    "PARCEIRO": "Parceiro",
}

### -------------------------------
### Connection to the database
### -------------------------------
def get_connection():
    try:
        connection = mysql.connector.connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            database=DATABASE
        )
        if connection.is_connected():
            print("Conectado à base de dados")
            return connection
    except mysql.connector.Error as err:
        print(f"Erro: {err}")
        return None

### -------------------------------
### Create entities
### -------------------------------

def inserir_usuario(email, nome, senha, tipo_usuario, descricao=None, contato=None):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Usuario (email, nome, senha) VALUES (%s, %s, %s)
    """, (email, nome, senha))
    conn.commit()
    match tipo_usuario:
        case "EXPOSITOR":
            cursor.execute("""
                INSERT INTO Expositor (descricao, contato) VALUES (%s, %s) WHERE email = %s
            """, (descricao, contato, email))
        case "ADMIN":
            cursor.execute("""
                INSERT INTO Admin (email) VALUES (%s)
            """, (email,))
        case "VISITANTE":
            cursor.execute("""
                INSERT INTO Visitante (email) VALUES (%s)
            """, (email,))
        case "COLABORADOR":
            cursor.execute("""
                INSERT INTO Colaborador (email) VALUES (%s)
            """, (email,))
        case "ORGANIZADOR":
            cursor.execute("""
                INSERT INTO Organizador (email) VALUES (%s)
            """, (email,))
        case "PARCEIRO":
            cursor.execute("""
                INSERT INTO Parceiro (email) VALUES (%s)
            """, (email,))
        case __:
            pass    # Outros tipos de usuário não requerem inserção adicional
    conn.close()

def inserir_feira(nome, data_inicio, data_fim, localizacao, descricao):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Feira (nome, data_inicio, data_fim, localizacao, descricao)
        VALUES (%s, %s, %s, %s, %s)
    """, (nome, data_inicio, data_fim, localizacao, descricao))
    conn.commit()
    conn.close()

def inserir_unidade_federativa(nome, sigla):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Unidade_federacao (nome, sigla) VALUES (%s, %s)
    """, (nome, sigla))
    conn.commit()
    conn.close()

def inserir_cidade(municipio, id_uf):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Cidade (municipio, id_uf) VALUES (%s, %s)
    """, (municipio, id_uf))
    conn.commit()
    conn.close()

def inserir_local(nome, endereco, referencia, id_cidade):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Local (nome, endereco, referencia, id_cidade)
        VALUES (%s, %s, %s, %s)
    """, (nome, endereco, referencia, id_cidade))
    conn.commit()
    conn.close()

def inserir_produto(nome, descricao, preco, quantidade, id_expositor):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Produto (nome, descricao, preco, quantidade, id_expositor)
        VALUES (%s, %s, %s, %s, %s)
    """, (nome, descricao, preco, quantidade, id_expositor))
    conn.commit()
    conn.close()

def inserir_ingresso(tipo, preco, quantidade, id_feira):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Ingresso (tipo, preco, quantidade, id_feira)
        VALUES (%s, %s, %s, %s)
    """, (tipo, preco, quantidade, id_feira))
    conn.commit()
    conn.close()

def inserir_lista_produtos(id_expositor, id_produto):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO ListaProdutos (id_expositor, id_produto)
        VALUES (%s, %s)
    """, (id_expositor, id_produto))
    conn.commit()
    conn.close()

### -------------------------------
### Read entities
### -------------------------------
def ler_usuario(email):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Usuario WHERE email = %s", (email,))
    usuario = cursor.fetchone()
    conn.close()
    return usuario

def ler_expositor(email):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Expositor WHERE email = %s", (email,))
    expositor = cursor.fetchone()
    conn.close()
    return expositor

def ler_organizador(email):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Organizador WHERE email = %s", (email,))
    organizador = cursor.fetchone()
    conn.close()
    return organizador

def ler_visitante(email):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Visitante WHERE email = %s", (email,))
    visitante = cursor.fetchone()
    conn.close()
    return visitante

def ler_feira(id_feira):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Feira WHERE id_feira = %s", (id_feira,))
    feira = cursor.fetchone()
    conn.close()
    return feira

def ler_produto(id_produto):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Produto WHERE id_produto = %s", (id_produto,))
    produto = cursor.fetchone()
    conn.close()
    return produto

def ler_ingresso(id_ingresso):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Ingresso WHERE id_ingresso = %s", (id_ingresso,))
    ingresso = cursor.fetchone()
    conn.close()
    return ingresso

def ler_unidade_federativa(id_uf):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Unidade_federacao WHERE id_uf = %s", (id_uf,))
    uf = cursor.fetchone()
    conn.close()
    return uf

def ler_cidade(id_cidade):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Cidade WHERE id_cidade = %s", (id_cidade,))
    cidade = cursor.fetchone()
    conn.close()
    return cidade

def ler_local(id_local):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Local WHERE id_local = %s", (id_local,))
    local = cursor.fetchone()
    conn.close()
    return local

def ler_lista_produtos(id_expositor):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT * FROM ListaProdutos WHERE id_expositor = %s
    """, (id_expositor,))
    lista_produtos = cursor.fetchall()
    conn.close()
    return lista_produtos

def ler_produtos_por_expositor(id_expositor):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT * FROM Produto WHERE id_expositor = %s
    """, (id_expositor,))
    produtos = cursor.fetchall()
    conn.close()
    return produtos

def ler_ingressos_por_feira(id_feira):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT * FROM Ingresso WHERE id_feira = %s
    """, (id_feira,))
    ingressos = cursor.fetchall()
    conn.close()
    return ingressos

def ler_expositores_por_feira(id_feira):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT * FROM Expositor WHERE id_feira = %s
    """, (id_feira,))
    expositores = cursor.fetchall()
    conn.close()
    return expositores

def ler_ingressos_por_usuario(email):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT * FROM Ingresso WHERE Visitante_Usuario_email = %s
    """, (email,))
    ingressos = cursor.fetchall()
    conn.close()
    return ingressos

### -------------------------------
### Update entities
### -------------------------------

def atualizar_usuario(email, nome=None, senha=None, tipo_usuario=None, descricao=None, contato=None):
    conn = get_connection()
    cursor = conn.cursor()
    if nome:
        cursor.execute("UPDATE Usuario SET nome = %s WHERE email = %s", (nome, email))
    if senha:
        cursor.execute("UPDATE Usuario SET senha = %s WHERE email = %s", (senha, email))
    if tipo_usuario:
        cursor.execute("UPDATE Usuario SET tipo_usuario = %s WHERE email = %s", (tipo_usuario, email))
    if descricao or contato:
        cursor.execute("UPDATE Expositor SET descricao = %s, contato = %s WHERE email = %s", (descricao, contato, email))
    conn.commit()
    conn.close()

def atualizar_feira(id_feira, nome=None, data_inicio=None, data_fim=None, localizacao=None, descricao=None):
    conn = get_connection()
    cursor = conn.cursor()
    if nome:
        cursor.execute("UPDATE Feira SET nome = %s WHERE id_feira = %s", (nome, id_feira))
    if data_inicio:
        cursor.execute("UPDATE Feira SET data_inicio = %s WHERE id_feira = %s", (data_inicio, id_feira))
    if data_fim:
        cursor.execute("UPDATE Feira SET data_fim = %s WHERE id_feira = %s", (data_fim, id_feira))
    if localizacao:
        cursor.execute("UPDATE Feira SET localizacao = %s WHERE id_feira = %s", (localizacao, id_feira))
    if descricao:
        cursor.execute("UPDATE Feira SET descricao = %s WHERE id_feira = %s", (descricao, id_feira))
    conn.commit()
    conn.close()

def atualizar_produto(id_produto, nome=None, descricao=None, preco=None, quantidade=None):
    conn = get_connection()
    cursor = conn.cursor()
    if nome:
        cursor.execute("UPDATE Produto SET nome = %s WHERE id_produto = %s", (nome, id_produto))
    if descricao:
        cursor.execute("UPDATE Produto SET descricao = %s WHERE id_produto = %s", (descricao, id_produto))
    if preco:
        cursor.execute("UPDATE Produto SET preco = %s WHERE id_produto = %s", (preco, id_produto))
    if quantidade:
        cursor.execute("UPDATE Produto SET quantidade = %s WHERE id_produto = %s", (quantidade, id_produto))
    conn.commit()
    conn.close()

def atualizar_ingresso(id_ingresso, tipo=None, preco=None, quantidade=None):
    conn = get_connection()
    cursor = conn.cursor()
    if tipo:
        cursor.execute("UPDATE Ingresso SET tipo = %s WHERE id_ingresso = %s", (tipo, id_ingresso))
    if preco:
        cursor.execute("UPDATE Ingresso SET preco = %s WHERE id_ingresso = %s", (preco, id_ingresso))
    if quantidade:
        cursor.execute("UPDATE Ingresso SET quantidade = %s WHERE id_ingresso = %s", (quantidade, id_ingresso))
    conn.commit()
    conn.close()

def atualizar_lista_produtos(id_expositor, id_produto):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        UPDATE ListaProdutos SET id_produto = %s WHERE id_expositor = %s
    """, (id_produto, id_expositor))
    conn.commit()
    conn.close()

def atualizar_unidade_federativa(id_uf, nome=None, sigla=None):
    conn = get_connection()
    cursor = conn.cursor()
    if nome:
        cursor.execute("UPDATE Unidade_federacao SET nome = %s WHERE id_uf = %s", (nome, id_uf))
    if sigla:
        cursor.execute("UPDATE Unidade_federacao SET sigla = %s WHERE id_uf = %s", (sigla, id_uf))
    conn.commit()
    conn.close()

def atualizar_cidade(municipio=None, id_uf=None):
    conn = get_connection()
    cursor = conn.cursor()
    if municipio:
        cursor.execute("UPDATE Cidade SET municipio = %s WHERE id_uf = %s", (municipio, id_uf))
    if id_uf:
        cursor.execute("UPDATE Cidade SET id_uf = %s WHERE id_uf = %s", (id_uf, id_uf))
    conn.commit()
    conn.close()

def atualizar_local(id_local, nome, endereco, referencia, id_cidade):
    conn = get_connection()
    cursor = conn.cursor()
    if id_local:
        cursor.execute("UPDATE Local SET id_local = %s WHERE id_local = %s", (id_local, id_local))
    if nome:
        cursor.execute("UPDATE Local SET nome = %s WHERE id_local = %s", (nome, id_local))
    if endereco:
        cursor.execute("UPDATE Local SET endereco = %s WHERE id_local = %s", (endereco, id_local))
    if referencia:
        cursor.execute("UPDATE Local SET referencia = %s WHERE id_local = %s", (referencia, id_local))
    if id_cidade:
        cursor.execute("UPDATE Local SET id_cidade = %s WHERE id_local = %s", (id_cidade, id_local))
    conn.commit()
    conn.close()

### -------------------------------
### Delete entities
### -------------------------------

def deletar_usuario(email):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Usuario WHERE email = %s", (email,))
    conn.commit()
    conn.close()

def deletar_feira(id_feira):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Feira WHERE id_feira = %s", (id_feira,))
    conn.commit()
    conn.close()

def deletar_produto(id_produto):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Produto WHERE id_produto = %s", (id_produto,))
    conn.commit()
    conn.close()

def deletar_ingresso(id_ingresso):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Ingresso WHERE id_ingresso = %s", (id_ingresso,))
    conn.commit()
    conn.close()

def deletar_lista_produtos(id_expositor, id_produto):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        DELETE FROM ListaProdutos WHERE id_expositor = %s AND id_produto = %s
    """, (id_expositor, id_produto))
    conn.commit()
    conn.close()

def deletar_unidade_federativa(id_uf):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Unidade_federacao WHERE id_uf = %s", (id_uf,))
    conn.commit()
    conn.close()

def deletar_cidade(id_cidade):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Cidade WHERE id_cidade = %s", (id_cidade,))
    conn.commit()
    conn.close()

def deletar_local(id_local):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Local WHERE id_local = %s", (id_local,))
    conn.commit()
    conn.close()

### -------------------------------
### Read Views
### -------------------------------

def listar_feiras():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM view_feiras")
    feiras = cursor.fetchall()
    conn.close()
    return feiras

def listar_usuarios():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM usuario")
    usuarios = cursor.fetchall()
    conn.close()
    return usuarios

def listar_expositores():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM view_expositores")
    expositores = cursor.fetchall()
    conn.close()
    return expositores

def listar_produtos():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM view_produtos")
    produtos = cursor.fetchall()
    conn.close()
    return produtos

def listar_ingressos():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM view_ingressos")
    ingressos = cursor.fetchall()
    conn.close()
    return ingressos
