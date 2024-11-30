import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
// console.log("env var", process.env, import.meta.env)

export default defineConfig({
  define: {
    'import.meta.env.SERVER_HOST': JSON.stringify(
      process.env.NODE_ENV === 'production' ? 'http://vm2.makonissoft.com:1314' : '/api'
    )
  },
  plugins: [react()],
  server: {
    cors: true,
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:1314/', // Specify your backend API URL here
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
});
