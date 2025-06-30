import streamlit as st
import database as db

st.title("Meus Ingressos")
st.write("Aqui estão os ingressos que você comprou:")
username = st.session_state.get('username', None)

ingressos = db.ler_ingressos_por_usuario(username)
if ingressos:
    for ingresso in ingressos:
        st.write(f"**Número:** {ingresso['numero']}")
        st.write(f"**Feira:** {ingresso['Feira_nome']}")
        st.write(f"**Data:** {ingresso['data']}")
        st.write("---")

else:
    st.write("Você ainda não comprou nenhum ingresso. Volte à página de compra para adquirir ingressos para as feiras disponíveis.")
