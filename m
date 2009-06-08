Received: from [206.190.48.172] (helo=web52409.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lucian_ion_2000@yahoo.com>) id 1MDdOq-00041d-QT
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 13:52:25 +0200
Received: (qmail 20391 invoked by uid 60001); 8 Jun 2009 11:42:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1244461374; bh=NvPdk7NgjgAX8zaHdP3CKZ1wBbpg6oRzxIGJ9P7fWHA=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=4c3Uyx8/b6BHGaCIkXqLnOyqxehiavYxGdmd9AhSL+2v2etyggfTRQPHTCxz5dunb1ejFTlRCl8PfyrV60LtGMRjo/FKxeWnizB27RsPcG4EIq6RQz5nj9Ns5824rT4sGBe8esUIeBidcHo5NSc430JY5NixSC43z46bTZMmSUE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=0yBwCFX6gX5kM960iJm0S8qBUJrtV4ahhFVX44FZi9l9g1+UscT4ht5PVzJA/GXCcmmBrcZHbnxXoai0BYA6iFsCNCD1TBn3b7m39lpDgy9YGqk56QU5h3E1Bo+DhSgHpsvmWZ/9G7MPLK4g7ne4lmSeLUASbRRSwlUQlYkAmjQ=;
Message-ID: <622079.19927.qm@web52409.mail.re2.yahoo.com>
X-YMail-OSG: Y2T4mUwVM1mhWx83uIzC9IqUHPB7w6rMm4ufHSZFnn0hvNZX7b0nCDrv0YfCELNaqNE5FyA411iRcZwjwfCef4WeMBSOt2BSSKTTo9yGJ24G1MnxndiYGsRQH31yqJUSBYCEoAwASvTOcvQpjtSGaCEYbKGYjlAhdORDYPOV8wsBYzPiYpVRXmUgOl8FuZ1yofYAIpqWtHlxV9S6Oh6ETBR5vOZlsZN3uUi7feGzvxsnzbFPn8tfR.uBMhVdG6I28zJ26XfqfPn901b_vojTAsA_E2_obbszvZj_LO3NoTyURnDKnjpw2UBUbr12WQp3dDrP._ZIvR052caEyD1UuavzX5W6NEZF.K1Waw--
Received: from [87.198.251.22] by web52409.mail.re2.yahoo.com via HTTP;
	Mon, 08 Jun 2009 04:42:54 PDT
X-Mailer: YahooMailRC/1277.43 YahooMailWebService/0.7.289.15
References: <bug-3010-13@http.bugs.openembedded.net/>
	<20090608113350.8F7061880A7@amethyst.openembedded.net>
Date: Mon, 8 Jun 2009 04:42:54 -0700 (PDT)
From: Lucian Ion <lucian_ion_2000@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090608113350.8F7061880A7@amethyst.openembedded.net>
MIME-Version: 1.0
Subject: update apr util library to version 1.3.7
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
X-List-Received-Date: Mon, 08 Jun 2009 11:52:25 -0000
X-Groupsio-MsgNum: 11135
Content-Type: multipart/mixed; boundary="0-1529672844-1244461374=:19927"

