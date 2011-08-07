Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Qq70F-0006UL-LR
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Aug 2011 19:19:07 +0200
Received: by qyk4 with SMTP id 4so1329922qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Aug 2011 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Aps7ynCChds4R4gC/1FfG+QTTq27Tzylm0KXAe9a4C4=;
	b=VEgOL6O8skxOG4d1nxL5uEbMOIMHOzwkmBliTBgiwrQnIbzh8OWZqEWoLZz77BOY6V
	q7ZkiXLYU4uNdDIoXvOOPWqQq9d/mNLVsuRy2MqL0i+igKCljVD/Lx9pHcmRElTjkZUb
	oBEX5s0iZNPT/SnWYnvPo3YkEAFwpB3P2wKVA=
Received: by 10.229.36.75 with SMTP id s11mr3414940qcd.176.1312737280165; Sun,
	07 Aug 2011 10:14:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.229.9 with HTTP; Sun, 7 Aug 2011 10:14:20 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Sun, 7 Aug 2011 19:14:20 +0200
Message-ID: <CACrTVg+OATbFizVqggezkfyM_k0i-JVfuBv3FNj0f59JthmvQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] libpng: upgrade to 1.2.46
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Aug 2011 17:19:07 -0000
X-Groupsio-MsgNum: 33543
Content-Type: multipart/mixed; boundary=00163683235c4485fe04a9ed778c

--00163683235c4485fe04a9ed778c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi

Following the release of a new version of libpng oe recipe needs to be
updated as the target download has moved to history in the ftp
So does someone can apply this attached file please
thx.
best regards

Sylvain Par=E9 (aka GarthPS)

--00163683235c4485fe04a9ed778c
Content-Type: application/octet-stream; 
	name="0002-libpng-upgrade-to-v1.2.46.patch"
Content-Disposition: attachment; 
	filename="0002-libpng-upgrade-to-v1.2.46.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gr29sbid0

RnJvbSA2MzZmZTMzOWYzNDI5NmZjZGYxZDU1NzFjMTQ0YzA0NGM5ZjE2Nzg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/U3lsdmFpbj0yMCdHYXJ0aFBTJz0yMFBhcj1D
Mz1BOT89IDxzeWx2YWluLnBhcmVAZ21haWwuY29tPgpEYXRlOiBTdW4sIDcgQXVnIDIwMTEgMTk6
MDg6MzAgKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0gbGlicG5nOiB1cGdyYWRlIHRvIHYxLjIu
NDYKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCglUaGlzIGFkZHJlc3NlcyB0aGUg
Zm9sbG93aW5nIHNlY3VyaXR5IGFkdmlzb3JpZXM6CgkJKiBDVkUtMjAxMS0yNjkwCgkJKiBDVkUt
MjAxMS0yNjkyCgpTaWduZWQtb2ZmLWJ5OiBTeWx2YWluICdHYXJ0aFBTJyBQYXLDqSA8c3lsdmFp
bi5wYXJlQGdtYWlsLmNvbT4KLS0tCiByZWNpcGVzL2xpYnBuZy9saWJwbmdfMS4yLjQ0LmJiIHwg
ICAgOCAtLS0tLS0tLQogcmVjaXBlcy9saWJwbmcvbGlicG5nXzEuMi40Ni5iYiB8ICAgIDYgKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL2xpYnBuZy9saWJwbmdfMS4yLjQ0LmJiCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcmVjaXBlcy9saWJwbmcvbGlicG5nXzEuMi40Ni5iYgoKZGlmZiAtLWdpdCBh
L3JlY2lwZXMvbGlicG5nL2xpYnBuZ18xLjIuNDQuYmIgYi9yZWNpcGVzL2xpYnBuZy9saWJwbmdf
MS4yLjQ0LmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0YmE3YjIwLi4wMDAwMDAw
Ci0tLSBhL3JlY2lwZXMvbGlicG5nL2xpYnBuZ18xLjIuNDQuYmIKKysrIC9kZXYvbnVsbApAQCAt
MSw4ICswLDAgQEAKLXJlcXVpcmUgbGlicG5nLmluYwotCi1QUiA9ICIke0lOQ19QUn0uMCIKLQot
U1JDX1VSSSArPSAiZmlsZTovL21ha2VmaWxlX2ZpeC5wYXRjaCIKLQotU1JDX1VSSVtsaWJwbmcu
bWQ1c3VtXSA9ICJlM2FjNzg3OWQ2MmFkMTY2YTZmMGM3NDQxMzkwZDEyYiIKLVNSQ19VUklbbGli
cG5nLnNoYTI1NnN1bV0gPSAiYjlhYjIwZjFjMmMzYmY2YzQ0NDhmZDliZDhhNGE4OTA1YjkxODEx
NGQ1ZmFkYTU2Yzk3YmI3NThhMTdiNzIxNSIKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGlicG5nL2xp
YnBuZ18xLjIuNDYuYmIgYi9yZWNpcGVzL2xpYnBuZy9saWJwbmdfMS4yLjQ2LmJiCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmUwMzZiZTUKLS0tIC9kZXYvbnVsbAorKysgYi9y
ZWNpcGVzL2xpYnBuZy9saWJwbmdfMS4yLjQ2LmJiCkBAIC0wLDAgKzEsNiBAQAorcmVxdWlyZSBs
aWJwbmcuaW5jCisKK1BSID0gIiR7SU5DX1BSfS4wIgorCitTUkNfVVJJW2xpYnBuZy5tZDVzdW1d
ID0gImU4YjQzZGM3OGVmOTViMzk0OWFmN2Y5NjFkNzY4NzRiIgorU1JDX1VSSVtsaWJwbmcuc2hh
MjU2c3VtXSA9ICJhNWU3OTZlMTgwMmIyZTIyMTQ5OGJkYTA5ZmY5ODUwYmM3ZWM5MDY4YjY3ODg5
NDhjYzJjNDJhZjIxMzkxNGQ4IgotLSAKMS43LjQuMQoK

--00163683235c4485fe04a9ed778c--
