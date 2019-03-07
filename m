Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 319 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 01:04:50 UTC
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 8F33E7CDF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:04:50 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 962E7220218;
	Thu,  7 Mar 2019 13:59:31 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 13:59:29 +1300
Message-Id: <20190307005929.11955-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] net-snmp: Licenses are in the COPYING file
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
X-List-Received-Date: Thu, 07 Mar 2019 01:04:51 -0000

A bit of an unholy mixture of MIT, BSD 3-clause,
and too old to really know BSD-style,
with a wide variety of copyright holders.

I'm open to better suggestions on how to handle this.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 482eaf2cc..673142b4a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Various tools relating to the Simple Network Management Protocol"
 HOMEPAGE = "http://www.net-snmp.org/"
 SECTION = "net"
-LICENSE = "BSD"
+LICENSE = "BSD & MIT"
 
-LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
 DEPENDS = "openssl libnl pciutils"
 
-- 
2.17.1


