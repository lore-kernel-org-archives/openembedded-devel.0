Received: from [206.190.48.174] (helo=web52411.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lucian_ion_2000@yahoo.com>) id 1MDdLT-0003xJ-6g
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 13:48:55 +0200
Received: (qmail 31647 invoked by uid 60001); 8 Jun 2009 11:39:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1244461164; bh=UAK7LzNV0Q1SZ105FHKo9nVpZYFc0GuFcgKDaZYcMN8=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=ZvOVS3422+rGH4X5JAp3kfnhRmjEHRA3mhdblHVdd8RCMHxYtylYf7tFqSWFSPF43gUucJ37IPlIlu633DNOJhjOAtj5v1vTctV/ZfUxfd3x1sYVpE+67wcPpWZZJj0Kwjzaz7BWpS5zuI4g0g6uuVIhxtq6wAr/Bn3/Z3y/hBY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=1lGakfgvHtHiRCbzrx8JnNk5ZVAJSedSi2NOfEiqolOjP62lr9CR+cdu9G6q/DSn58vcr0QSP+e8Ipi779ddte0ajAwfLhpFd87IYeMTYieF7oDfliFdcyNwGWp+ag9v7lM4eWNEyGG3lKo7GEsU8EFb3Ao9OBF8iVsiWal2L+w=;
Message-ID: <972133.30302.qm@web52411.mail.re2.yahoo.com>
X-YMail-OSG: 8o.du4IVM1nwityr7KJXVId5IwtJjP3Ie2qU24scB5U9hdELHOdGs_yl7SBOUH0CDkKRwAZzKCoeR20sGoyiNxLfRH0Qy21DSG9stCGXKL7Y.Q2HnCAp4zHyYKx6IfooT3.KFWHiP6UZwsHXFvA79FYEZ0hUtbNSWoQ2GyVMohceei1b.kV0CVVp9yoH.f5z5XsYhtYBzBUIsBGi3e682UeO5CCxIxxCy.f2mxOeAQMtl.dZ6w7kgD1sjQCqfUVamGjjs41Fhb1ZFv3HtsmB2n.0if518IlM7bQsYnQ07iY8ebxa4jWT_P2Jztru8fTcSAid8jQ_
Received: from [87.198.251.22] by web52411.mail.re2.yahoo.com via HTTP;
	Mon, 08 Jun 2009 04:39:24 PDT
X-Mailer: YahooMailRC/1277.43 YahooMailWebService/0.7.289.15
References: <bug-3010-13@http.bugs.openembedded.net/>
	<20090608113350.8F7061880A7@amethyst.openembedded.net>
Date: Mon, 8 Jun 2009 04:39:24 -0700 (PDT)
From: Lucian Ion <lucian_ion_2000@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090608113350.8F7061880A7@amethyst.openembedded.net>
MIME-Version: 1.0
Subject: update-apr-library-version-to-1.3.5
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
X-List-Received-Date: Mon, 08 Jun 2009 11:48:55 -0000
X-Groupsio-MsgNum: 11134
Content-Type: multipart/mixed; boundary="0-1524127941-1244461164=:30302"

--0-1524127941-1244461164=:30302
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

