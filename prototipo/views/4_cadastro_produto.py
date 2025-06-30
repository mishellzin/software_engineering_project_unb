import streamlit as st

st.title("Cadastrar Produto")

produto = st.text_input("Nome do Produto")
descricao = st.text_area("Descrição do Produto")
preco = st.number_input("Preço do Produto", min_value=0.0, format="%.2f")

registrar = st.button("Registrar Produto")

if registrar:
    if produto and descricao and preco >= 0:
        st.success(f"Produto cadastrado com sucesso!")
    else:
        st.error("Por favor, preencha todos os campos corretamente.")