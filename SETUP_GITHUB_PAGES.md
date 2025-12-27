# Configuración de GitHub Pages

## ⚠️ IMPORTANTE: Pasos Requeridos ANTES del Deploy

Antes de que el workflow pueda desplegar automáticamente, necesitas habilitar GitHub Pages en tu repositorio.

### Pasos para Habilitar GitHub Pages:

1. **Ve a tu repositorio en GitHub**

2. **Ve a Settings** (Configuración)
   - Haz clic en "Settings" en la parte superior del repositorio

3. **Ve a la sección "Pages"**
   - En el menú lateral izquierdo, busca y haz clic en "Pages"
   - O ve directamente a: `https://github.com/[TU_USUARIO]/[TU_REPO]/settings/pages`

4. **Configura la fuente (Source)**
   - En la sección "Source", selecciona **"GitHub Actions"** (NO "Deploy from a branch")
   - Esto es CRÍTICO: debe ser "GitHub Actions", no una rama

5. **Guarda los cambios**
   - Haz clic en "Save" si es necesario

### Verificación

Una vez habilitado, deberías ver:
- Un mensaje indicando que GitHub Pages está configurado para usar GitHub Actions
- La opción "GitHub Actions" seleccionada en Source

### Después de Habilitar

1. Haz push de cualquier cambio al repositorio:
   ```bash
   git add .
   git commit -m "Habilitar GitHub Pages"
   git push origin main
   ```

2. Ve a la pestaña **Actions** en GitHub
   - El workflow "Deploy to GitHub Pages" debería ejecutarse automáticamente

3. Una vez completado, tu aplicación estará disponible en:
   - `https://[TU_USUARIO].github.io/[TU_REPO]/`

## 🔧 Solución de Problemas

### Error: "Get Pages site failed"

**Causa**: GitHub Pages no está habilitado o no está configurado para usar GitHub Actions.

**Solución**:
1. Sigue los pasos arriba para habilitar GitHub Pages
2. Asegúrate de seleccionar "GitHub Actions" como fuente, NO una rama
3. Espera unos minutos después de habilitar
4. Vuelve a ejecutar el workflow desde la pestaña Actions

### El workflow se ejecuta pero no despliega

1. Verifica que GitHub Pages esté habilitado (Settings > Pages)
2. Verifica que "GitHub Actions" esté seleccionado como fuente
3. Revisa los logs del workflow en la pestaña Actions para ver errores específicos

### No puedo ver la opción "GitHub Actions" en Source

Esto puede significar que:
- Tu repositorio es privado y necesitas GitHub Pro/Team (GitHub Pages para repos privados requiere plan de pago)
- O que tu cuenta de GitHub no tiene permisos para configurar Pages

**Solución para repositorios privados**:
- Considera hacer el repositorio público (si es posible)
- O actualiza a un plan de GitHub que incluya GitHub Pages para repos privados

## 📝 Notas

- GitHub Pages es **gratis para repositorios públicos**
- Para repositorios privados, necesitas GitHub Pro, Team o Enterprise
- El primer deploy puede tardar 5-10 minutos
- Los deploys subsecuentes son más rápidos (2-5 minutos)

