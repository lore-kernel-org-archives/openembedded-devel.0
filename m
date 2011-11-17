Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RR4dA-0001z5-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Nov 2011 17:16:04 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAHG9XQg017593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 10:09:35 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAHG9X17026311
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 21:39:33 +0530 (IST)
Received: from DBDE01.ent.ti.com ([fe80::d5df:c4b5:9919:4e10]) by
	DBDE70.ent.ti.com ([fe80::2141:513f:409:315a%21]) with mapi id
	14.01.0323.003; Thu, 17 Nov 2011 21:39:33 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Patches to add support for TI Linux Graphics SDK release
	04.04.00.02 : Patch1-kernel.bbclass update
Thread-Index: AcyIzd2+N3qNHV6OQ0qpVEOJ0yRTEAcRz4/Q///r4wD//5JzgP//I+eg
Date: Thu, 17 Nov 2011 16:09:32 +0000
Message-ID: <C2C4AB609E1BCF4689C1782E8F42E30A027B15@DBDE01.ent.ti.com>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
	<j73pg0$knr$1@dough.gmane.org>
	<5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
	<j73rr4$5ar$1@dough.gmane.org>
	<C2C4AB609E1BCF4689C1782E8F42E30A0279FE@DBDE01.ent.ti.com>
	<ja37bn$roq$1@dough.gmane.org>
	<C2C4AB609E1BCF4689C1782E8F42E30A027AF8@DBDE01.ent.ti.com>
In-Reply-To: <C2C4AB609E1BCF4689C1782E8F42E30A027AF8@DBDE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.133.21]
MIME-Version: 1.0
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02 : Patch1-kernel.bbclass update
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
X-List-Received-Date: Thu, 17 Nov 2011 16:16:05 -0000
X-Groupsio-MsgNum: 35426
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_C2C4AB609E1BCF4689C1782E8F42E30A027B15DBDE01entticom_"

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B15DBDE01entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B15DBDE01entticom_
Content-Type: application/octet-stream;
	name="0001-kernel.bbclass-stage-additional-directories.patch"
Content-Description: 0001-kernel.bbclass-stage-additional-directories.patch
Content-Disposition: attachment;
	filename="0001-kernel.bbclass-stage-additional-directories.patch"; size=1384;
	creation-date="Thu, 17 Nov 2011 10:38:44 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhOTgzNmVlNmE4ZjQzMzI0NWNmYTc0NmQ3YzdhNDU0N2EzMTFjYjU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNDoyMjozNSArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMS8zXSBr
ZXJuZWwuYmJjbGFzczogc3RhZ2UgYWRkaXRpb25hbCBkaXJlY3RvcmllcwoKKiBUaGUgZ3JhcGhp
Y3MgU0RLIHJlcXVpcmVzIGFkZGl0aW9uYWwgZGlyZWN0b3JpZXMgdG8gYmUgc3RhZ2VkCiAgZm9y
IGNvbXBpbGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogUHJhdGhhcCBNIFMgPG1zcHJhdGhhcEB0aS5j
b20+Ci0tLQogY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyB8ICAgIDIgKy0KIDEgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NsYXNzZXMv
a2VybmVsLmJiY2xhc3MgYi9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzCmluZGV4IDAxMDljZTYuLmJm
NzMxZTYgMTAwNjQ0Ci0tLSBhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MKKysrIGIvY2xhc3Nlcy9r
ZXJuZWwuYmJjbGFzcwpAQCAtMTY4LDcgKzE2OCw3IEBAIHN5c3Jvb3Rfc3RhZ2VfYWxsX2FwcGVu
ZCgpIHsKIAlta2RpciAtcCAka2VybmVsZGlyL2luY2x1ZGUvYXNtLWdlbmVyaWMKIAljcCAtZlIg
aW5jbHVkZS9hc20tZ2VuZXJpYy8qICRrZXJuZWxkaXIvaW5jbHVkZS9hc20tZ2VuZXJpYy8KIAot
CWZvciBlbnRyeSBpbiBkcml2ZXJzL2NyeXB0byBkcml2ZXJzL21lZGlhIGluY2x1ZGUvZ2VuZXJh
dGVkIGluY2x1ZGUvbGludXggaW5jbHVkZS9uZXQgaW5jbHVkZS9wY21jaWEgaW5jbHVkZS9tZWRp
YSBpbmNsdWRlL2FjcGkgaW5jbHVkZS9zb3VuZCBpbmNsdWRlL3ZpZGVvIGluY2x1ZGUvc2NzaSBp
bmNsdWRlL3RyYWNlIGluY2x1ZGUvbXRkIGluY2x1ZGUvcmRtYSBpbmNsdWRlL2RybSBpbmNsdWRl
L3hlbiBjcnlwdG8vb2NmOyBkbworCWZvciBlbnRyeSBpbiBkcml2ZXJzL2NyeXB0byBkcml2ZXJz
L21lZGlhIGRyaXZlcnMvdmlkZW8gZHJpdmVycy9ncHUgZHJpdmVycy9iYXNlIGluY2x1ZGUvZ2Vu
ZXJhdGVkIGluY2x1ZGUvbGludXggaW5jbHVkZS9uZXQgaW5jbHVkZS9wY21jaWEgaW5jbHVkZS9t
ZWRpYSBpbmNsdWRlL2FjcGkgaW5jbHVkZS9zb3VuZCBpbmNsdWRlL3ZpZGVvIGluY2x1ZGUvc2Nz
aSBpbmNsdWRlL3RyYWNlIGluY2x1ZGUvbXRkIGluY2x1ZGUvcmRtYSBpbmNsdWRlL2RybSBpbmNs
dWRlL3hlbiBjcnlwdG8vb2NmOyBkbwogCQlpZiBbIC1kICRlbnRyeSBdOyB0aGVuCiAJCQlta2Rp
ciAtcCAka2VybmVsZGlyLyRlbnRyeQogCQkJY3AgLWZSICRlbnRyeS8qICRrZXJuZWxkaXIvJGVu
dHJ5LwotLSAKMS43LjEKCg==

--_002_C2C4AB609E1BCF4689C1782E8F42E30A027B15DBDE01entticom_--
