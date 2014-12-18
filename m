Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Dec 2014 20:28:52 UTC
Received: from BLU004-OMC4S12.hotmail.com (blu004-omc4s12.hotmail.com
	[65.55.111.151])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFA0724CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 20:28:52 +0000 (UTC)
Received: from BLU436-SMTP193 ([65.55.111.137]) by BLU004-OMC4S12.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Thu, 18 Dec 2014 12:21:08 -0800
X-TMN: [Ex1PJCU4s1VRxQvGoU6UkpKPUHzYuOjS]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP19311B478F533B1CE52EB1BD66A0@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:20:33 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 18 Dec 2014 20:21:05.0903 (UTC)
	FILETIME=[26D297F0:01D01B00]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyassl: updated to version 3.3.0, removed 3.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 20:29:01 -0000
Content-Type: text/plain

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/{cyassl_3.2.0.bb => cyassl_3.3.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.2.0.bb => cyassl_3.3.0.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
index 508bab4..b6f852d 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.yassl.com/${BP}.zip"
 
-SRC_URI[md5sum] = "9f076e82d32bea986651ada34c49f6c0"
-SRC_URI[sha256sum] = "c9e97cd3fa4697e55328c2016965ac4b304fcef45a10559caf540c42f1d5e93a"
+SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
+SRC_URI[sha256sum] = "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
 
 inherit autotools
 
-- 
1.9.1


