Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OdRD9-0002hw-F2
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 19:11:32 +0200
Received: by gwb15 with SMTP id 15so153537gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=yA5v9+DcuoSOOiYmTMxg1IcAnesEFSGO9rP5O/3d8e0=;
	b=s3JvHVKWrZ/ZO9drog2r2v7nvwDammBoxzDngcod9Onfq2QlmVtAUjZZO5rSpLm7Ps
	q7CrrY73vkS1brFL/5AWDKWyF+XtBEgbMgwrIMwU1vsKIgUDcr2mpK2UcZMDCQbYzoq8
	wcG8rqlLRVyZ5JpFFUraNVnBskIR0a+U8ON2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=YYtRfjLKh2S2DYi/A+1/bt7TOU40Ghpfjv+M7Iv2O9dVAfyAxOWAKSVz8fI1FqV9ew
	rWHEDOk4kjyLTjVaW3oxejIhlyTxP3D3R51LP8DP/x+8rMmmuUMhdaFOobhKD1JlshZ5
	QW2OK1BYVHEcoKUUJyitapzkFqEzoEBGVf4aQ=
Received: by 10.100.210.4 with SMTP id i4mr510920ang.262.1280164274054; Mon, 
	26 Jul 2010 10:11:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.176.77 with HTTP; Mon, 26 Jul 2010 10:10:53 -0700 (PDT)
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Mon, 26 Jul 2010 14:10:53 -0300
Message-ID: <AANLkTimz9CwgpLeXVJfSpML7Piqh3M53jsx-ALgTJ+ac@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Recipes for cmake 2.8.2
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
X-List-Received-Date: Mon, 26 Jul 2010 17:11:32 -0000
X-Groupsio-MsgNum: 21433
Content-Type: multipart/mixed; boundary=0016369895dbcf2a3e048c4d7879

--0016369895dbcf2a3e048c4d7879
Content-Type: text/plain; charset=UTF-8

Based on 2.6.4 recipes.

Best Regards, Etrunko

-- 
Eduardo de Barros Lima
eblima@gmail.com

--0016369895dbcf2a3e048c4d7879
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-CMake-Recipes-for-version-2.8.2.patch"
Content-Disposition: attachment; 
	filename="0001-CMake-Recipes-for-version-2.8.2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gc3kq9dy0

RnJvbSA4ZmUzMjYyYjQ3NjU1NTc3ZDM4NGZlYjUxNTBmYjgxOThmOWEwZWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFZHVhcmRvIExpbWEgKEV0cnVua28pIDxlYmxpbWFAZ21haWwu
Y29tPgpEYXRlOiBNb24sIDI2IEp1bCAyMDEwIDE0OjA4OjM2IC0wMzAwClN1YmplY3Q6IFtQQVRD
SF0gQ01ha2U6IFJlY2lwZXMgZm9yIHZlcnNpb24gMi44LjIKClNpZ25lZC1vZmYtYnk6IEVkdWFy
ZG8gTGltYSAoRXRydW5rbykgPGVibGltYUBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy9jbWFrZS9j
bWFrZS1uYXRpdmVfMi44LjIuYmIgfCAgICA5ICsrKysrKysrKwogcmVjaXBlcy9jbWFrZS9jbWFr
ZV8yLjguMi5iYiAgICAgICAgfCAgIDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
L2NtYWtlL2NtYWtlLW5hdGl2ZV8yLjguMi5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMv
Y21ha2UvY21ha2VfMi44LjIuYmIKCmRpZmYgLS1naXQgYS9yZWNpcGVzL2NtYWtlL2NtYWtlLW5h
dGl2ZV8yLjguMi5iYiBiL3JlY2lwZXMvY21ha2UvY21ha2UtbmF0aXZlXzIuOC4yLmJiCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjg1ZDRjMDIKLS0tIC9kZXYvbnVsbAorKysg
Yi9yZWNpcGVzL2NtYWtlL2NtYWtlLW5hdGl2ZV8yLjguMi5iYgpAQCAtMCwwICsxLDkgQEAKK2lu
aGVyaXQgbmF0aXZlCityZXF1aXJlIGNtYWtlLmluYworCitkb19pbnN0YWxsKCkgeworCW9lX3J1
bm1ha2UgaW5zdGFsbAorfQorCitTUkNfVVJJW21kNXN1bV0gPSAiOGM5NjdkNTI2NDY1N2E3OThm
MjJlZTIzOTc2ZmYwZDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzY2ZmYxNjlhZjc5ODU5OWQ3
ZGQ0MmU0MWU5ZjQ1MzNkNzM5NDJhMmJiOTI4MjM1MTE1NDEyZGNlNWI4MTQwNiIKZGlmZiAtLWdp
dCBhL3JlY2lwZXMvY21ha2UvY21ha2VfMi44LjIuYmIgYi9yZWNpcGVzL2NtYWtlL2NtYWtlXzIu
OC4yLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmMzYjI1OTEKLS0tIC9k
ZXYvbnVsbAorKysgYi9yZWNpcGVzL2NtYWtlL2NtYWtlXzIuOC4yLmJiCkBAIC0wLDAgKzEsMTAg
QEAKK3JlcXVpcmUgY21ha2UuaW5jCisKK2luaGVyaXQgY21ha2UKKworZG9fY29uZmlndXJlX2Fw
cGVuZCgpIHsKKwlzZWQgLWkgLWUgJ3MsSEFWRV9HTElCQ19TVFJFUlJPUl9SX19UUllSVU5fT1VU
UFVULUFEVkFOQ0VEOklOVEVSTkFMPTEsSEFWRV9HTElCQ19TVFJFUlJPUl9SX19UUllSVU5fT1VU
UFVULUFEVkFOQ0VEOklOVEVSTkFMPTAsJyBDTWFrZUNhY2hlLnR4dAorfQorCitTUkNfVVJJW21k
NXN1bV0gPSAiOGM5NjdkNTI2NDY1N2E3OThmMjJlZTIzOTc2ZmYwZDkiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNzY2ZmYxNjlhZjc5ODU5OWQ3ZGQ0MmU0MWU5ZjQ1MzNkNzM5NDJhMmJiOTI4MjM1
MTE1NDEyZGNlNWI4MTQwNiIKLS0gCjEuNy4wLjQKCg==

--0016369895dbcf2a3e048c4d7879--
