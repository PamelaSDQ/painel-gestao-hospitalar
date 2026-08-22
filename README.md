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

* **SQL Server / T-SQL:** Criação do banco de dados relacional, modelagem Star Schema e consultas analíticas avançadas.
* **Power BI:** Modelagem de dados, criação de medidas em DAX e construção do dashboard executivo interativo (`.pbix`).

---

## 📁 Estrutura do Repositório

* `/DataSet`: Arquivos de dados e bases utilizadas para carga no banco.
* `/Documentacao`: Registros visuais, prints e documentação do projeto.
* `/PowerBi`: Arquivo interativo `.pbix` do painel executivo.
* `/SQL`: Scripts `.sql` de criação das tabelas, população e consultas analíticas de negócio.

---

## 🗄️ Análise de Dados (SQL & Power BI)

Para apoiar a tomada de decisão da gestão hospitalar, foram criadas consultas analíticas em SQL (`SQL/04_Analise_Negocio_Hospitalar.sql`) focadas em otimização operacional e eficiência hospitalar:

* **Tempo Médio de Permanência:** Mapeamento da média de dias de internação por especialidade médica, identificando gargalos na rotação de leitos e direcionando ações de desospitalização segura.
* **Sazonalidade e Volume de Atendimentos:** Análise do histórico de internações (via `Dim_Calendario`) para antecipar picos de demanda, permitindo dimensionar escalas de equipe e insumos com antecedência.
* **Participação por Convênio:** Levantamento da representatividade percentual das operadoras de saúde sobre o total de internações, gerando insumos para negociações contratuais.

---

## 🚀 Como Visualizar o Projeto

1. **Dashboard no Power BI:** 
   * Baixe o arquivo `.pbix` na pasta `/PowerBi` e abra no Power BI Desktop para navegar pelos relatórios interativos.
2. **Scripts SQL:** 
   * Os scripts de criação, população e análise estão organizados na pasta `/SQL` para execução em qualquer ambiente SQL Server (SSMS).
   