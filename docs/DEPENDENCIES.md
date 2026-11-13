# Versiones y estado de seguridad

Verificado el 2026-11-12. Búsqueda web; no pude consultar Docker Hub ni el daemon de Docker desde el entorno donde se construyó el proyecto.

| Pieza | Versión | Soporte | Avisos abiertos | Verificada | Fuente |
|---|---|---|---|---|---|
| n8n (imagen `docker.n8n.io/n8nio/n8n`) | 2.42.7 | Línea 2.42.x estable | Sin avisos conocidos al 2026-11-12 en las búsquedas hechas; los avisos recientes encontrados (último lote: 2026-07-22) corresponden a versiones anteriores. «verificar» en la pestaña Security del repo | parcial | GitHub Release `n8n@2.42.7` (marcada *Latest*, 2026-10-12); guía de versiones de Orchestra (octubre 2026) |
| PostgreSQL (`postgres:17-alpine`) | 17.x (el tag toma el último parche) | Hasta nov. 2029 | Sin avisos conocidos al 2026-11-12 en las búsquedas hechas | parcial | Instaclustr (fechas EOL); AWS RDS (parches 17.10 en jun. 2026 y 17.11 en ago. 2026) |
| llama.cpp | El que ya tengas en tu máquina (fuera del compose) | No aplica | No verificado | no | — |

Notas:
- La release de n8n tiene más de 30 días, así que puede haber una 2.42.x más nueva. Para actualizar: cambia el tag en `docker-compose.yml`, `docker compose pull` y `docker compose up -d`.
- Si el tag `2.42.7` no existiera en el registro, revisa los tags publicados en Docker Hub y usa el más reciente de la línea 2.42.x.
- PostgreSQL 17 se eligió sobre 18 por simplicidad: el volumen de 18 usa otra ruta de datos.
