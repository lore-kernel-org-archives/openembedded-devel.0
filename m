Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q74UF-0007EA-7E
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 13:31:55 +0200
Received: by iye7 with SMTP id 7so284129iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 04:29:49 -0700 (PDT)
Received: by 10.42.117.134 with SMTP id t6mr4090298icq.459.1302002989063;
	Tue, 05 Apr 2011 04:29:49 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-165-208-114.neo.res.rr.com
	[24.165.208.114])
	by mx.google.com with ESMTPS id vx7sm4123381icb.2.2011.04.05.04.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 04:29:48 -0700 (PDT)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 07:28:25 -0400
Message-Id: <1302002906-16491-1-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 11:31:55 -0000

Signed-off-by: Bob Foerster <robert@erafx.com>
---
 ...code-native_2011d.bb => tzcode-native_2011e.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename recipes/tzcode/{tzcode-native_2011d.bb => tzcode-native_2011e.bb} (51%)

diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/tzcode-native_2011e.bb
similarity index 51%
rename from recipes/tzcode/tzcode-native_2011d.bb
rename to recipes/tzcode/tzcode-native_2011e.bb
index 1cc7757..2bf4f4c 100644
--- a/recipes/tzcode/tzcode-native_2011d.bb
+++ b/recipes/tzcode/tzcode-native_2011e.bb
@@ -6,11 +6,11 @@ require tzcode-native.inc
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2011d"
+TZDATA_PV = "2011e"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
-SRC_URI[tzcode-2011d.sha256sum] = "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
-SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
-SRC_URI[tzdata-2011d.sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
+SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
+SRC_URI[tzcode-2011e.sha256sum] = "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
+SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
+SRC_URI[tzdata-2011e.sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
-- 
1.7.0.4



