Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UIWLh-0001Vb-DA
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 04:39:30 +0100
Received: from mail145-tx2-R.bigfish.com (10.9.14.234) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 02:52:28 +0000
Received: from mail145-tx2 (localhost [127.0.0.1])	by
	mail145-tx2-R.bigfish.com (Postfix) with ESMTP id 22F1D20214	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:52:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz9371I542Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275dh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail145-tx2 (localhost.localdomain [127.0.0.1]) by mail145-tx2
	(MessageSwitch) id 1363834346423386_25564;
	Thu, 21 Mar 2013 02:52:26 +0000 (UTC)
Received: from TX2EHSMHS021.bigfish.com (unknown [10.9.14.246])	by
	mail145-tx2.bigfish.com (Postfix) with ESMTP id 62F0E120048	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:52:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS021.bigfish.com
	(10.9.99.121) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 02:52:26 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.235]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Thu, 21 Mar 2013 02:52:25 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] fm-ucode: update to the commit for sdk 1.3.2
Thread-Index: AQHOJd5tyAgsy3N4iEKBR/GeantKHJivcZqw
Date: Thu, 21 Mar 2013 02:52:25 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E06806F37@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1363834041-9889-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1363834041-9889-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.249]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [OE-core][PATCH] fm-ucode: update to the commit for sdk 1.3.2
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
X-List-Received-Date: Thu, 21 Mar 2013 03:39:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore it .

Sorry, I send patch to wrong maillist .

-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Thursday, March 21, 2013 10:47 AM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH] fm-ucode: update to the commit for sdk 1.3.2

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-ucode/fm-ucode/fm-ucode_git.bb |   51 +++++++++++++++++-----------=
----
 1 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/recipes-ucode/fm-ucode/fm-ucode_git.bb b/recipes-ucode/fm-ucod=
e/fm-ucode_git.bb
index 89c43ba..bc5dc6d 100644
--- a/recipes-ucode/fm-ucode/fm-ucode_git.bb
+++ b/recipes-ucode/fm-ucode/fm-ucode_git.bb
@@ -3,41 +3,44 @@ SECTION =3D "fm-ucode"
 LICENSE =3D "Freescale EULA"
 LIC_FILES_CHKSUM =3D "file://EULA;md5=3D60037ccba533a5995e8d1a838d85799c"
=20
-FMAN_UCODE_INSTALL_FILE =3D "fsl_fman_ucode"
-FMAN_UCODE_INSTALL_FILE_append_p2041rdb =3D "_P2041"
-FMAN_UCODE_INSTALL_FILE_append_p4080ds=3D "_P4080"
-FMAN_UCODE_INSTALL_FILE_append_p1023rds =3D "_*1023"
-FMAN_UCODE_INSTALL_FILE_append_p5020ds =3D "_P5020"
-FMAN_UCODE_INSTALL_FILE_append_p5020ds-64b =3D "_P5020"
-FMAN_UCODE_INSTALL_FILE_append_p5040ds =3D "_P5040"
-FMAN_UCODE_INSTALL_FILE_append_p5040ds-64b =3D "_P5040"
-FMAN_UCODE_INSTALL_FILE_append_p3041ds =3D "_P3041"
-FMAN_UCODE_INSTALL_FILE_append_b4420qds =3D "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4420qds-64b =3D "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4860qds =3D "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4860qds-64b =3D "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_t4160qds =3D "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4160qds-64b =3D "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4240qds =3D "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4240qds-64b =3D "_T4240"
-
-COMPATIBLE_MACHINE =3D "(p1023rds|p4080ds|p5020ds|p5040ds|p5020ds-64b|p504=
0ds-64b|p3041ds|p2041rdb|b4420qds|b4420qds-64b|b4860qds|b4860qds-64b|t4160q=
ds|t4160qds-64b|t4240qds|t4240qds-64b)"
+PR =3D "r1"
+
+
+COMPATIBLE_MACHINE =3D "(p1023rds|p2041rdb|p3041ds|p4080ds|p5020ds|p5040ds=
|p5020ds-64b|p5040ds-64b|b4420qds|b4420qds-64b|b4860qds|b4860qds-64b|t4160q=
ds|t4160qds-64b|t4240qds|t4240qds-64b)"
 inherit deploy
=20
 SRC_URI =3D "git://git.freescale.com/ppc/sdk/fm-ucode.git"
-SRCREV =3D "f4a43e8ad6a6e5fdedff6e1484386f963bccfdff"
+SRCREV =3D "219bb2c6aaa1e040fb849a771a9bdf3e8dbc49e9"
=20
 S =3D "${WORKDIR}/git"
=20
 ALLOW_EMPTY_${PN} =3D "1"
 do_install () {
-	install -d ${D}/boot
-	install -m 644 ${FMAN_UCODE_INSTALL_FILE}*.bin ${D}/boot/
+    case ${MACHINE} in
+        b4420qds|b4420qds-64b|b4860qds|b4860qds-64b) UCODE=3Db4860qds;;
+        t4240qds|t4240qds-64b|t4160qds|t4160qds-64b) UCODE=3Dt4240qds;;
+        p5020ds|p5020ds-64b) UCODE=3Dp5020ds;;
+        p5040ds|p5040ds-64b) UCODE=3Dp5040ds;;
+        p1023rds) UCODE=3DP1023RDS;;
+        *) UCODE=3D${MACHINE};;
+    esac
+    UCODE=3D`echo $UCODE | sed -e 's,[a-zA-Z]*$,,'`
+    install -d ${D}/boot
+    install -m 644 fsl_fman_ucode_${UCODE}*.bin ${D}/boot/
 }
=20
 do_deploy () {
-	install -d ${DEPLOYDIR}/
-	install -m 644 ${FMAN_UCODE_INSTALL_FILE}*.bin ${DEPLOYDIR}/
+    case ${MACHINE} in
+        b4420qds|b4420qds-64b|b4860qds|b4860qds-64b) UCODE=3Db4860qds;;
+        t4240qds|t4240qds-64b|t4160qds|t4160qds-64b) UCODE=3Dt4240qds;;
+        p5020ds|p5020ds-64b) UCODE=3Dp5020ds;;
+        p5040ds|p5040ds-64b) UCODE=3Dp5040ds;;
+        p1023rds) UCODE=3DP1023RDS;;
+        *) UCODE=3D${MACHINE};;
+    esac
+    UCODE=3D`echo $UCODE | sed -e 's,[a-zA-Z]*$,,'`
+    install -d ${DEPLOYDIR}/
+    install -m 644 fsl_fman_ucode_${UCODE}*.bin ${DEPLOYDIR}/
 }
 addtask deploy before do_build after do_install
=20
--=20
1.7.5.4




