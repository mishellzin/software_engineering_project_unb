import streamlit as st
import database as db
from forms.form_login import login_form

ROLES = [None, "Organizador", "Visitante", "Expositor"]

@st.dialog("Login")
def login_dialog():
    login_form()

# autenticação
if 'username' not in st.session_state:
    st.session_state['username'] = None
if 'role' not in st.session_state:
    st.session_state['role'] = None

# setup de páginas
log_button = st.sidebar.button("Login", key="login_button")
if log_button:
    login_dialog()

home_page = st.Page(
    page="views/1_home.py",
    title="HubGourmet",
    icon="🍽️",
    default=True
)

compra_ingresso = st.Page(
    page="views/5_comprar_ingresso.py",
    title="Comprar Ingresso",
    icon="🛒"
)

meus_ingressos = st.Page(
    page="views/6_meus_ingressos.py",
    title="Meus Ingressos",
    icon="🎫"
)

cadastro_user = st.Page(
    page="views/2_cadastro_user.py",
    title="Cadastro de Usuário",
    icon="✏️"
)

cadastro_feira = st.Page(
    page="views/3_cadastro_feira.py",
    title="Cadastro de Feira",
    icon="🎪"
)

cadastro_produto = st.Page(
    page="views/4_cadastro_produto.py",
    title="Cadastro de Produto",
    icon="🥞"
)

# setupo navegação
pg = st.navigation(
    {
        "Principal":[home_page, compra_ingresso, meus_ingressos],
        "Cadastro":[cadastro_user, cadastro_feira, cadastro_produto],
    }
)

# informação entre páginas
st.sidebar.text("Micheron Systems © 2025")

# execução da navegação
pg.run()
