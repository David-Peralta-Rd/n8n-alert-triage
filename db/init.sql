-- Se ejecuta una sola vez, cuando el volumen de PostgreSQL está vacío.
-- Para reiniciarlo desde cero: docker compose down -v

CREATE TABLE IF NOT EXISTS alerts (
    id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo          VARCHAR(200) NOT NULL,
    descripcion     TEXT         NOT NULL CHECK (char_length(descripcion) <= 2000),
    severidad       TEXT         NOT NULL CHECK (severidad IN ('baja', 'media', 'alta', 'critica')),
    origen          VARCHAR(100) NOT NULL DEFAULT 'desconocido',
    creado_en       TIMESTAMPTZ  NOT NULL DEFAULT now(),
    -- Qué modo clasificó la alerta: el modelo local o las reglas de respaldo.
    clasificado_por TEXT         NOT NULL CHECK (clasificado_por IN ('llm', 'reglas'))
);

CREATE INDEX IF NOT EXISTS idx_alerts_creado_en ON alerts (creado_en DESC);