+[http://www.apache.org/dist/apr/apr-1.3.5.tar.bz2]=0A+md5=3D9ac9a00eaa1909=
37fdbbde7b4f03ac1e=0A+sha256=3Da33d360b70a9c7971651b3810513d7a85ca84d13ddfc=
1cb96d6cb0af76aab574=0A+=0A=0Adiff --git a/recipes/apr/apr_1.3.5.bb b/recip=
es/apr/apr_1.3.5.bb=0Anew file mode 100644=0Aindex 0000000..f77647f=0A--- /=
dev/null=0A+++ b/recipes/apr/apr_1.3.5.bb=0A@@ -0,0 +1,32 @@=0A+DESCRIPTION=
 =3D "Apache Portable Runtime (APR) library"=0A+SECTION =3D "libs"=0A+LICEN=
SE =3D "Apache License, Version 2.0"=0A+=0A+PR =3D "r4"=0A+=0A...=0A=0A=0A =
     

--0-1524127941-1244461164=:30302
Content-Type: text/x-diff; name="0007-update-apr-library-version-to-1.3.5-add-checksum.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0007-update-apr-library-version-to-1.3.5-add-checksum.patch"

RnJvbSBlOWE3ZDg0YjY3M2U2MzE5ZmMwNDAyNzEwNmZiYWE1NDM1ZmY2NWVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNpYW4gSW9uIDxsdWNpYW5faW9uXzIwMDBAeWFob28uY29t
PgpEYXRlOiBNb24sIDggSnVuIDIwMDkgMTE6NTc6MzcgKzAxMDAKU3ViamVjdDogW1BBVENIXSB1
cGRhdGUgYXByIGxpYnJhcnkgdmVyc2lvbiB0byAxLjMuNSAtIGFkZCBjaGVja3N1bQoKLS0tCiBj
b25mL2NoZWNrc3Vtcy5pbmkgfCAgICA0ICsrKysKIDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmYvY2hlY2tzdW1zLmluaSBi
L2NvbmYvY2hlY2tzdW1zLmluaQppbmRleCAwZDc3YjEzLi43NDFjOGQwIDEwMDY0NAotLS0gYS9j
b25mL2NoZWNrc3Vtcy5pbmkKKysrIGIvY29uZi9jaGVja3N1bXMuaW5pCkBAIC0xNjAyLDYgKzE2
MDIsMTAgQEAgc2hhMjU2PWJiMGM1OGVmZGQyNTJmY2FmNmYwZmYwNjY4MWQwZWJlY2JlY2JhYTM4
NjQwNDdmMzJkZWM3ZjgyZDFjNDk5NGMKIG1kNT0yMDkwYzIxZGVlNGYwZWIxNTEyNjA0MTI3ZGNk
MTU4Zgogc2hhMjU2PWQ5NWYzYjc4MzY2Yzg2MzE3MDQzMzA0ODY0YmIwOGNiODM2MzEyYzg3ZWE3
ZDE0MmE0YzAyMTU0ZTdlMGRkMzcKIAorW2h0dHA6Ly93d3cuYXBhY2hlLm9yZy9kaXN0L2Fwci9h
cHItMS4zLjUudGFyLmJ6Ml0KK21kNT05YWM5YTAwZWFhMTkwOTM3ZmRiYmRlN2I0ZjAzYWMxZQor
c2hhMjU2PWEzM2QzNjBiNzBhOWM3OTcxNjUxYjM4MTA1MTNkN2E4NWNhODRkMTNkZGZjMWNiOTZk
NmNiMGFmNzZhYWI1NzQKKwogW2h0dHA6Ly93d3cuYXBhY2hlLm9yZy9kaXN0L2Fwci9hcHItdXRp
bC0wLjkuMTIudGFyLmd6XQogbWQ1PThlOWNjNzFhMTMwM2I2N2IzMjc4ZmJlYWI5Nzk5ZjJlCiBz
aGEyNTY9NTc2OGZjYzRkMzhmYTZmODExYjBhODllMmVmNDUwZDBmNTI2ODhmZjkyNjNlNTQ4ODE5
YWRiMDk2ZmJmYzljMwotLSAKMS42LjAuNAoK

--0-1524127941-1244461164=:30302
Content-Type: text/x-diff; name="0008-update-apr-library-version-to-1.3.5-new-recipe.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0008-update-apr-library-version-to-1.3.5-new-recipe.patch"

RnJvbSA2MTkzYTI1ZTA2NWI0NGRhMGE0YjNiOGE5NWQ4ZjAwYzY0ZjNmOTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNpYW4gSW9uIDxsdWNpYW5faW9uXzIwMDBAeWFob28uY29t
PgpEYXRlOiBNb24sIDggSnVuIDIwMDkgMTE6NTk6MTYgKzAxMDAKU3ViamVjdDogW1BBVENIXSB1
cGRhdGUgYXByIGxpYnJhcnkgdmVyc2lvbiB0byAxLjMuNSAtIG5ldyByZWNpcGUKCi0tLQogcmVj
aXBlcy9hcHIvYXByXzEuMy41LmJiIHwgICAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvYXByL2Fwcl8xLjMuNS5iYgoKZGlmZiAtLWdpdCBh
L3JlY2lwZXMvYXByL2Fwcl8xLjMuNS5iYiBiL3JlY2lwZXMvYXByL2Fwcl8xLjMuNS5iYgpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5mNzc2NDdmCi0tLSAvZGV2L251bGwKKysr
IGIvcmVjaXBlcy9hcHIvYXByXzEuMy41LmJiCkBAIC0wLDAgKzEsMzIgQEAKK0RFU0NSSVBUSU9O
ID0gIkFwYWNoZSBQb3J0YWJsZSBSdW50aW1lIChBUFIpIGxpYnJhcnkiCitTRUNUSU9OID0gImxp
YnMiCitMSUNFTlNFID0gIkFwYWNoZSBMaWNlbnNlLCBWZXJzaW9uIDIuMCIKKworUFIgPSAicjQi
CisKK1NSQ19VUkkgPSAiJHtBUEFDSEVfTUlSUk9SfS9hcHIvJHtQfS50YXIuYnoyIFwKKyAgICAg
ICAgICAgZmlsZTovL2NvbmZpZ3VyZV9maXhlcy5wYXRjaDtwYXRjaD0xIFwKKyMJICAgZmlsZTov
L2NsZWFudXAucGF0Y2g7cGF0Y2g9MSBcCisgICAgICAgICAgIGZpbGU6Ly9jb25maWdmaXgucGF0
Y2g7cGF0Y2g9MSIKKworaW5oZXJpdCBhdXRvdG9vbHMgbGliX3BhY2thZ2UgYmluY29uZmlnCisK
K09FX0JJTkNPTkZJR19FWFRSQV9NQU5HTEUgPSAiIC1lICdzOmxvY2F0aW9uPXNvdXJjZTpsb2Nh
dGlvbj1pbnN0YWxsZWQ6JyIKKworZG9fY29uZmlndXJlX3ByZXBlbmQoKSB7CisJY2QgJHtTfQor
CS4vYnVpbGRjb25mCit9CisKK2RvX3N0YWdlKCkgeworCWF1dG90b29sc19zdGFnZV9hbGwKKwlp
bnN0YWxsIC1kICR7U1RBR0lOR19EQVRBRElSfS9hcHIKKwljcCAke1N9L2J1aWxkL2Fwcl9ydWxl
cy5tayAke1NUQUdJTkdfREFUQURJUn0vYXByLworCXNlZCAtaSBzLGFwcl9idWlsZGRpcj0uKixh
cHJfYnVpbGRkaXI9LGcgJHtTVEFHSU5HX0RBVEFESVJ9L2Fwci9hcHJfcnVsZXMubWsKKwlzZWQg
LWkgcyxhcHJfYnVpbGRlcnM9LiosYXByX2J1aWxkZXJzPSxnICR7U1RBR0lOR19EQVRBRElSfS9h
cHIvYXByX3J1bGVzLm1rCisJc2VkIC1pIHMsTElCVE9PTD0uKixMSUJUT09MPVwkXChTSEVMTFwp
XCAke1RBUkdFVF9QUkVGSVh9bGlidG9vbCxnICR7U1RBR0lOR19EQVRBRElSfS9hcHIvYXByX3J1
bGVzLm1rCisJc2VkIC1pIHMsXCRcKGFwcl9idWlsZGVyc1wpLCR7U1RBR0lOR19EQVRBRElSfS9h
cHIvLGcgJHtTVEFHSU5HX0RBVEFESVJ9L2Fwci9hcHJfcnVsZXMubWsKKwljcCAke1N9L2J1aWxk
L21rZGlyLnNoICR7U1RBR0lOR19EQVRBRElSfS9hcHIvCisJY3AgJHtTfS9idWlsZC9tYWtlX2V4
cG9ydHMuYXdrICR7U1RBR0lOR19EQVRBRElSfS9hcHIvCisJY3AgJHtTfS9idWlsZC9tYWtlX3Zh
cl9leHBvcnQuYXdrICR7U1RBR0lOR19EQVRBRElSfS9hcHIvCit9Ci0tIAoxLjYuMC40Cgo=

--0-1524127941-1244461164=:30302--
