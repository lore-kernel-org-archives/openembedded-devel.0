Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RR4gO-00028P-81
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Nov 2011 17:19:25 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAHGCvp9007139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 10:12:59 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAHGCv9Y026892
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 21:42:57 +0530 (IST)
Received: from DBDE01.ent.ti.com ([fe80::d5df:c4b5:9919:4e10]) by
	DBDE71.ent.ti.com ([fe80::692c:15fd:9507:b54%21]) with mapi id
	14.01.0323.003; Thu, 17 Nov 2011 21:42:56 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Patches to add support for TI Linux Graphics SDK release
	04.04.00.02 : Patch2-Graphics SDK release 04.04.00.02 build support
Thread-Index: AcyIzd2+N3qNHV6OQ0qpVEOJ0yRTEAcRz4/Q///r4wD//5JzgP//I+eg//5FzTA=
Date: Thu, 17 Nov 2011 16:12:55 +0000
Message-ID: <C2C4AB609E1BCF4689C1782E8F42E30A027B2C@DBDE01.ent.ti.com>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
	<j73pg0$knr$1@dough.gmane.org>
	<5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
	<j73rr4$5ar$1@dough.gmane.org>
	<C2C4AB609E1BCF4689C1782E8F42E30A0279FE@DBDE01.ent.ti.com>
	<ja37bn$roq$1@dough.gmane.org>
	<C2C4AB609E1BCF4689C1782E8F42E30A027AF8@DBDE01.ent.ti.com> 
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.133.21]
MIME-Version: 1.0
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02 : Patch2-Graphics SDK release 04.04.00.02 build support
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
X-List-Received-Date: Thu, 17 Nov 2011 16:19:25 -0000
X-Groupsio-MsgNum: 35427
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_C2C4AB609E1BCF4689C1782E8F42E30A027B2CDBDE01entticom_"

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B2CDBDE01entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached is the patch to add support for TI Linux Graphics SDK release 04.0=
4.00.02.

Thanks,
Prathap.

-----Original Message-----
From: Srinivas, Prathap=20
Sent: Thursday, November 17, 2011 9:40 PM
To: 'openembedded-devel@lists.openembedded.org'
Subject: RE: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02 : Patch1-kernel.bbclass update

Attached is the patch for updating kernel.bbclass to stage additional direc=
tories required for Graphics SDK 04.04.00.02 build.

Thanks,
Prathap.

-----Original Message-----
From: Srinivas, Prathap=20
Sent: Thursday, November 17, 2011 9:31 PM
To: openembedded-devel@lists.openembedded.org
Subject: RE: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02

Patch 2 is dependant on Patch 1 and Patch 3 is dependant on Patch 2.
Anyways, as suggested I will send them separately.

Thanks,
Prathap.


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Thursday, November 17, 2011 8:27 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-11-11 11:43, Srinivas, Prathap schreef:
> The comments provided have been addressed. Please find the updated
> patches attached.

Please send them as seperate patches so that patchwork will pick them up an=
d
people can review them better.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7FILgACgkQMkyGM64RGpFoJwCgl3zvY6qDGZK7b/6vIMevNhbp
7kMAn2A9gRnB2Lth+lSYz5vmyfrve+A2
=3D5YBy
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B2CDBDE01entticom_
Content-Type: application/octet-stream;
	name="0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch"
Content-Description: 0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch
Content-Disposition: attachment;
	filename="0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch";
	size=4903; creation-date="Thu, 17 Nov 2011 10:38:44 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhZGI0NzVmMzg5NDEyZmUxOTNhNjU0ZWMwMDhhZTQ5ZmQ3YjllYmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNDozMDo1OSArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMi8zXSBs
