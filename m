Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <moosab@ti.com>) id 1RrsWQ-0001fK-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 15:47:55 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0UEcuT1005883
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:38:56 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0UEct1V011982
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:38:56 -0600 (CST)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Mon, 30 Jan 2012 15:38:55 +0100
From: "Baransi, Moosa" <moosab@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] update iperf version
Thread-Index: AczfXONmH53FU+igT7yxuJ0COb8DLQ==
Date: Mon, 30 Jan 2012 14:38:53 +0000
Message-ID: <308727D9E105A34D845E688AECAF6F4718EACD14@DNCE03.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] update iperf version
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
X-List-Received-Date: Mon, 30 Jan 2012 14:47:55 -0000
X-Groupsio-MsgNum: 36753
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_308727D9E105A34D845E688AECAF6F4718EACD14DNCE03entticom_"

--_004_308727D9E105A34D845E688AECAF6F4718EACD14DNCE03entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please consider this patch which updates the iPerf to version 2.0.5

Regards,
Moosa Baransi

--_004_308727D9E105A34D845E688AECAF6F4718EACD14DNCE03entticom_
Content-Type: application/octet-stream;
	name="0001-update-iperf-version.patch"
Content-Description: 0001-update-iperf-version.patch
Content-Disposition: attachment; filename="0001-update-iperf-version.patch";
	size=882; creation-date="Mon, 30 Jan 2012 14:31:19 GMT";
	modification-date="Mon, 30 Jan 2012 14:28:28 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyYmU0OGJkYjg2ODkzNzgxNTRjMTM1ZGJiOTM3ZjYzMjMxN2M2OGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb29zYSA8bW9vc2EuYmFyYW5zaUBiYWJjb21zb2Z0d2FyZS5j
b20+CkRhdGU6IE1vbiwgMzAgSmFuIDIwMTIgMTY6Mjc6MjkgKzAyMDAKU3ViamVjdDogW1BBVENI
XSB1cGRhdGUgaXBlcmYgdmVyc2lvbgoKKiBWZXJzaW9uIHVwZGF0ZWQgdG8gaVBlcmYgMi4wLjUK
ClNpZ25lZC1vZmYtYnk6IE1vb3NhIEJhcmFuc2kgPG1vb3NhYkB0aS5jb20+Ci0tLQogcmVjaXBl
cy9pcGVyZi9pcGVyZl8yLjAuNS5iYiB8ICAgMTEgKysrKysrKysrKysKIDEgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBy
ZWNpcGVzL2lwZXJmL2lwZXJmXzIuMC41LmJiCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9pcGVyZi9p
cGVyZl8yLjAuNS5iYiBiL3JlY2lwZXMvaXBlcmYvaXBlcmZfMi4wLjUuYmIKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMGVmNTg3ZgotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lw
ZXMvaXBlcmYvaXBlcmZfMi4wLjUuYmIKQEAgLTAsMCArMSwxMSBAQAorcmVxdWlyZSBpcGVyZi5p
bmMKKworUFIgPSAiJHtJTkNfUFJ9LjEiCisKK1NSQ19VUkkgPSAiIFwKKwkke1NPVVJDRUZPUkdF
X01JUlJPUn0vaXBlcmYvaXBlcmYtJHtQVn0udGFyLmd6IFwKKwkiCisKK1NSQ19VUklbbWQ1c3Vt
XSA9ICI0NGI1NTM2YjY3NzE5ZjQyNTBmYWVkNjMyYTNjZDAxNiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2MzZiNGVmZjA0MzFjZWE4MDY2N2VhODVhNjdjZTRjNjg2OTg3NjBhOTgzN2UxZTlkMTMw
OTZkMjAzNjIyNjViIgorCi0tIAoxLjcuMQoK

--_004_308727D9E105A34D845E688AECAF6F4718EACD14DNCE03entticom_--
