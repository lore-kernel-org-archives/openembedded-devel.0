Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitap@ti.com>) id 1RPUzF-0000NB-NS
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Nov 2011 09:00:22 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAD7s0JQ014606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Nov 2011 01:54:00 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAD7s0e2013132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Nov 2011 01:54:00 -0600 (CST)
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAD7rxPB010092
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Nov 2011 01:54:00 -0600 (CST)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Sun, 13 Nov 2011 08:53:59 +0100
From: "Preskovsky, Vita" <vitap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] new recipe - bluez-hcidump_2.1.bb, to build new
	version of bluez-hcidump-2.1 that compatible with bluez4_4.95.
Thread-Index: AcyaDgSXZdhaXifUSA22nrzMNj4USQHyzjxg
Date: Sun, 13 Nov 2011 07:53:58 +0000
Message-ID: <99AD691F1FA415449470C6EA37B6FE4606D506@DNCE03.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: RiI= BOY7 Ckwl DJt0 DgWG ERZt Fw0n F9RK Ho9l IC9a IGiU
	JHIk KR/j KWQH LtI9 Lt3J; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {A24629AF-C9A4-416C-B46B-47C25B6AC816};
	dgBpAHQAYQBwAEAAdABpAC4AYwBvAG0A; Sun, 13 Nov 2011 07:53:53
	GMT;
	RgBXADoAIABbAFAAQQBUAEMASABdACAAbgBlAHcAIAByAGUAYwBpAHAAZQAgAC0AIABiAGwAdQBlAHoALQBoAGMAaQBkAHUAbQBwAF8AMgAuADEALgBiAGIALAAgAHQAbwAgAGIAdQBpAGwAZAAgAG4AZQB3ACAAdgBlAHIAcwBpAG8AbgAgAG8AZgAgAGIAbAB1AGUAegAtAGgAYwBpAGQAdQBtAHAALQAyAC4AMQAgAHQAaABhAHQAIABjAG8AbQBwAGEAdABpAGIAbABlACAAdwBpAHQAaAAgAGIAbAB1AGUAegA0AF8ANAAuADkANQAuAA==
x-cr-puzzleid: {A24629AF-C9A4-416C-B46B-47C25B6AC816}
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: FW: [PATCH] new recipe - bluez-hcidump_2.1.bb, to build new version of bluez-hcidump-2.1 that compatible with bluez4_4.95.
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
X-List-Received-Date: Sun, 13 Nov 2011 08:00:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping to: [PATCH] new recipe - bluez-hcidump_2.1.bb, to build new version of=
 bluez-hcidump-2.1 that compatible with bluez4_4.95.

Regards,
Vita Preskovsky

-----Original Message-----
From: Vita Preskovsky [mailto:vita.preskovsky@gmail.com]=20
Sent: Thursday, November 03, 2011 11:50 AM
To: openembedded-devel@lists.openembedded.org
Cc: Preskovsky, Vita
Subject: [PATCH] new recipe - bluez-hcidump_2.1.bb, to build new version of=
 bluez-hcidump-2.1 that compatible with bluez4_4.95.

---
 recipes/bluez/bluez-hcidump_2.1.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez-hcidump_2.1.bb

diff --git a/recipes/bluez/bluez-hcidump_2.1.bb b/recipes/bluez/bluez-hcidu=
mp_2.1.bb
new file mode 100644
index 0000000..2e1389c
--- /dev/null
+++ b/recipes/bluez/bluez-hcidump_2.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Linux Bluetooth Stack HCI Debugger Tool."
+SECTION =3D "console"
+PRIORITY =3D "optional"
+DEPENDS =3D "bluez-libs"
+LICENSE =3D "GPLv2"
+PR =3D "r0"
+
+SRC_URI =3D "http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar=
.gz"
+S =3D "${WORKDIR}/bluez-hcidump-${PV}"
+
+EXTRA_OECONF =3D "--with-bluez-libs=3D${STAGING_LIBDIR} --with-bluez-inclu=
des=3D${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] =3D "b160f0672276398344eebe9df1b37a2c"
+SRC_URI[sha256sum] =3D "a6cc20b95b6b1a28ff336aad91e124555231628689225c1155=
e8cd7aac1af86d"
--=20
1.7.0.4



