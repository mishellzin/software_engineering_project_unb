import streamlit as st
import database as db

st.title("Comprar Ingresso")

st.write("Selecione a feira para a qual deseja comprar ingresso:")
feiras = db.listar_feiras()
feira_selecionada = st.selectbox("Feira", [f['nome_feira'] for f in feiras])
data = st.date_input("Data do ingresso")
quantidade = st.number_input("Quantidade de ingressos", min_value=1, max_value=10, value=1)

if st.button("Comprar Ingresso"):
    if feira_selecionada and data:
        sucesso = db.inserir_ingresso(feira_selecionada, data)
        if sucesso:
            st.success("Ingresso comprado com sucesso!")
        else:
            st.error("Erro ao comprar ingresso. Tente novamente.")
    else:
        st.error("Por favor, selecione uma feira e uma data.")

st.write("Você pode visualizar seus ingressos comprados na seção 'Meus Ingressos'.")