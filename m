Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QddDZ-0000Hm-2X
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 09:05:17 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Mon, 4 Jul 2011
	09:01:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jul 2011 09:01:13 +0200
Message-ID: <1309762873-2004-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] tzcode-native: update tzcode and tzdata versions
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
X-List-Received-Date: Mon, 04 Jul 2011 07:05:17 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 ...code-native_2011e.bb => tzcode-native_2011g.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename recipes/tzcode/{tzcode-native_2011e.bb => tzcode-native_2011g.bb} (56%)

diff --git a/recipes/tzcode/tzcode-native_2011e.bb b/recipes/tzcode/tzcode-native_2011g.bb
similarity index 56%
rename from recipes/tzcode/tzcode-native_2011e.bb
rename to recipes/tzcode/tzcode-native_2011g.bb
index 280840c..d4ac755 100644
--- a/recipes/tzcode/tzcode-native_2011e.bb
+++ b/recipes/tzcode/tzcode-native_2011g.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2011e"
+TZDATA_PV = "2011h"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
-SRC_URI[tzcode-2011e.sha256sum] = "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
-SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[tzdata-2011e.sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
+SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata-2011h.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata-2011h.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
-- 
1.7.4.1



