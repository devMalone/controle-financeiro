# 💰 Controle Financeiro Pessoal — Web App PWA

Aplicativo moderno de gestão financeira pessoal e fluxo de caixa, construído segundo os padrões técnicos do **Antigravity Dev Standards**.

Projetado para funcionar com fluidez tanto em **smartphones (Android / iOS)** quanto em **computadores desktop**, com suporte a instalação como aplicativo nativo (PWA) e sincronização em nuvem em tempo real (Supabase).

---

## 🚀 Principais Recursos

- **📱 Experiência Mobile-First:** Botão de Novo Lançamento na zona do polegar, gaveta deslizante (*Bottom Sheet*), alvos de toque de 48px e teclado numérico automático (`inputmode="decimal"`).
- **⚡ Local-First + Nuvem em Tempo Real:** Funciona 100% offline via armazenamento local. Ao conectar com o Supabase, qualquer gasto registrado na rua no celular aparece instantaneamente na tela do seu computador.
- **📊 Baseado na sua Planilha Real:**
  - **Fluxo de Caixa / KPIs:** Saldo Atual, Entradas do Mês, Saídas do Mês e Lucro/Economia.
  - **Dashboard Inteligente:** Gráfico de distribuição por categorias, Top 5 Maiores Gastos e Maiores Entradas.
  - **Resultado Diário:** Calendário e linha do tempo dia a dia (1 a 31) com o saldo de cada dia.
  - **Extrato Completo:** Busca rápida, filtros por tipo, edição e exclusão de lançamentos.
- **📥 Exportação e Backup:** Exporte seus dados a qualquer momento para arquivo **Excel (CSV)** ou faça backup em **JSON**.
- **🎨 Design System Antigravity:** Tema Dark Mode moderno (`#0b0f17`), tipografia refinada e ícones SVG oficiais (Lucide Icons — zero emojis amadores na interface).

---

## 🔄 Como Conectar Celular e Computador (Sincronização em Nuvem)

O aplicativo funciona perfeitamente sem nuvem (salvando direto no aparelho). Se você quiser que o que você digita no celular apareça automaticamente no PC:

1. Crie uma conta gratuita em [supabase.com](https://supabase.com) e crie um novo projeto (leva 1 minuto).
2. No menu lateral do Supabase, clique em **SQL Editor**, cole o conteúdo do arquivo `schema_supabase.sql` e clique em **Run**.
3. Vá em **Project Settings > API** e copie a **Project URL** e a **Anon Public Key**.
4. No aplicativo (seja no celular ou no PC), clique no ícone de **Nuvem / Sincronização**, cole a URL e a Chave Anon e clique em **Conectar**.
5. Repita o passo 4 no outro aparelho. Pronto! Os dois aparelhos agora estão sincronizados em tempo real!

---

*Antigravity Dev Standards | Módulo Utilidades*
