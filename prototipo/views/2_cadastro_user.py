import streamlit as st

st.title("Cadastre-se")

nome = st.text_input("Nome")
email = st.text_input("Email")
tipo_usuario = st.selectbox("Tipo de Usuário", ["Visitante", "Expositor","Organizador"])

if tipo_usuario == "Expositor":
    st.subheader("Informações de Expositor")
    descricao = st.text_area("Descreva-se para o seu público")
    contato = st.text_area("Insira formas de contato (telefone, redes sociais etc.)")

senha = st.text_input("Senha", type="password")
confirmar_senha = st.text_input("Confirmar Senha", type="password")

registrar = st.button("Registrar-se")

if registrar:
    if nome and email and tipo_usuario == "Expositor" and descricao and contato:
        st.success("Cadastrado de Expositor realizado com sucesso!")
    elif nome and email and tipo_usuario != "Expositor":
        st.success("Cadastrado realizado com sucesso!")
    else:
        st.error("Por favor, preencha todos os campos.")