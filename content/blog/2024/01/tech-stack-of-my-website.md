---
title: "Tech Stack of My Website"
date: 2024-01-30
slug: "my-web-tech-stack"
author: "Pablo García Ortega"
tags: ["Web Development", "Tech Stack", "Docker", "Caddy Server", "Hugo SSG", "Site Optimization", "Efficient Web Design"]
description: "Discover the streamlined and efficient tech stack behind pablogarcor.com. This post delves into why I chose Docker, Caddy Server, and Hugo SSG, highlighting the advantages of these technologies in modern web development."
---


Today, I want to talk about all the technologies I'm using on [pablogarcor.com](https://pablogarcor.com) and why I chose them over others. Sometimes, we overkill by using the most complex tools and resources simply because they're mainstream. That's not necessarily a bad thing; I've used a lot of fancy CMSs myself. But this time, I wanted to keep things simple, which is why I chose the Static Site Generator (SSG) path. But let me start from the beginning.

## Docker at the Very Bottom

Dockerization is often the way to go. It offers simplicity, compatibility, maintainability, and many more benefits that we've all read about in every blog post discussing Docker. So, Docker was always part of my plan.

## Serving the Site with Caddy

I'm a JavaScript guy, but I'm tired of using Nginx. I also didn't want to resort to something as dated as Apache. So, after some research, I discovered Caddy server, written in Go (which I love), and found it easy to use for my needs. It's simple to configure, powerful, and doesn't have runtime dependencies. All these factors led me to choose Caddy over other competitors.

## Hugo, the Static Site Generator

As I mentioned earlier, I didn't want to use a fancy and complex CMS with intricate databases, numerous dependencies, and the bulk that makes webpages heavy and slow to load and build. I sought simplicity, hence my choice of the SSG route. My search started with a focus on Go because, at the time, I was learning it and found it quite appealing. Eventually, I discovered HUGO, a fast framework for building websites.

The templating, directory structure, and configuration all seemed quite good to me, so I chose it and am very proud of my decision. HUGO is incredibly fast at building my site. I can also add content using front matter, and customization is easy and straightforward, eliminating the need for complex queries to populate my website.

## Conclusions

I aimed to adhere to the KISS principle (Keep It Simple, Stupid). And I think I've achieved that. My site loads quickly, builds fast, is easy to configure, and allows for straightforward content addition or customization, all without relying on thousands of dependencies. I plan to make some improvements in my CI/CD, but that's unrelated to my current tech stack, which I intend to keep for a long time.
