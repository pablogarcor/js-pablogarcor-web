---
title: "Add iCloud+ Custom Email Account to Thunderbird"
date: 2024-05-24
slug: "icloud-custom-email-thunderbird"
tags: ["iCloud+", "Thunderbird", "Email Setup", "Linux"]
description: "Learn how to add a custom iCloud+ email account to Thunderbird on Linux. This guide provides step-by-step instructions for configuring your email client with an Apple app-specific password."
---

I use a couple of Apple products, but macOS isn’t one of my favorites. On my laptops and PCs, I have different flavors of Linux, and on all of them, I use Thunderbird as my mail client. Some time ago, I migrated my self-hosted mail server to iCloud+ (because it was cheaper and easier), and now I need to add my custom iCloud+ email address in Thunderbird. Here’s how I made it work:

1. Click on any email account or local folder tab.
2. Go to the upper right corner and click on “Account Settings.” This will open a new tab.
![Navigate to account settings](custom-icloud-email-thunderbird-1.webp)

3. In the new tab, click on the dropdown “Account Actions” and select “Add Mail Account.”
![Add mail account](custom-icloud-email-thunderbird-2.webp)

4. In the Account Setup tab, fill in the details. Pay attention to the password field because you need an Apple app-specific password.
5. Log in to [appleid.apple.com](https://appleid.apple.com/sign-in).
6. Click on the App-specific Passwords button.
![App-specific passwords](custom-icloud-email-thunderbird-3.webp)

7. In the pop-up, click on the cross icon.
![Create app-specific password](custom-icloud-email-thunderbird-4.webp)

8. Enter a name to remember where you are using that password. In this case, I will use Thunderbird and click create. After this, you may be required to enter the password of your iCloud account.
9. The new pop-up will give you the app-specific password. Copy it to a safe place, or you will need to create a new one in the future.
![Copy app-specific password](custom-icloud-email-thunderbird-5.webp)

10. Enter your name, iCloud email address, and the app-specific password you copied in the last step, and click on “Continue.”
![Enter email details](custom-icloud-email-thunderbird-6.webp)

11. Thunderbird will try to retrieve the IMAP and SMTP configuration of the iCloud+ mail server. You just need to click on “Done.”
![Retrieve configuration](custom-icloud-email-thunderbird-7.webp)

12. After completing these steps, close Thunderbird. When you open it again, you will see your custom email as one of your iCloud inboxes.
![Custom email inbox](custom-icloud-email-thunderbird-8.webp)

### Conclusions

Adding a custom iCloud+ email is just like configuring any other email but requires an Apple app-specific password to work. If you use your iCloud password, it won’t work.