--0-1529672844-1244461374=:19927
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=0A+[http://www.apache.org/dist/apr/apr-util-1.3.7.tar.gz]=0A+md5=3D0a6802e=
f6d874db645150ae4a75f41fa=0A+sha256=3Dfadd6a0c55596b2c21375942e3acefc33715e=
647ed4770dc398d08d8783a39e0=0A+=0A=0Adiff --git a/recipes/apr/apr-util_1.3.=
7.bb b/recipes/apr/apr-util_1.3.7.bb=0Anew file mode 100644=0Aindex 0000000=
..6b2e9cc=0A--- /dev/null=0A+++ b/recipes/apr/apr-util_1.3.7.bb=0A@@ -0,0 +=
1,34 @@=0A+DESCRIPTION =3D "Apache Portable Runtime (APR) companion library=
"=0A+SECTION =3D "libs"=0A+DEPENDS =3D "apr expat gdbm"=0A+LICENSE =3D "Apa=
che License, Version 2.0"=0A+=0A...=0A=0ARegards,=0ALucian Ion=0A=0A=0A    =
  

--0-1529672844-1244461374=:19927
Content-Type: text/x-diff; name="0009-apr-util-update-to-version-1.3.7-add-checksum.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0009-apr-util-update-to-version-1.3.7-add-checksum.patch"

RnJvbSBhNDQ4NDY1ZDlmZjZkMDZmZmNkMzk2MzRiOTBlNWIyMWUxZGM2MGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNpYW4gSW9uIDxsdWNpYW5faW9uXzIwMDBAeWFob28uY29t
PgpEYXRlOiBNb24sIDggSnVuIDIwMDkgMTI6MTM6MDcgKzAxMDAKU3ViamVjdDogW1BBVENIXSBh
cHItdXRpbCB1cGRhdGUgdG8gdmVyc2lvbiAxLjMuNyAtIGFkZCBjaGVja3N1bQoKLS0tCiBjb25m
L2NoZWNrc3Vtcy5pbmkgfCAgICA0ICsrKysKIDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmYvY2hlY2tzdW1zLmluaSBiL2Nv
bmYvY2hlY2tzdW1zLmluaQppbmRleCA3NDFjOGQwLi4xNWE3YjEwIDEwMDY0NAotLS0gYS9jb25m
L2NoZWNrc3Vtcy5pbmkKKysrIGIvY29uZi9jaGVja3N1bXMuaW5pCkBAIC0xNjIyLDYgKzE2MjIs
MTAgQEAgc2hhMjU2PThjZDg0ZWIyMDMxYTkxNTcyZTFiZTI5NzVmNDE3MTczMGE5YmU3MmM0Y2Q4
ODcxOGM0YzQwYWM3ZGM0ZmQ3ZDMKIG1kNT1hMTBlMmNhMTUwZmYwN2Y0ODRjNzI0YzM2MTQyMjEx
Zgogc2hhMjU2PTNmMDdmZmRiMThmYjg1MzI5MGM5YjgzZTgyY2Q1Y2FlNjZiOGZiYzM1N2JkMzkx
ZTg0NmMwYWZkZDI0ZmVkN2UKIAorW2h0dHA6Ly93d3cuYXBhY2hlLm9yZy9kaXN0L2Fwci9hcHIt
dXRpbC0xLjMuNy50YXIuZ3pdCittZDU9MGE2ODAyZWY2ZDg3NGRiNjQ1MTUwYWU0YTc1ZjQxZmEK
K3NoYTI1Nj1mYWRkNmEwYzU1NTk2YjJjMjEzNzU5NDJlM2FjZWZjMzM3MTVlNjQ3ZWQ0NzcwZGMz
OThkMDhkODc4M2EzOWUwCisKIFtmdHA6Ly9mdHAuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWlu
L2EvYXB0L2FwdF8wLjUuMjguNi50YXIuZ3pdCiBtZDU9MjZiMzc1MjUzNzFjZGFhZWM1NTIyMzdl
MDY2NzMwNWQKIHNoYTI1Nj01N2RlMDg0ODYwODcwY2NjZjUxMGRlNjJlYjhkZWQyNTJmNTk1MWE2
ZTU5ZTM0YTk2M2Q2MWQ2OWRlM2FmZjEwCi0tIAoxLjYuMC40Cgo=

--0-1529672844-1244461374=:19927
Content-Type: text/x-diff; name="0010-apr-util-update-to-version-1.3.7-new-recipe.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0010-apr-util-update-to-version-1.3.7-new-recipe.patch"

RnJvbSBkZThhNzc1YWFjNWRkYTI5OTdjYjhjMTMyMDcwYjEyY2IyZTEzZGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNpYW4gSW9uIDxsdWNpYW5faW9uXzIwMDBAeWFob28uY29t
PgpEYXRlOiBNb24sIDggSnVuIDIwMDkgMTI6MTQ6MjEgKzAxMDAKU3ViamVjdDogW1BBVENIXSBh
cHItdXRpbCB1cGRhdGUgdG8gdmVyc2lvbiAxLjMuNyAtIG5ldyByZWNpcGUKCi0tLQogcmVjaXBl
cy9hcHIvYXByLXV0aWxfMS4zLjcuYmIgfCAgIDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL2Fwci9hcHItdXRpbF8xLjMuNy5iYgoKZGlm
ZiAtLWdpdCBhL3JlY2lwZXMvYXByL2Fwci11dGlsXzEuMy43LmJiIGIvcmVjaXBlcy9hcHIvYXBy
LXV0aWxfMS4zLjcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNmIyZTlj
YwotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvYXByL2Fwci11dGlsXzEuMy43LmJiCkBAIC0w
LDAgKzEsMzQgQEAKK0RFU0NSSVBUSU9OID0gIkFwYWNoZSBQb3J0YWJsZSBSdW50aW1lIChBUFIp
IGNvbXBhbmlvbiBsaWJyYXJ5IgorU0VDVElPTiA9ICJsaWJzIgorREVQRU5EUyA9ICJhcHIgZXhw
YXQgZ2RibSIKK0xJQ0VOU0UgPSAiQXBhY2hlIExpY2Vuc2UsIFZlcnNpb24gMi4wIgorCitQUiA9
ICJyNSIKKworU1JDX1VSSSA9ICIke0FQQUNIRV9NSVJST1J9L2Fwci8ke1B9LnRhci5neiBcCisg
ICAgICAgICAgIGZpbGU6Ly9jb25maWdmaXgucGF0Y2g7cGF0Y2g9MSBcCisgICAgICAgICAgIGZp
bGU6Ly9jb25maWd1cmVfZml4ZXMucGF0Y2g7cGF0Y2g9MSIKKworRVhUUkFfT0VDT05GID0gIi0t
d2l0aC1hcHI9JHtTVEFHSU5HX0JJTkRJUl9DUk9TU30vYXByLTEtY29uZmlnIFwgCisJCS0td2l0
aC1kYm09Z2RibSBcCisJCS0td2l0aC1nZGJtPSR7U1RBR0lOR19ESVJfSE9TVH0ke2xheW91dF9w
cmVmaXh9IFwKKwkJLS13aXRob3V0LXNxbGl0ZTIgXAorCQktLXdpdGhvdXQtc3FsaXRlMyBcCisJ
CS0td2l0aC1leHBhdD0ke1NUQUdJTkdfRElSX0hPU1R9JHtsYXlvdXRfcHJlZml4fSIKKworCitp
bmhlcml0IGF1dG90b29sc19zdGFnZSBsaWJfcGFja2FnZSBiaW5jb25maWcKKworT0VfQklOQ09O
RklHX0VYVFJBX01BTkdMRSA9ICIgLWUgJ3M6bG9jYXRpb249c291cmNlOmxvY2F0aW9uPWluc3Rh
bGxlZDonIgorCitkb19jb25maWd1cmVfcHJlcGVuZCgpIHsKKwljcCAke1NUQUdJTkdfREFUQURJ
Un0vYXByL2Fwcl9ydWxlcy5tayAke1N9L2J1aWxkL3J1bGVzLm1rCisJZWNobyAiQUNfUFJPR19M
SUJUT09MIiA+PiAke1N9L2NvbmZpZ3VyZS5pbgorfQorCitkb19jb25maWd1cmVfYXBwZW5kKCkg
eworCXNlZCAtaSAtZSAgczphcHJfYnVpbGRlcnM9L3Vzci9zaGFyZS9idWlsZC0xOmFwcl9idWls
ZGVycz0ke1NUQUdJTkdfREFUQURJUn0vYnVpbGQtMTpnICR7U30vYnVpbGQvcnVsZXMubWsKKwlz
ZWQgLWkgL15MSUJUT09ML2QgJHtTfS9idWlsZC9ydWxlcy5taworCWVjaG8gTElCVE9PTD0iJHtT
VEFHSU5HX0JJTkRJUl9OQVRJVkV9LyR7VEFSR0VUX1BSRUZJWH1saWJ0b29sIC0tdGFnPUNDIiA+
PiAke1N9L2J1aWxkL3J1bGVzLm1rCit9CisKLS0gCjEuNi4wLjQKCg==

--0-1529672844-1244461374=:19927--
