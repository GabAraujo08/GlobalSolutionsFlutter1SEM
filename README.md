#SunScore

**Inteligência orbital para viabilidade de energia solar.**

SunScore é um aplicativo mobile desenvolvido em Flutter como parte da **Global Solution — FIAP 2025**.  
A plataforma simula a análise preditiva de imóveis para instalação de painéis solares, cruzando dados
de satélites espaciais (irradiação, aerossóis, temperatura e clima espacial) para gerar relatórios
financeiros de alta precisão: **Payback, TIR e Score de Risco Climático**.

---

##O Problema

Famílias e pequenos negócios que desejam instalar painéis solares enfrentam cálculos de ROI
superficiais e genéricos, que ignoram variáveis críticas como degradação térmica, sujeira acumulada
e anomalias climáticas. O investidor decide no escuro.

##A Solução

O SunScore consome dados gratuitos de constelações de satélites (Sentinel-5P da ESA, NOAA) e
processa camadas orbitais para gerar um dossiê técnico e financeiro do imóvel, mostrando a estimativa
real de geração de energia e o retorno exato do investimento.

---

##Fluxo de Telas

### 1. Splash Screen
> Tela inicial exibida por 2 segundos ao abrir o app.

![Splash Screen](screenshots/01_splash.png)

---

### 2. Introdução (Onboarding)
> 3 páginas explicando o app com botões "Voltar" e "Próximo / Começar".

![Intro – Página 1](screenshots/02_intro_1.png)
![Intro – Página 2](screenshots/02_intro_2.png)
![Intro – Página 3](screenshots/02_intro_3.png)

---

### 3. Tela Principal — Lista de Imóveis
> Lista de imóveis cadastrados com filtro por tipo (Residencial, Comercial, Industrial, Rural,
> Alto Risco, Premium ROI) e campo de busca por nome ou endereço.

![Tela Principal](screenshots/03_home.png)

---

### 4. Tela de Detalhe do Imóvel
> Exibe a análise orbital completa do imóvel selecionado: endereço, área do telhado, conta mensal,
> SunScore, Payback estimado e TIR.

![Detalhe do Imóvel](screenshots/04_detail.png)

---

### 5. Tela Sobre
> Informações do projeto e integrantes do grupo.

![Sobre](screenshots/05_about.png)
