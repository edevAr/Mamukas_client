# Instrucciones para Deploy a GitHub Pages

## ✅ Configuración Completada

El proyecto ya está configurado para deploy automático a GitHub Pages usando GitHub Actions.

## 📋 Pasos para Activar el Deploy

### 1. Habilitar GitHub Pages en tu repositorio

1. Ve a tu repositorio en GitHub
2. Ve a **Settings** > **Pages**
3. En la sección **Source**, selecciona **"GitHub Actions"** (no "Deploy from a branch")
4. Guarda los cambios

### 2. Hacer Push del Código

El workflow se activará automáticamente cuando hagas push a la rama `main` o `master`:

```bash
git add .
git commit -m "Configurar deploy a GitHub Pages"
git push origin main
```

### 3. Verificar el Deploy

1. Ve a la pestaña **Actions** en tu repositorio de GitHub
2. Verás un workflow llamado "Deploy to GitHub Pages" ejecutándose
3. Espera a que termine (puede tardar 5-10 minutos la primera vez)
4. Una vez completado, verás un enlace a tu sitio en la sección "Deploy to GitHub Pages"

## 🌐 URL de tu Aplicación

Tu aplicación estará disponible en:
- **Si tu repo es `username.github.io`**: `https://username.github.io/`
- **Si tu repo es `username/repo-name`**: `https://username.github.io/repo-name/`

## ⚙️ Configuración Automática

El workflow detecta automáticamente:
- El nombre de tu repositorio
- El `base-href` correcto según el tipo de repositorio
- Construye la aplicación Flutter web
- Despliega automáticamente a GitHub Pages

## 🔧 Configuración Actual

- **Backend API**: `https://mamukas-erp-backend-6x7b.onrender.com`
- **Flutter Version**: 3.24.0
- **Build**: Release mode con optimizaciones

## 🐛 Solución de Problemas

### El workflow falla

1. Verifica que tengas Flutter instalado correctamente en tu máquina local
2. Verifica que `pubspec.yaml` esté correcto
3. Revisa los logs en la pestaña Actions para ver el error específico

### Las rutas no funcionan al recargar

Esto es normal en GitHub Pages. Flutter ya incluye un `404.html` que redirige a `index.html`, pero si tienes problemas:

1. Verifica que el `base-href` sea correcto
2. Asegúrate de que el archivo `.nojekyll` esté presente en la raíz

### CORS Errors

Si ves errores de CORS, verifica que:
1. El backend en Render tenga configurado CORS para permitir tu dominio de GitHub Pages
2. La URL del backend en `api_constants.dart` sea correcta

## 📝 Notas Importantes

- El deploy se ejecuta automáticamente en cada push a `main` o `master`
- También puedes ejecutarlo manualmente desde la pestaña Actions > "Deploy to GitHub Pages" > "Run workflow"
- El primer deploy puede tardar más tiempo (5-10 minutos)
- Los deploys subsecuentes son más rápidos (2-5 minutos)

## 🔄 Actualizar el Deploy

Cada vez que hagas cambios y hagas push a `main`, el deploy se ejecutará automáticamente:

```bash
git add .
git commit -m "Tus cambios"
git push origin main
```

¡Listo! Tu aplicación se desplegará automáticamente. 🚀

