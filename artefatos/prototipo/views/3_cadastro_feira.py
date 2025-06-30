import streamlit as st

st.title("Cadastrar Feira")

nome = st.text_input("Nome da Feira")
descricao = st.text_area("Descrição da Feira")
data_inicio = st.date_input("Data de Início")
data_fim = st.date_input("Data de Fim")
uf = st.selectbox("Estado", ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"])
cidade = st.text_input("Cidade")
endereco = st.text_input("Endereço")
referencia = st.text_input("Referência (opcional)")

registrar = st.button("Registrar Feira")

if registrar:
    if nome and descricao and data_inicio and data_fim and uf and cidade and endereco:
        st.success("Feira cadastrada com sucesso!")
    else:
        st.error("Por favor, preencha todos os campos.")