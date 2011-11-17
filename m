Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RR4jm-0002IF-QW
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Nov 2011 17:22:55 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAHGGQ3s022340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 10:16:28 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAHGGPAN027335
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 21:46:26 +0530 (IST)
Received: from DBDE01.ent.ti.com ([fe80::d5df:c4b5:9919:4e10]) by
	DBDE70.ent.ti.com ([fe80::2141:513f:409:315a%21]) with mapi id
	14.01.0323.003; Thu, 17 Nov 2011 21:46:25 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Patches to add support for TI Linux Graphics SDK release
	04.04.00.02 : Patch3-Fix for library linking issue with Graphics SDK
	Release 04.04.00.02
Thread-Index: AcyIzd2+N3qNHV6OQ0qpVEOJ0yRTEAcRz4/Q///r4wD//5JzgP//I+eg//5FzTD//IqtYA==
Date: Thu, 17 Nov 2011 16:16:24 +0000
Message-ID: <C2C4AB609E1BCF4689C1782E8F42E30A027B48@DBDE01.ent.ti.com>
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
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02 : Patch3-Fix for library linking issue with Graphics SDK Release 04.04.00.02
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
X-List-Received-Date: Thu, 17 Nov 2011 16:22:56 -0000
X-Groupsio-MsgNum: 35428
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_C2C4AB609E1BCF4689C1782E8F42E30A027B48DBDE01entticom_"

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B48DBDE01entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached is the patch for fixing the library linking issue observed with gr=
aphics SDK release 04.04.00.02.

Thanks,
Prathap.

-----Original Message-----
From: Srinivas, Prathap=20
Sent: Thursday, November 17, 2011 9:43 PM
To: 'openembedded-devel@lists.openembedded.org'
Subject: RE: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02 : Patch2-Graphics SDK release 04.04.00.02 build support

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

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B48DBDE01entticom_
Content-Type: application/octet-stream;
	name="0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch"
Content-Description: 0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch
Content-Disposition: attachment;
	filename="0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch";
	size=2351; creation-date="Thu, 17 Nov 2011 10:38:43 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwZmRhMGE5MTdmNzkxODg3N2Q2YzFhMTRlOTM1MTA4MTdjNGJmMGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNTozNTowOCArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMy8zXSBs
