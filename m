Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q74UN-0007EU-Ti
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 13:32:04 +0200
Received: by iwn10 with SMTP id 10so282283iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 04:29:58 -0700 (PDT)
Received: by 10.43.60.14 with SMTP id wq14mr6438460icb.118.1302002997826;
	Tue, 05 Apr 2011 04:29:57 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-165-208-114.neo.res.rr.com
	[24.165.208.114])
	by mx.google.com with ESMTPS id vx7sm4123381icb.2.2011.04.05.04.29.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 04:29:56 -0700 (PDT)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 07:28:26 -0400
Message-Id: <1302002906-16491-2-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302002906-16491-1-git-send-email-robert@erafx.com>
References: <1302002906-16491-1-git-send-email-robert@erafx.com>
Subject: [PATCH v2 2/2] tzdata: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 11:32:04 -0000

Signed-off-by: Bob Foerster <robert@erafx.com>
---
 .../tzdata/{tzdata_2011d.bb => tzdata_2011e.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/tzdata/{tzdata_2011d.bb => tzdata_2011e.bb} (64%)

diff --git a/recipes/tzdata/tzdata_2011d.bb b/recipes/tzdata/tzdata_2011e.bb
similarity index 64%
rename from recipes/tzdata/tzdata_2011d.bb
rename to recipes/tzdata/tzdata_2011e.bb
index ca225bf..581ced3 100644
--- a/recipes/tzdata/tzdata_2011d.bb
+++ b/recipes/tzdata/tzdata_2011e.bb
@@ -6,5 +6,5 @@ require tzdata.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "03c5793502b7c41985edd73146bf7e36"
-SRC_URI[sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
+SRC_URI[md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
+SRC_URI[sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
-- 
1.7.0.4



