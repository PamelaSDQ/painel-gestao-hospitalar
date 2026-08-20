import sqlite3
import pandas as pd
import numpy as np
import streamlit as st
import plotly.express as px

st.set_page_config(page_title="Analytics Hospitalar", layout="wide")

# Conexão e carga de dados 
@st.cache_data
def get_data():
    conn = sqlite3.connect('hospital.db')
    cursor = conn.cursor()

    # DDL simples
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS atendimentos (
            id_paciente INTEGER PRIMARY KEY,
            setor TEXT,
            tempo_espera_min INTEGER,
            status_leito TEXT,
            custo_procedimento REAL,
            convenio TEXT,
            prioridade_atendimento TEXT
        )
    ''')

   
    cursor.execute("SELECT COUNT(*) FROM atendimentos")
    if cursor.fetchone()[0] == 0:
        base_inicial = [
            (1001, 'UTI', 45, 'Ocupado', 2500.0, 'Amil', 'Normal'),
            (1002, 'Emergência', 90, 'Ocupado', 1200.0, 'SUS', 'Alta Prioridade'),
            (1003, 'Enfermaria', 20, 'Livre', 800.0, 'Bradesco Saúde', 'Normal'),
            (1004, 'Pediatria', 75, 'Ocupado', 1500.0, 'Particular', 'Alta Prioridade'),
            (1005, 'Emergência', 110, 'Em Higienização', 3100.0, 'SUS', 'Alta Prioridade'),
            (1006, 'UTI', 15, 'Ocupado', 4500.0, 'Amil', 'Normal'),
            (1007, 'Enfermaria', 65, 'Livre', 950.0, 'Bradesco Saúde', 'Alta Prioridade')
        ]
        cursor.executemany("INSERT INTO atendimentos VALUES (?,?,?,?,?,?,?)", base_inicial)
        conn.commit()

    df = pd.read_sql_query("SELECT * FROM atendimentos", conn)
    conn.close()
    return df

# Carga inicial
df_atendimentos = get_data()

# Header
st.title("🏥 Gestão de Leitos e Triagem")
st.caption("Visão operacional em tempo real do fluxo de atendimento.")

# Filtro lateral 
st.sidebar.header("Filtros")
setor_selecionado = st.sidebar.multiselect(
    "Filtrar por Setor:",
    options=df_atendimentos['setor'].unique(),
    default=df_atendimentos['setor'].unique()
)

# Aplica o filtro da sidebar
df_filtrado = df_atendimentos[df_atendimentos['setor'].isin(setor_selecionado)]

# Cartões de Resumo
kpi1, kpi2, kpi3 = st.columns(3)

comprimento_total = len(df_filtrado)
media_espera = df_filtrado['tempo_espera_min'].mean() if comprimento_total > 0 else 0
casos_criticos = len(df_filtrado[df_filtrado['prioridade_atendimento'] == 'Alta Prioridade'])

kpi1.metric("Pacientes Filtrados", comprimento_total)
kpi2.metric("Tempo Médio de Espera", f"{media_espera:.0f} min")
kpi3.metric("Casos Críticos (Triagem)", casos_criticos)

st.markdown("---")

# Visualizações
col_esquerda, col_direita = st.columns(2)

with col_esquerda:
    fig_leitos = px.bar(
        df_filtrado,
        x='setor',
        color='status_leito',
        title="Capacidade dos Leitos por Setor",
        labels={'setor': 'Setor Hospitalar', 'count': 'Qtd. Leitos', 'status_leito': 'Status'},
        barmode='group'
    )
    st.plotly_chart(fig_leitos, use_container_width="stretch")

with col_direita:
    fig_prioridade = px.pie(
        df_filtrado,
        names='prioridade_atendimento',
        title="Volume por Nível de Prioridade",
        hole=0.4 # Transforma em rosca (visual mais moderno)
    )
    st.plotly_chart(fig_prioridade, use_container_width="stretch")