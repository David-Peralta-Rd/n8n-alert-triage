# ADR-0001: Alcance y decisiones de la práctica

## Contexto
Práctica de 2-3 horas para una entrevista (vacante de Desarrollador Junior de Automatización e IA). Debe funcionar con `docker compose up` y poder explicarse de memoria.

## Decisión
- **Arquetipo 5** (automatización): un flujo de n8n con dos servicios, n8n y PostgreSQL.
- **Estructura plana:** `docker-compose.yml` en la raíz, sin `src/`. Con un solo flujo y un SQL no hay módulos que separar.
- **n8n sobre su SQLite interna** (volumen `n8n_data`); PostgreSQL guarda solo la tabla `alerts`.
- **Imágenes con tag fijo:** `n8n 2.42.7` y `postgres:17-alpine` (detalle en DEPENDENCIES.md).
- **Clasificación con respaldo:** modelo local primero; si falla, reglas de palabras clave. Se añadió la columna `clasificado_por` para mostrar cuál decidió.
- **Seguridad mínima:** puerto en `127.0.0.1`, secretos solo en `.env`, INSERT parametrizado, validación y límites de longitud en el nodo Code.

## Qué no aplica (y por qué)
- Rust/PyO3, FastAPI, capas y linters de arquitectura: no hay código de aplicación, solo dos nodos Code cortos.
- Pruebas y CI: pedido explícito de presentarlo como práctica básica.
- Docker de desarrollo separado: un solo compose basta.
- Agentes OpenCode, tareas y ADRs adicionales: sobredimensionado para 2-3 horas.

## Alternativas descartadas
- **n8n sobre PostgreSQL:** más parecido a producción, pero mezcla datos de n8n con las alertas y agrega una base más.
- **Nodo Postgres con operación Insert:** más visual, pero el SQL explícito es más fácil de explicar y es parametrizado.
- **Respuesta con expresión en Respond to Webhook:** se resolvió con `RETURNING` en el SQL y respuesta del primer ítem.

## Cuándo reconsiderar
Si el webhook se expone fuera de tu máquina (agregar autenticación de cabecera o firma HMAC), si el volumen crece (cola de n8n, PostgreSQL como base de n8n) o si la clasificación debe ser confiable (validación cruzada modelo + reglas).

## Para investigar
`n8n Header Auth`, `HMAC webhook signature`, `n8n queue mode`, `prompt injection`, `idempotency key`, `llama.cpp server OpenAI compatible`, `n8n expressions $json`.
