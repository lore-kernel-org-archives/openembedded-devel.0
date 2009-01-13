Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas@gstaedtner.net>) id 1LMq2J-00041v-Lf
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 21:38:55 +0100
Received: by fg-out-1718.google.com with SMTP id l26so116945fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 12:32:24 -0800 (PST)
Received: by 10.86.23.17 with SMTP id 17mr166507fgw.0.1231878743972;
	Tue, 13 Jan 2009 12:32:23 -0800 (PST)
Received: by 10.86.26.6 with HTTP; Tue, 13 Jan 2009 12:32:23 -0800 (PST)
Message-ID: <c16a574a0901131232u34603546l805a5a07b43d4ba8@mail.gmail.com>
Date: Tue, 13 Jan 2009 21:32:23 +0100
From: thomasg <thomas@gstaedtner.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c16a574a0901131012qa4e5610vd42641879e1bef4a@mail.gmail.com>
MIME-Version: 1.0
References: <c16a574a0901130824w742cc8bera0f17d66d12c0e1@mail.gmail.com>
	<gkig6q$alf$2@ger.gmane.org>
	<c16a574a0901131012qa4e5610vd42641879e1bef4a@mail.gmail.com>
Subject: Re: Request for inclusion of euphony_0.1.1.bb to the tree
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
X-List-Received-Date: Tue, 13 Jan 2009 20:38:55 -0000
X-Groupsio-MsgNum: 7212
Content-Type: multipart/mixed; 
	boundary="----=_Part_52817_29185061.1231878743960"

------=_Part_52817_29185061.1231878743960
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry that I have to mail again, but I accidentally forgot to add
something in the tarball, so I created a new one and bumped the
version.
At least I can provide a (hopefully proper) patch now.

------=_Part_52817_29185061.1231878743960
Content-Type: application/octet-stream;
 name=0001-euphony-bump-0.1.1-0.1.2.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fpx0r2180
Content-Disposition: attachment;
 filename=0001-euphony-bump-0.1.1-0.1.2.patch

