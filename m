Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQLfY-0006jp-41
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 19:52:22 +0200
Received: by mail-pb0-f46.google.com with SMTP id rp8so976173pbb.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ecjeTOJQsp7PSh6Mf8LwHYYwA3XwHBazSjio7tCgTpo=;
	b=t10IJpO9s23eKwYnmLxkJHUX9/gGImkIMvTXRagsHRVmhjqwWcsAPsZGPMm6Ate0VW
	/d6IgPYVMgVFgqw3OIBFsBoCmzAm9slp/9qojDY0ILOxVq/Vl6pQAPR81CEzBsGBLQHB
	XgtOsU/ena/E2Lj4zqxEj5LLryYQl15YBQW7t6eNIqkWcp8BPo6JpU24F6y4cLrcx3z/
	LqT/58Piorr7HzmK3xTQ9iMLy1eSbyGGLYnGbv7mpTq8DHBHcX7UjadfKRXwtslM6E/G
	lG+SC7h/XoSiLAomSa4i6i1z+ijwi8AKHJwvZ22oOpIYTva/9L7HABi+cbETmd2rQBDf
	ZDag==
X-Received: by 10.68.210.5 with SMTP id mq5mr10206903pbc.44.1365701696040;
	Thu, 11 Apr 2013 10:34:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ms9sm4995735pbc.20.2013.04.11.10.34.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 10:34:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 19:33:55 +0200
Message-Id: <1365701635-1242-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-efl][PATCH] evas-1.7.6.1: Update checksums, tarball was repackaged upstream :/
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
X-List-Received-Date: Thu, 11 Apr 2013 17:52:25 -0000

Files old/evas-1.7.6.1/ChangeLog and new/evas-1.7.6.1/ChangeLog differ
Files old/evas-1.7.6.1/NEWS and new/evas-1.7.6.1/NEWS differ
Files old/evas-1.7.6.1/src/lib/engines/common/evas_font_ot.c and new/evas-1.7.6.1/src/lib/engines/common/evas_font_ot.c differ
Files old/evas-1.7.6.1/src/tests/evas_test_textblock.c and new/evas-1.7.6.1/src/tests/evas_test_textblock.c differ

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas_1.7.6.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
index 189ad17..2ea56ee 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
@@ -1,10 +1,10 @@
 require ${BPN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3ca69922c4291c933243f7f358930522"
-SRC_URI[sha256sum] = "446434074747e53de01e609882ddd72987ba5708cf66750e4335d31a3045986a"
+SRC_URI[md5sum] = "c1710b7769c6dc8cfb0a21190fbc0c9b"
+SRC_URI[sha256sum] = "ebfd6d178999128855c65b8edeeec5cc1f1b2acbdd1d8aac197a268764bdeacc"
-- 
1.8.1.5



