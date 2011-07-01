Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcaYi-0006Rj-4G
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 12:02:48 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	11:59:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Jul 2011 11:58:50 +0200
Message-ID: <1309514330-26705-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH] tzcode: Update tzdata version.
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
X-List-Received-Date: Fri, 01 Jul 2011 10:02:48 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
index d32ee33..651d1dd 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "${PV}"
+TZDATA_PV = "2011h"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
 SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+SRC_URI[tzdata-2011h.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata-2011h.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
 
-- 
1.7.4.1