aWJnbGVzLW9tYXAzLmluYyA6IEZpeCBmb3IgbGlicmFyeSBsaW5raW5nIGlzc3N1ZSB3aXRoIGdy
YXBoaWNzIFNESwoKKiBUaGlzIGlzIHRoZSBmaXggZm9yIHRoZSBpc3N1ZSBzZWVuIHdpdGggb3Br
ZyBpbnN0YWxsIG9mIGxpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi1yMTYuNl9hcm12N2EuaXBrIG9u
IHRhcmdldC4KKiBXaXRoIEdyYXBoaWNzIFNESyByZWxlYXNlIDA0LjA0LjAwLjAyIG9ud2FyZHMs
IHRoZXJlIGFyZSAyIHZlcnNpb25zIG9mIHRoZSBsaWJyYXJ5IGxpYnNydl91bS5zbyAtIG9uZSBp
cyBsaWJzcnZfdW0uc28gYW5kIG90aGVyIGlzIGxpYnNydl91bV9kcmkuc28gKEZvciBYb3JnIGRy
aXZlcikuSW4gcHJlc2VuY2Ugb2YgbGlic3J2X3VtX2RyaS5zbyAsIHRoZSBsaW5rcyBjcmVhdGVk
IHVuZGVyIC91c3IvbGliIHdlcmUgYWxsIGJ5IGRlZmF1bHQgbGlua2luZyB0byBsaWJzcnZfdW1f
ZHJpLnNvIG9ubHkuIER1ZSB0byB0aGlzIDNEIGRlbW9zIHdlcmUgZmFpbGluZy4KKiBUaGlzIGZp
eCBtYWtlcyBzdXJlIHRoYXQgb25seSBvbmUgYXBwcm9wcmlhdGUgdmVyc2lvbiBvZiB0aGUgbGli
cmFyeSBsaWJzcnZfdW0uc28gaXMgcHJlc2VudCBvbiB0YXJnZXQgYW5kIGhlbmNlIGxpbmtzIGNy
ZWF0ZWQgd2lsbCBub3cgYmUgcHJvcGVyLgoKU2lnbmVkLW9mZi1ieTogUHJhdGhhcCBNIFMgPG1z
cHJhdGhhcEB0aS5jb20+Ci0tLQogcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMgfCAgIDEyICsrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvcG93ZXJ2ci1kcml2ZXJz
L2xpYmdsZXMtb21hcDMuaW5jIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMKaW5kZXggZjZiOTRiMC4uMTE5Zjc0YyAxMDA2NDQKLS0tIGEvcmVjaXBlcy9wb3dlcnZy
LWRyaXZlcnMvbGliZ2xlcy1vbWFwMy5pbmMKKysrIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMv
bGliZ2xlcy1vbWFwMy5pbmMKQEAgLTM4LDYgKzM4LDE4IEBAIGRvX2NvbmZpZ3VyZSgpIHsKIAkJ
Y2htb2QgMDY0NCAkaQogCWRvbmUgCiAKKwkjIFRoZSBiZWxvdyBmb3IgbG9vcCBpcyB0aGUgZml4
IGZvciB0aGUgaXNzdWUgc2VlbiB3aXRoIG9wa2cgaW5zdGFsbCBvZiBsaWJnbGVzLW9tYXAzXzQu
MDQuMDAuMDItcjE2LjZfYXJtdjdhLmlwayBvbiB0YXJnZXQuIAorCSMgV2l0aCBHcmFwaGljcyBT
REsgcmVsZWFzZSAwNC4wNC4wMC4wMiwgdGhlcmUgYXJlIDIgdmVyc2lvbnMgb2YgdGhlIGxpYnJh
cnkgbGlic3J2X3VtLnNvIC0gb25lIGlzIGxpYnNydl91bS5zbyBhbmQgb3RoZXIgaXMgbGlic3J2
X3VtX2RyaS5zbyAoRm9yIFhvcmcgZHJpdmVyKS4gCisJIyBJbiBwcmVzZW5jZSBvZiBsaWJzcnZf
dW1fZHJpLnNvICwgdGhlIGxpbmtzIGNyZWF0ZWQgdW5kZXIgL3Vzci9saWIgd2VyZSBhbGwgYnkg
ZGVmYXVsdCBsaW5raW5nIHRvIGxpYnNydl91bV9kcmkuc28gb25seS4gRHVlIHRvIHRoaXMgM0Qg
ZGVtb3Mgd2VyZSBmYWlsaW5nLiAKKwkjIE5vdyB0aGlzIGZpeCBtYWtlcyBzdXJlIHRoYXQgb25s
eSBvbmUgYXBwcm9wcmlhdGUgdmVyc2lvbiBvZiB0aGUgbGlicmFyeSBsaWJzcnZfdW0uc28gaXMg
cHJlc2VudCBvbiB0YXJnZXQgYW5kIGhlbmNlIGxpbmtzIGNyZWF0ZWQgd2lsbCBub3cgYmUgcHJv
cGVyLgorCisJZm9yIGRyaWZpbGUgaW4gJChmaW5kICR7U30gLW5hbWUgImxpYnNydl91bV9kcmku
c28iKTsgZG8KKwkJaWYgWyAiJGRyaWZpbGUiICE9ICIiIF0gOyB0aGVuCisJCQlkaXI9JChkaXJu
YW1lICR7ZHJpZmlsZX0pCisJCQlybSAtcmYgJHtkaXJ9L2xpYnNydl91bV9kcmkuc28KKwkJZmkK
Kwlkb25lCisKIAkjIEF0dGVtcHQgdG8gY3JlYXRlIHByb3BlciBsaWJyYXJ5IHNvZnRsaW5rcwog
CWZvciBzb2ZpbGUgaW4gJChmaW5kICR7U30gLW5hbWUgImxpYipPcGVuKi5zbyIpICQoZmluZCAk
e1N9IC1uYW1lICJsaWIqc3J2Ki5zbyIpICQoZmluZCAke1N9IC1uYW1lICJsaWIqZ2wqLnNvIikg
JChmaW5kICR7U30gLW5hbWUgImxpYnB2ciouc28iKSAkKGZpbmQgJHtTfSAtbmFtZSAibGliKkdM
Ki5zbyIpOyBkbwogCQlpZiBbICIkKHJlYWRsaW5rIC1uICR7c29maWxlfSkiID0gIiIgXSA7IHRo
ZW4KLS0gCjEuNy4xCgo=

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B48DBDE01entticom_--