aWJnbGVzLW9tYXAzXzQuMDQuMDAuMDI6IGFkZGVkIHN1cHBvcnQgZm9yIGdyYXBoaWNzIHNkayAw
NC4wNC4wMC4wMgoKKiBBZGRlZCBzdXBwb3J0IGZvciBzZ3ggZGRrIDEuNi4xNi40MTE3CiogQWRk
ZWQgcG93ZXJ2ci5pbmMgdG8gaW5jbHVkZSB2YXJpYWJsZXMgY29tbW9uIHRvIGdyYXBoaWNzIFNE
SyByZWNpcGVzCiogQnVtcGVkIHVwIHRoZSBQUiBpbiBsaWJnbGVzLW9tYXAzLmluYwoKU2lnbmVk
LW9mZi1ieTogUHJhdGhhcCBNIFMgPG1zcHJhdGhhcEB0aS5jb20+Ci0tLQogcmVjaXBlcy9wb3dl
cnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFwMy5pbmMgICAgICAgICAgfCAgICA0ICsrLQogLi4uL3Bv
d2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzXzQuMDQuMDAuMDIuYmIgICAgfCAgIDIxICsrKysr
KysrKysrCiAuLi4vb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQxMTcuYmIgICAgICAgICAgICAg
ICB8ICAgMzkgKysrKysrKysrKysrKysrKysrKysKIHJlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bv
d2VydnIuaW5jICAgICAgICAgICAgICAgIHwgICAgNiArKysKIDQgZmlsZXMgY2hhbmdlZCwgNjkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
L3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzXzQuMDQuMDAuMDIuYmIKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCByZWNpcGVzL3Bvd2VydnItZHJpdmVycy9vbWFwMy1zZ3gtbW9kdWxlc18xLjYuMTYu
NDExNy5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bvd2Vy
dnIuaW5jCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzLmluYwppbmRleCAz
NmMzMTFkLi5mNmI5NGIwIDEwMDY0NAotLS0gYS9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJn
bGVzLW9tYXAzLmluYworKysgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAz
LmluYwpAQCAtMSw3ICsxLDcgQEAKIERFU0NSSVBUSU9OID0gImxpYkdMRVMgZm9yIHRoZSBvbWFw
MyIKIExJQ0VOU0UgPSAicHJvcHJpZXRhcnktYmluYXJ5IgogCi1QUiA9ICJyMTUiCitQUiA9ICJy
MTYiCiAKIENPTVBBVElCTEVfTUFDSElORSA9ICIob21hcDN8dGk4MTZ4KSIKIApAQCAtMjIsNiAr
MjIsOCBAQCBTID0gIiR7V09SS0RJUn0vT01BUDM1eF9HcmFwaGljc19TREtfJHtTR1hQVn0iCiBU
SV9CSU5fVU5QS19DTURTPSJZOiBxWTp3b3JrZGlyOlkiCiByZXF1aXJlIC4uL3RpL3RpLWV1bGEt
dW5wYWNrLmluYwogCitCSU5MT0NBVElPTl9vbWFwMyAgPSAiJHtTfS9nZnhfcmVsX2VzMy54Igor
QklOTE9DQVRJT05fdGk4MTZ4ID0gIiR7U30vZ2Z4X3JlbF9lczYueCIKIEJJTkxPQ0FUSU9OID89
ICIke1N9L2dmeF9yZWwiCiBFUzJMT0NBVElPTiA/PSAiJHtTfS9nZnhfcmVsX2VzMi54IgogRVMz
TE9DQVRJT04gPz0gIiR7U30vZ2Z4X3JlbF9lczMueCIKZGlmZiAtLWdpdCBhL3JlY2lwZXMvcG93
ZXJ2ci1kcml2ZXJzL2xpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi5iYiBiL3JlY2lwZXMvcG93ZXJ2
ci1kcml2ZXJzL2xpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwLi5lOTVhNWQ4Ci0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9wb3dl
cnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFwM180LjA0LjAwLjAyLmJiCkBAIC0wLDAgKzEsMjEgQEAK
K3JlcXVpcmUgbGliZ2xlcy1vbWFwMy5pbmMKKworIyBkb3dubG9hZCByZXF1aXJlZCBiaW5hcnkg
ZGlzdHJpYnV0aW9uIGZyb206CisjIGh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9kc3Bz
X3B1YmxpY19zdy9zZG9fc2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvbGF0ZXN0L2luZGV4X0ZEUy5o
dG1sCisjIHNlZSBsaWJnbGVzLW9tYXAzLmluYyBmb3IgZGV0YWlsZWQgaW5zdGFsbGF0aW9uIGlu
c3RydWN0aW9ucworCitTR1hQViA9ICI0XzA0XzAwXzAyIgorSU1HUFYgPSAiMS42LjE2LjQxMTci
CitCSU5GSUxFIDo9ICJHcmFwaGljc19TREtfc2V0dXBsaW51eF8ke1NHWFBWfS5iaW4iCisKK1NS
Q19VUkkgPSAiaHR0cDovL3NvZnR3YXJlLWRsLnRpLmNvbS9kc3BzL2RzcHNfcHVibGljX3N3L3Nk
b19zYi90YXJnZXRjb250ZW50L2dmeHNkay8ke1NHWFBWfS9leHBvcnRzL0dyYXBoaWNzX1NES19z
ZXR1cGxpbnV4XyR7U0dYUFZ9LmJpbiBcCisgICAgICAgICAgICAgICAgICAgZmlsZTovL2NwdXR5
cGUgXAorICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yYy5wdnIgXAorICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zYW1wbGUuZGVza3RvcCBcCisgICAgICAgICAgICAgICAgICAgZmlsZTovLzk5
LWJ1ZmZlcmNsYXNzLnJ1bGVzICBcCisiCitTUkNfVVJJW21kNXN1bV0gPSAiOTAxMzI3NzY1YzA5
OTE5MDBhZmRhOTE0NzNmODQ3MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmNlZDIzMjllYzgx
OWU0MmQ1N2VjYTFhMTExMjBiMDJlYzljMzMyZmI2M2JhYTBhNDEyODVlZWQwN2Q0YjQ4ZSIKKwor
UyA9ICIke1dPUktESVJ9L0dyYXBoaWNzX1NES18ke1NHWFBWfSIKKwpkaWZmIC0tZ2l0IGEvcmVj
aXBlcy9wb3dlcnZyLWRyaXZlcnMvb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQxMTcuYmIgYi9y
ZWNpcGVzL3Bvd2VydnItZHJpdmVycy9vbWFwMy1zZ3gtbW9kdWxlc18xLjYuMTYuNDExNy5iYgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi40YzE5MzY4Ci0tLSAvZGV2L251bGwK
KysrIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQx
MTcuYmIKQEAgLTAsMCArMSwzOSBAQAorREVTQ1JJUFRJT04gPSAiS2VybmVsIGRyaXZlcnMgZm9y
IHRoZSBQb3dlclZSIFNHWCBjaGlwc2V0IGZvdW5kIGluIHRoZSBvbWFwMyBTb0NzIgorTElDRU5T
RSA9ICJHUEx2MiIKKworIyBkb3dubG9hZCByZXF1aXJlZCBiaW5hcnkgZGlzdHJpYnV0aW9uIGZy
b206CisjIGh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9kc3BzX3B1YmxpY19zdy9zZG9f
c2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvbGF0ZXN0L2luZGV4X0ZEUy5odG1sCisjIHNlZSBsaWJn
bGVzLW9tYXAzLmluYyBmb3IgZGV0YWlsZWQgaW5zdGFsbGF0aW9uIGluc3RydWN0aW9ucworCitU
SV9CSU5fVU5QS19DTURTPSJZOiBxWTp3b3JrZGlyOlkiCityZXF1aXJlIC4uL3RpL3RpLWV1bGEt
dW5wYWNrLmluYworcmVxdWlyZSBwb3dlcnZyLmluYworCitTR1hQViA9ICI0XzA0XzAwXzAyIgor
SU1HUFYgPSAiMS42LjE2LjQxMTciCitCSU5GSUxFIDo9ICJHcmFwaGljc19TREtfc2V0dXBsaW51
eF8ke1NHWFBWfS5iaW4iCisKK2luaGVyaXQgbW9kdWxlCisKK01BQ0hJTkVfS0VSTkVMX1BSX2Fw
cGVuZCA9ICJhIgorCitTUkNfVVJJID0gImh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9k
c3BzX3B1YmxpY19zdy9zZG9fc2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvJHtTR1hQVn0vZXhwb3J0
cy9HcmFwaGljc19TREtfc2V0dXBsaW51eF8ke1NHWFBWfS5iaW4gXAorICAgICAgICAgICBmaWxl
Oi8vQ29tcGlsZS1maXhlcy1mb3ItMzgta2VybmVsLnBhdGNoIFwKKyAgICAgICAgICAiCitTUkNf
VVJJW21kNXN1bV0gPSAiOTAxMzI3NzY1YzA5OTE5MDBhZmRhOTE0NzNmODQ3MjUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmNlZDIzMjllYzgxOWU0MmQ1N2VjYTFhMTExMjBiMDJlYzljMzMyZmI2
M2JhYTBhNDEyODVlZWQwN2Q0YjQ4ZSIKKworUyA9ICIke1dPUktESVJ9L0dyYXBoaWNzX1NES18k
e1NHWFBWfS9HRlhfTGludXhfS00iCisKK1BWUkJVSUxEID0gInJlbGVhc2UiCisKK1BBQ0tBR0Vf
U1RSSVAgPSAibm8iCisKK01BS0VfVEFSR0VUUyA9ICIgQlVJTEQ9JHtQVlJCVUlMRH0gVElfUExB
VEZPUk09JHtUSV9QTEFURk9STX0iCisKK2RvX2luc3RhbGwoKSB7CisJbWtkaXIgLXAgJHtEfS9s
aWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9OfS9rZXJuZWwvZHJpdmVycy9ncHUvcHZyCisJY3Ag
JHtTfS9wdnJzcnZrbS5rbyAke0R9L2xpYi9tb2R1bGVzLyR7S0VSTkVMX1ZFUlNJT059L2tlcm5l
bC9kcml2ZXJzL2dwdS9wdnIKKwljcCAke1N9L3NlcnZpY2VzNC8zcmRwYXJ0eS8ke01PRFVMRVNM
T0NBVElPTn0vb21hcGxmYi5rbyAgJHtEfS9saWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9OfS9r
ZXJuZWwvZHJpdmVycy9ncHUvcHZyCisJY3AgJHtTfS9zZXJ2aWNlczQvM3JkcGFydHkvYnVmZmVy
Y2xhc3NfdGkvYnVmZmVyY2xhc3NfdGkua28gJHtEfS9saWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJT
SU9OfS9rZXJuZWwvZHJpdmVycy9ncHUvcHZyCit9CmRpZmYgLS1naXQgYS9yZWNpcGVzL3Bvd2Vy
dnItZHJpdmVycy9wb3dlcnZyLmluYyBiL3JlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bvd2VydnIu
aW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjVjNjM3OWEKLS0tIC9kZXYv
bnVsbAorKysgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9wb3dlcnZyLmluYwpAQCAtMCwwICsx
LDYgQEAKK1RJX1BMQVRGT1JNX29tYXAzID0gIm9tYXAzNjMwIgorVElfUExBVEZPUk1fdGk4MTZ4
ID0gInRpODF4eCIKKworTU9EVUxFU0xPQ0FUSU9OX29tYXAzID0gImRjX29tYXBmYjNfbGludXgi
CitNT0RVTEVTTE9DQVRJT05fdGk4MTZ4ID0gImRjX3RpODF4eF9saW51eCIKKwotLSAKMS43LjEK
Cg==

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B2CDBDE01entticom_--
