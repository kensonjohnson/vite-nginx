# NGINX + Vite Example

This example is deploys a site built by [Vite](https://vitejs.dev/) and served by [NGINX](https://www.nginx.org/).

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/vh1mKL?referralCode=-QSyeL)

## Features

- NGINX
- Build static files with Vite

## How to use

- Open the `site/index.html` in the browser

## Notes

By default, the site is built by Vite to the `dist` directory. This is then copied into the NGINX container. If you want to change the build directory, you can update the `vite.config.js` file.

```js
export default defineConfig({
  build: {
    outDir: "path/you/want/to/build/to",
  },
});
```

You will have to also update the Dockerfile to copy the correct directory.

```Dockerfile
COPY --from=builder /app/path/you/want/to/build/to /usr/share/nginx/html
```

The site is deployed using the default NGINX configuration. This can be overridden with a custom conf file by adding

```
COPY nginx.conf /etc/nginx/nginx.conf
```

to the end of the Dockerfile. For more information, [read the docs](https://hub.docker.com/_/nginx).
