---
title: "Decrypt and use your WhatsApp DB"
date: 2024-03-14
slug: "decrypt-whatsapp-db"
author: "Pablo García Ortega"
tags: ["WhatsApp Encryption", "Data Recovery", "Python Projects", "Data Security", "WhatsApp Decryption"]
description: "Dive deep into decrypting WhatsApp's encrypted database. This post offers a step-by-step guide on how to access and decrypt WhatsApp backup data, highlighting the use of Python for data security and recovery."
---


The other day, I was talking to a good friend of mine who owns a business and whose main source of sales is made through **WhatsApp**. I was talking about how important having data is to make informed decisions, and then he came up to me telling that he has a huge source of data from the last ten years or more, but it is all in his WhatsApp. So, I set myself to work to find a way to access that data.

The first thing I tried was looking for a way to import the chats. That option exists, but just for one chat at a time. That means that if you have 100 chats with different people, you need to repeat the process a hundred times... not what I was looking for.
Then, I remembered that **WhatsApp can make backups** and store them in the cloud, so the data should be somewhere on the device. On Android, the backups were in `/data/data/com.whatsapp/files/`, which looked good, but the data was encrypted... Where are the good old days when WhatsApp sent the messages in plain text? XD.
I tried to find the keys to decrypt but found nothing. Then, I went to Google and found out that the solution wasn't so hard to accomplish.

## End-to-end Encrypted Backups

The first step we need to take is going to settings → Chats → Chat Backup and enable "**end-to-end encrypted backup**" and use the hex key, not the password. Save the hex key in a safe place because it will be used to decrypt your data.

## Decrypt the DB

Once WhatsApp has finished making the backup, you should go to `/data/data/com.whatsapp/files` and copy the file with the crypt15 extension to your PC. Once you have the DB and the hex key, you just need this Python project to work the magic:
https://github.com/ElDavoo/WhatsApp-Crypt14-Crypt15-Decrypter

- Clone the project.
- Install the requirements.
- Execute this command:
```bash
python3 src/wa_crypt_tools/wadecrypt.py hexKey ./msgstore.db.crypt15 ./msgstore.db
```

`hexKey` should be changed to the key you received when end-to-end backup encryption was activated.

## Find the data in the DB

Once you have done all this, you have a .db file that can be accessed through your favorite database manager. The data inside the database is not easy to find because we first need to know where the data we want to find is, but I found that in my backup version, all the messages were in the message table.

## Conclusions

Finding and using WhatsApp data is not that hard, but remember that WhatsApp is full of personal info, so the data you take from it should be properly anonymized and encrypted to fulfill your country's legislation.