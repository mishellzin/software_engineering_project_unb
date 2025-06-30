import streamlit as st
import database as db

def check_credentials(username, password):
    users = db.listar_usuarios()
    for user in users:
        if user['email'] == username and user['senha'] == password:
            return True
    return False

def check_user_role(username):
    try:
        db.ler_expositor(username)
        return "Expositor"
    except Exception:
        try:
            db.ler_visitante(username)
            return "Visitante"
        except Exception:
            try:
                db.ler_organizador(username)
            except Exception:
                return None
        
def login_form():
    with st.form("login_form"):
        st.title("Autenticação")
        id_email = st.text_input("Usuário")
        password = st.text_input("Senha", type="password")
        submit_button = st.form_submit_button("Entrar")

        if submit_button:
            if check_credentials(id_email, password):
                st.session_state['username'] = id_email
                st.session_state['role'] = check_user_role(id_email)
                st.success("Login realizado com sucesso!")
                st.rerun()
            else:
                st.error("Certifique-se de ter preenchido corretamente login e senha.")
