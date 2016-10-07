Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id B4E56719D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:30:16 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u97FTfc1017946 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Oct 2016 11:30:17 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx0a-001b2d01.pphosted.com with ESMTP id 25xdca2qwq-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 11:30:17 -0400
Received: from localhost
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<msbarth@linux.vnet.ibm.com>; Fri, 7 Oct 2016 09:30:16 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 7 Oct 2016 09:30:13 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
	(b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 05E473E40047
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:30:13 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com
	(b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u97FTiO114942524; Fri, 7 Oct 2016 08:30:12 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D13BA136044;
	Fri,  7 Oct 2016 09:30:12 -0600 (MDT)
Received: from UbuntuVM.aus.stglabs.ibm.com (unknown [9.10.99.147])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id AE91513603C; 
	Fri,  7 Oct 2016 09:30:12 -0600 (MDT)
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 10:30:16 -0500
X-Mailer: git-send-email 1.9.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100715-0024-0000-0000-000014BCCDF0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005868; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000186; SDB=6.00765528; UDB=6.00365813;
	IPR=6.00541386; 
	BA=6.00004792; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012906;
	XFM=3.00000011; UTC=2016-10-07 15:30:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100715-0025-0000-0000-00004521A8A0
Message-Id: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-07_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610070267
Cc: Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: [meta-oe][PATCH v2] autoconf-archive: 2012.04.07 -> 2016.09.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2016 15:30:16 -0000

Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
---
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc    | 7 ++++---
 ...oconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 8 +++-----
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} (55%)

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
index 9399363..2b5df70 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -1,15 +1,16 @@
+SUMMARY = "A collection of macros for GNU Autoconf"
+DESCRIPTION = "The autoconf-archive set of macros extend the pre-defined \
+capabilities within the complete autoconf tool set."
 LICENSE = "GPLv3"
 HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
-
 DEPENDS += "m4-native"
 DEPENDS_class-native = "m4-native gnu-config-native"
 DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
 RDEPENDS_${PN} = "m4 gnu-config"
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
 inherit autotools
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
similarity index 55%
rename from meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
rename to meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 5baaecc..1a0470c 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -1,13 +1,11 @@
 require autoconf-archive.inc
 
-
-PARALLEL_MAKE = ""
-
 LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
-SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
+SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
+SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
 
 EXTRA_OECONF += "ac_cv_path_M4=m4"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


