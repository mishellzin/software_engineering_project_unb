import streamlit as st
import database as db
from forms.form_login import login_form

@st.dialog("Login")
def login_dialog():
    login_form()

st.title("HubGourmet")
st.write("Bem-vindo ao HubGourmet!")
st.header("Feiras Gastronômicas")
st.subheader("Consulte as feiras em realização e participe!")

if st.button("Consultar Feiras"):
    feiras = db.listar_feiras()
    feira_selecionada = st.selectbox("Feira", [f['nome_feira'] for f in feiras])
    if feira_selecionada:
        st.write(f"Você selecionou a feira: {feira_selecionada}")
    else:
        st.write("Nenhuma feira selecionada.")
    
if st.button("Entrar"):
    login_dialog()
