# 🏥 Painel de Gestão Hospitalar

Aplicação e dashboard interativo desenvolvidos para acompanhamento e análise de métricas operacionais hospitalares, permitindo a visualização de internações, capacidade de leitos, tempo médio de espera e análise por especialidades.

---

## 📸 Demonstração do Painel

![Demonstração do Dashboard](./Documentacao/dashboard.png.png)

---

## Principais Métricas e Funcionalidades

* **KPIs Operacionais:** Total de Pacientes, Tempo Médio de Espera e Casos Críticos (Triagem).
* **Gestão de Leitos:** Distribuição visual do status dos leitos (*Ocupado*, *Livre*, *Em Higienização*) por setor.
* **Perfil Demográfico e Triagem:** Proporção de atendimentos por nível de prioridade e especialidade.
* **Filtros Dinâmicos:** Segmentação interativa por Setor, Ano, Convênio e Especialidade.

---

## Tecnologias Utilizadas

* **Python 3.13:** Construção da aplicação interativa via Streamlit e tratamento de dados com Pandas e NumPy.
* **Streamlit & Plotly:** Interface web e gráficos dinâmicos para gestão operacional.
* **SQLite / SQL:** Criação do banco de dados relacional (`hospital.db`), modelagem e consultas analíticas.
* **Power BI:** Modelagem de dados e dashboard executivo (`.pbix`).

---

## 📁 Estrutura do Repositório

* `app.py`: Aplicação Streamlit de conexão direta ao SQLite.
* `hospital.db`: Banco de dados relacional da aplicação.
* `/DataSet`: Bases e arquivos de dados utilizados.
* `/Documentacao`: Registros visuais e regras de negócio do projeto.
* `/PowerBi`: Arquivo interativo `.pbix` do painel executivo.
* `/SQL`: Scripts de criação, população e consultas de análise de negócio.

---

## 🗄️ Análise de Dados  (SQL & Python)

Para apoiar a tomada de decisão da gestão hospitalar, foram desenvolvidas rotinas de integração em Python e consultas analíticas em SQL (`SQL/04_Analise_Negocio_Hospitalar.sql`):

* **Conexão Direta e Autônoma:** O script `app.py` realiza consultas SQL dinâmicas no banco SQLite (`hospital.db`), garantindo a criação de tabelas e carga inicial de dados caso o ambiente ainda não esteja configurado.
* **Tempo Médio de Permanência e Espera:** Mapeamento do fluxo de atendimento e gargalos na rotação de leitos para otimização da desospitalização.
* **Sazonalidade e Volume de Atendimentos:** Análise do histórico de internações para dimensionamento de escalas de enfermagem e insumos.
* **Participação por Convênio:** Levantamento da representatividade percentual das operadoras de saúde sobre o total de atendimentos.

---

## 🚀 Como Executar o App Streamlit

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/PamelaSDQ/painel-gestao-hospitalar.git](https://github.com/PamelaSDQ/painel-gestao-hospitalar.git)
   cd painel-gestao-hospitalar
   2. **Instale as dependências:**
   ```bash
   python -m pip install streamlit pandas numpy plotly
   
