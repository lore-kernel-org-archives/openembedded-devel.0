Return-Path: <msbarth@linux.vnet.ibm.com>
X-Greylist: delayed 5564 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Oct 2016 22:57:30 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 851EF7199E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 22:57:30 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u96LOLw3124761 for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Oct 2016 17:24:47 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0a-001b2d01.pphosted.com with ESMTP id 25wu5fsty6-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 17:24:47 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<msbarth@linux.vnet.ibm.com>; Thu, 6 Oct 2016 15:24:46 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 6 Oct 2016 15:24:45 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 98B9D1FF0021
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:24:25 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u96LOhvN17367442; Thu, 6 Oct 2016 21:24:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59F8C28060;
	Thu,  6 Oct 2016 17:24:44 -0400 (EDT)
Received: from UbuntuVM.aus.stglabs.ibm.com (unknown [9.10.99.147])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 1B60A28046;
	Thu,  6 Oct 2016 17:24:44 -0400 (EDT)
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 16:24:26 -0500
X-Mailer: git-send-email 1.9.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100621-0008-0000-0000-000005C154DE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005864; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000186; SDB=6.00765188; UDB=6.00365595;
	IPR=6.00541043; 
	BA=6.00004791; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012897;
	XFM=3.00000011; UTC=2016-10-06 21:24:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100621-0009-0000-0000-00003BED6474
Message-Id: <1475789066-4308-1-git-send-email-msbarth@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-06_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610060375
Cc: Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: [meta-oe][PATCH] autoconf-archive: 2012.04.07 -> 2016.09.16
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
X-List-Received-Date: Thu, 06 Oct 2016 22:57:30 -0000

Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
---
 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc     | 7 ++++---
 ...toconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} (61%)

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
similarity index 61%
rename from meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
rename to meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 5baaecc..da648c2 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -1,13 +1,13 @@
 require autoconf-archive.inc
 
-
 PARALLEL_MAKE = ""
 
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