RnJvbSBjZWVmMDMzNGIwM2ZjYTE4ZjlmMDBlOTUyNTQ3ODRjNGNkY2ZjN2RmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgR3N0YWVkdG5lciA8dGhvbWFzQGdzdGFlZHRuZXIu
bmV0PgpEYXRlOiBUdWUsIDEzIEphbiAyMDA5IDIxOjI2OjU5ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gZXVwaG9ueTogYnVtcCAwLjEuMSAtPiAwLjEuMgoKLS0tCiBjb25mL2NoZWNrc3Vtcy5pbmkg
ICAgICAgICAgICAgICAgfCAgICA2ICsrKy0tLQogcGFja2FnZXMvZXVwaG9ueS9ldXBob255XzAu
MS4xLmJiIHwgICAxMSAtLS0tLS0tLS0tLQogcGFja2FnZXMvZXVwaG9ueS9ldXBob255XzAuMS4y
LmJiIHwgICAxMSArKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAxNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlcy9ldXBob255L2V1
cGhvbnlfMC4xLjEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlcy9ldXBob255L2V1cGhv
bnlfMC4xLjIuYmIKCmRpZmYgLS1naXQgYS9jb25mL2NoZWNrc3Vtcy5pbmkgYi9jb25mL2NoZWNr
c3Vtcy5pbmkKaW5kZXggOTBkNjJlYS4uMWMyMTZkNSAxMDA2NDQKLS0tIGEvY29uZi9jaGVja3N1
bXMuaW5pCisrKyBiL2NvbmYvY2hlY2tzdW1zLmluaQpAQCAtNDY4Miw5ICs0NjgyLDkgQEAgc2hh
MjU2PTJiNmIwZDFhZjViOGFmNjNlYjVlZGY3MDUyZmRjOWY0NmM1NWI2ZjdiNjA3Yzg3NzJiMTg5
MjdjYjQ4MWVjZjkKIG1kNT0yOGZiMTVjZDAyNDE2MmM1NTI0OTg4OGZlMWI5NzgyMAogc2hhMjU2
PWM3NDIzOTA1MmQ2MjU2NWMxM2E4MmY5YmJmMjE3YTRmZGNjZTRiMzQ5NDllMzYxYjUzYmIzZjI4
ZTMxNjg1NDMKIAotW2h0dHA6Ly9wcm9qZWN0cy5nc3RhZWR0bmVyLm5ldC9ldXBob255L2V1cGhv
bnktMC4xLjEudGFyLmd6XQotbWQ1PTAyNjMzNDQ4OTlkZmNkYTdkMjYxODNmNjNkNzE2YjAwCi1z
aGEyNTY9MzRhMzk4YzFjMjdiMjI2NTJjZWFjZjI5YjFiM2YzM2ZlZmYzM2Y2MTI4MDJlZDBjOWI1
N2FmYzFkY2U5YjI3ZQorW2h0dHA6Ly9wcm9qZWN0cy5nc3RhZWR0bmVyLm5ldC9ldXBob255L2V1
cGhvbnktMC4xLjIudGFyLmd6XQorbWQ1PWY5MzlmYjlhMmM3YWFiNTg3N2Y3ZTQyMDgyN2FmMDI3
CitzaGEyNTY9ZmVkY2YxYjY2OTg3M2RlNjdkNjlkM2U4MWFkODhhNDc0MTRjY2ZlZGU0YTZhNzNm
ZmExNWFiODJiMTM3ODQ2MAogCiBbaHR0cDovL2VubGlnaHRlbm1lbnQuZnJlZWRlc2t0b3Aub3Jn
L2ZpbGVzL2V2YXMtMC45LjkuMDM3LnRhci5nel0KIG1kNT0yMWNiNzEzYjAxYmUzOTk5MmE3YzQ4
ZDBlYTIzNDI5YgpkaWZmIC0tZ2l0IGEvcGFja2FnZXMvZXVwaG9ueS9ldXBob255XzAuMS4xLmJi
IGIvcGFja2FnZXMvZXVwaG9ueS9ldXBob255XzAuMS4xLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAxMzRhMzlkLi4wMDAwMDAwCi0tLSBhL3BhY2thZ2VzL2V1cGhvbnkvZXVwaG9u
eV8wLjEuMS5iYgorKysgL2Rldi9udWxsCkBAIC0xLDExICswLDAgQEAKLURFU0NSSVBUSU9OID0g
IkV1cGhvbnkgaXMgYSBpbnN0cnVtZW50IGxvYWRlciB0aGF0IGdpdmVzIHNpbXBsZSBlZGplLWd1
aXMgYSBwbGF0Zm9ybSB3aXRoIHNvdW5kc3VwcG9ydCB0byBsZXQgeW91IHBsYXkgbXVzaWMiCi1E
RVBFTkRTID0gImVjb3JlIGV2YXMgZWRqZSBlZXQgZmx1aWRzeW50aCIKLUxJQ0VOU0UgPSAiQlNE
IDMtY2xhdXNlIgotU0VDVElPTiA9ICJ4MTEvbXVsdGltZWRpYSIKLQotaW5oZXJpdCBhdXRvdG9v
bHMgCi0KLVNSQ19VUkkgPSAiaHR0cDovL3Byb2plY3RzLmdzdGFlZHRuZXIubmV0L2V1cGhvbnkv
JHtQTn0tJHtQVn0udGFyLmd6IgotCi1GSUxFU18ke1BOfSArPSAiJHtkYXRhZGlyfSIKLQpkaWZm
IC0tZ2l0IGEvcGFja2FnZXMvZXVwaG9ueS9ldXBob255XzAuMS4yLmJiIGIvcGFja2FnZXMvZXVw
aG9ueS9ldXBob255XzAuMS4yLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAu
LjEzNGEzOWQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlcy9ldXBob255L2V1cGhvbnlfMC4x
LjIuYmIKQEAgLTAsMCArMSwxMSBAQAorREVTQ1JJUFRJT04gPSAiRXVwaG9ueSBpcyBhIGluc3Ry
dW1lbnQgbG9hZGVyIHRoYXQgZ2l2ZXMgc2ltcGxlIGVkamUtZ3VpcyBhIHBsYXRmb3JtIHdpdGgg
c291bmRzdXBwb3J0IHRvIGxldCB5b3UgcGxheSBtdXNpYyIKK0RFUEVORFMgPSAiZWNvcmUgZXZh
cyBlZGplIGVldCBmbHVpZHN5bnRoIgorTElDRU5TRSA9ICJCU0QgMy1jbGF1c2UiCitTRUNUSU9O
ID0gIngxMS9tdWx0aW1lZGlhIgorCitpbmhlcml0IGF1dG90b29scyAKKworU1JDX1VSSSA9ICJo
dHRwOi8vcHJvamVjdHMuZ3N0YWVkdG5lci5uZXQvZXVwaG9ueS8ke1BOfS0ke1BWfS50YXIuZ3oi
CisKK0ZJTEVTXyR7UE59ICs9ICIke2RhdGFkaXJ9IgorCi0tIAoxLjYuMC42Cgo=

------=_Part_52817_29185061.1231878743960--
