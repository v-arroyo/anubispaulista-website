FROM hugomods/hugo:latest
WORKDIR /site
COPY . /site
CMD ["server", "--bind", "0.0.0.0"]
