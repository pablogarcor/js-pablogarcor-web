---
title: "DNS over HTTPS on OpenWRT"
date: 2024-04-02
slug: "dns-over-https-openwrt"
author: "Your Name"
tags: ["DNS over HTTPS", "OpenWRT", "Internet Security", "Privacy", "Network Configuration"]
description: "Explore how DNS over HTTPS (DoH) can protect your online privacy and bypass ISP domain blocking. This guide provides a comprehensive overview and step-by-step instructions on configuring DoH on an OpenWRT router."
---

One week ago, in Spain, a [judge attempted to block access to Telegram](https://www.reuters.com/world/europe/high-court-orders-temporary-suspension-telegrams-services-spain-2024-03-23/) due to copyright issues with some national media firms. That incident made me think about what I could do if my ISP decides to ban a site like Telegram, preventing access. The obvious workaround for geo-blocked sites is using a VPN, but I sought a simpler solution for soft domain bans. That's when I discovered DNS over HTTPS (DoH).

## What is DNS over HTTPS or DoH?

DoH is a method of DNS resolution that uses the HTTPS protocol. This means that unlike common DNS requests that use HTTP, DoH requests are encrypted and sent over HTTPS sessions, making them more secure.

## How does DoH help if my ISP blocks a domain?

Normally, when you surf the web and type a domain name, a DNS resolution request is made. This request travels through your ISP's network to a DNS server, allowing your ISP to see which sites you're trying to access. DNS over HTTPS comes in handy by encrypting these requests, hiding them not only from your ISP but from anyone else who might be snooping.

## Seeing DNS requests on your router

To verify that your router is sending DNS requests that your ISP can see:

1. Connect to your router via SSH: `ssh <router_ip>@<router_user>`
2. Install tcpdump: `opkg install tcpdump`
3. Find your WAN interface: `ip addr`
4. Execute tcpdump: `tcpdump -i <wan_interface> udp and dst port 53`

After this, if you see request after request, it means you're not using DoH.

## Activating DoH on my OpenWRT router

Configuring DNS over HTTPS on all devices might be cumbersome, so setting it up on the router to cover the whole network is more efficient.

1. Access your router's web interface (LUCi).
2. Navigate to System → Software and click "Update lists..." Then install the package named `luci-app-https-dns-proxy` to configure the options in LuCI.
3. `https-dns-proxy` comes with Google and Cloudflare DNS by default. Configure the proxy in LuCI under Services → HTTPS DNS Proxy. Configure dnsmasq under Network → DHCP and DNS.

To verify it's working, use tcpdump again to check if DNS requests are being sent over port 53.

## Conclusion

As governments and companies attempt to control our digital lives, it's crucial to understand and use tools like DNS over HTTPS to protect our privacy and freedom online.
