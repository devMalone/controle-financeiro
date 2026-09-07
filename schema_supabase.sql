-- ==============================================================================
-- Schema Supabase — Controle Financeiro Antigravity (Sincronização em Tempo Real)
-- ==============================================================================
-- Instruções:
-- 1. Acesse o painel do seu projeto no Supabase (https://supabase.com).
-- 2. No menu lateral esquerdo, clique no ícone "SQL Editor" (ícone de terminal).
-- 3. Clique em "+ New query", cole todo este código e clique no botão verde "Run".
-- 4. Pronto! Sua nuvem estará 100% configurada e aceitando sincronização em tempo real.
-- ==============================================================================

-- 1. Criação da tabela principal de transações
CREATE TABLE IF NOT EXISTS public.transacoes (
    id TEXT PRIMARY KEY,
    user_id TEXT DEFAULT 'malone',
    date DATE NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('Entrada', 'Saída')),
    category TEXT NOT NULL,
    description TEXT DEFAULT '',
    amount NUMERIC(12, 2) NOT NULL,
    bank TEXT DEFAULT '',
    fitid TEXT DEFAULT '',
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc', NOW())
);

-- Atualização automática de colunas para quem já tinha criado a tabela antes:
ALTER TABLE public.transacoes ADD COLUMN IF NOT EXISTS bank TEXT DEFAULT '';
ALTER TABLE public.transacoes ADD COLUMN IF NOT EXISTS fitid TEXT DEFAULT '';

-- 2. Índices de alta performance para busca e ordenação
CREATE INDEX IF NOT EXISTS idx_transacoes_date ON public.transacoes(date DESC);
CREATE INDEX IF NOT EXISTS idx_transacoes_user ON public.transacoes(user_id);

-- 3. Habilita Políticas de Segurança (Row Level Security)
ALTER TABLE public.transacoes ENABLE ROW LEVEL SECURITY;

-- 4. Política de Acesso com Anon Key (Permite que o seu app no celular e PC leia/escreva com segurança)
DROP POLICY IF EXISTS "Acesso Total Anonimo Pessoal" ON public.transacoes;
CREATE POLICY "Acesso Total Anonimo Pessoal"
ON public.transacoes
FOR ALL
TO anon
USING (true)
WITH CHECK (true);

-- 5. Ativação da Publicação Realtime do Supabase (WebSocket)
-- Isso faz com que qualquer INSERT/UPDATE/DELETE no celular seja transmitido no mesmo milissegundo para o PC!
ALTER PUBLICATION supabase_realtime ADD TABLE public.transacoes;

-- ==============================================================================
-- Fim da Configuração. Tudo pronto para parear seu aplicativo!
-- ==============================================================================
