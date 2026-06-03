---
title: "Migrating My Website to Azure"
date: 2024-04-22
slug: "migrating-website-azure"
author: "Pablo García Ortega"
tags: ["Azure", "Cloud Migration", "Web Hosting", "Static Websites", "GitHub Integration"]
description: "Discover the benefits and process of migrating a personal website to Azure. This article covers why Azure is a great choice for hosting, the streamlined architecture setup using Hugo, and the advantages of automated deployments through GitHub integration."
---

I had my website and my dockerized mail server on DigitalOcean. Everything worked seamlessly well. However, these were personal projects and didn’t demand a lot of resources. That’s why I decided to migrate and stop paying more than 4 bucks every month for my droplet.

## Why Azure?

Azure is the **Microsoft cloud** and keeps growing every day. I'm also trying to learn more about it each day, and using it is the way to do it. It also has a free tier that is more than enough for my personal webpage. [Azure Pricing Details](https://azure.microsoft.com/en-us/pricing/details/app-service/static/#pricing)

## My Website Architecture and Deployment

My website architecture is simple. It is just a static webpage created using the **Hugo Static Site Generator**. Every time I wanted to post a new article, I needed to modify the code, add the content, and build the site with Hugo. After that, I uploaded the content to my web server folder on the DigitalOcean droplet. Using Azure, I will avoid some unnecessary steps:

1. Azure is directly connected with my GitHub repo, and every time the main branch is updated, Azure triggers the deployment of the new build of my website.
2. Because it is connected directly to my GitHub, I don't have to make the manual build of my site.
3. I don’t need to upload the build anywhere because everything is connected and automated to make my life easier.

## How to Do It?

Well, Azure docs are a charm. They have all the process well documented, from setting up your GitHub account to retrieve your webpage project to DNS configuration, using Azure DNS or a third-party DNS service. I used a third-party service because I don’t want to pay Azure DNS for such basic stuff. The docs to configure the website and build it with Hugo are here: [Publish Hugo](https://learn.microsoft.com/en-us/azure/static-web-apps/publish-hugo). On that same page, you can press on "next steps" if you want to configure a custom domain to point to your site.

## Pros

1. **Azure free tier for static websites**.
2. Easy deployment if integrated with GitHub.
3. No server configuration needed. No web server, no messing with SSL certificates.
4. Well-written and updated docs to finish all the processes, from GitHub connection to setting the correct DNS on a third-party provider.

## Cons

1. None for me. As long as the free tier covers your needs, it's a good deal. If you need more than what's offered, it is a lot more expensive than other services, but the cloud usually isn’t the way to go for amateurs and hobbyists. The next tier is the Standard tier that costs 9 bucks per app per month, really expensive compared to the price of renting your own VPS.

## Conclusions

Cloud services are good as long as they are free, I mean, for personal projects. Mid and big companies can find cloud provider services useful, but common people shouldn’t go far from the free tier they offer.
