---
draft: true
title: "Creating a website using Hugo"
date: 2023-01-02T23:46:14+01:00
tags: ["tutorial", "hugo"]
featured_image: "hugo-logo-wide.svg"

---

## What is Hugo?

Hugo is a static site generator that offers several benefits for building fast and secure websites.

It has a fast build time, making it ideal for generating large sites quickly. Its intuitive interface and straightforward directory structure make it easy for users to get started with Hugo. 

Additionally, Hugo provides flexibility through templates, shortcodes, and custom output formats, and can be easily deployed to a variety of hosting platforms.

It is also well-suited for handling large sites and is more secure than dynamic sites because it generates static HTML files. Overall, Hugo is a popular choice for developers and content creators looking to build efficient and secure websites.

## Why should u use Hugo?

1. **Speed**: Hugo is designed to be fast, with a build time of milliseconds for sites with thousands of pages. This makes it ideal for generating large sites quickly. Also having static HTML files often lead to blazingly fast loading times, which lead to good [PageSpeedInsights](https://pagespeed.web.dev/) scores.

2. **Ease of use**: Hugo has a simple and intuitive interface, with a straightforward directory structure and Markdown-based content files. This makes it easy for new users to get started with Hugo.

3. **Flexibility**: Hugo allows you to customize your site with templates, shortcodes, and custom output formats. This makes it easy to build a site that fits your specific needs.

4. **Portability**: Hugo sites can be easily deployed to a variety of hosting platforms, including GitHub Pages, Amazon S3, and Netlify. This makes it easy to host your site wherever you prefer.

5. **Scalability**: Hugo is designed to handle large sites with ease, making it easy to scale your site as it grows.

6. **Security**: Hugo generates static HTML files, which means that there are no dynamic elements or database queries. This makes Hugo sites more secure and less vulnerable to attacks.

## Install Hugo

Here are the general steps to install Hugo:

Download the Hugo executable for your operating system from the Hugo website: [hugo-website](https://gohugo.io/getting-started/installing/)

Extract the downloaded file and move the Hugo executable to a directory that is in your PATH. This will allow you to run the Hugo command from any directory.

Test the installation by opening a terminal and running the following command:

> hugo version

### Install on debian based linux

1. Download the latest hugo release .deb file
2. Run the following command, you must exchange the filename and location for the actual path of your download:

> sudo dpkg -i ~/Downloads/hugo_105.00.deb

Now hugo should be installed on your machine. Test it using the following command:

> hugo version

## Use Docker

Instead of installing Hugo locally on your machine, you can use a Docker container.

Example:

```docker
FROM alpine:latest as build

ENV HUGO_VERSION 0.109.0

RUN wget https://github.com/gohugoio/hugo/releases/latest/download/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/local/bin/hugo

FROM gcr.io/distroless/static:nonroot
USER nonroot

COPY --from=build /usr/local/bin/hugo /usr/local/bin/hugo
COPY noobygames.de /site
WORKDIR /site

EXPOSE 80

ENTRYPOINT ["hugo" "server" "-p" "1313" "--bind" "0.0.0.0"]
```

Now you can build the image using the following commands:

> cd your/path/where/the/docker/file/is
> docker build -t hugo-server .

When the image has successfully been built, you can start the container using the following command:

> docker run hugo-server