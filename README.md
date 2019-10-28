## nginx-html5-env
This is a simple nginx image that enables html-5-mode style urls, by redirecting all request to a single file. This use case is typical for single page apps, that are doing all the routing on the client-side.

Configuration is _inspired_ by https://gist.github.com/cjus/b46a243ba610661a7efb .

Furthermore it is able to generate or merge a config.json depending on the `environment`.

## Example usage
This is image is intended to be used as a base image:

```
FROM zalari/nginx-html5-env

ENV ENV_PREFIX=ZALARI
ENV CONFIG_NAME=config.json

COPY ./app/dist /usr/share/nginx/html/
COPY config.json /usr/share/nginx/html/
```

Then all environment variables passed to the **container** (e.g. via `docker run --rm -p 80:80 -e ZALARI_test='true' 
zalari/nginx-html5-env` 
having the **ZALARI** prefix will be used to generate / be merged into `/usr/share/nginx/html/config.json` and should be available at 
http://localhost/config.json.

There is a syntax for accessing nested values; have a look at [init/jsonenv.sh](./init/jsonenv.sh) for the actual logic for the lack of a
 better documentation for the time being.
