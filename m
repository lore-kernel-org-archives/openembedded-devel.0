Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi44-0002Sw-O7
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:53 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4T/TtOJpNyGCoKVxVLCpxc5FAZ0gjAm5rtVHOhgSn5c=;
	b=aynHlIoO4qUCoEcomi0HA95luU8D8ofA/5odmgm65RUVfq+QKTeZTJmzXGeFDjmvi+
	kiaT6Vy2y9Ml2tQjwDctByshbAMVlIzwZAu5w0aWO6Dwi/R+BMsQL9Q4wfeHy2LyAWNQ
	7h66SdMtL8vimikpkjEb3ocY9OMxsBx4fFY8n3fYx/pRIT8yoV9pHsPXFmmys1JnRs/j
	Yz89uIB7b+cnoDU2apPCRIc15iuKWrWMJkPMogv5scnvz+ZTr4PFK+DVCQDQB56nFQyZ
	G05X/3g2rJ8VD1lxQfG0HgzD8FG159YqYAZxguljLBRQ6kBRQJ9X+Z7vb3kK0iFLrnpQ
	xryg==
Received: by 10.14.207.68 with SMTP id m44mr42627598eeo.40.1354586553166;
	Mon, 03 Dec 2012 18:02:33 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34798692eed.10.2012.12.03.18.02.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:54 +0100
Message-Id: <a198294dd9fbe983d76cdbc6378aa9ecfa27b761.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 21/58] ephoto: update LICENSE and LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:54 -0000

* COPYNG.icons was changed to GPL-3.0 in r60781

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/ephoto_svn.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index 4694398..def68af 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -1,9 +1,9 @@
-LICENSE = "MIT CC-BY-SA2.5"
+LICENSE = "MIT GPL-3.0"
 PV = "0.1.0+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=df45d9de58df0b48f515eae8d2421257"
-LIC_FILES_CHKSUM = "file://COPYING.icons;md5=d4e4f10748f3146a089aaa23c9ade59b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fdffcddb366d0cc78e0e46c4ea70c8d9 \
+                    file://COPYING.icons;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 require e-module.inc
 
-- 
1.8.0



