Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWRMA-0002wE-J3
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Apr 2013 15:09:31 +0200
Received: by mail-ea0-f171.google.com with SMTP id b10so1365027eae.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=/fCPXErWN3E/rKssNNW/sSHecAtUQkwPtjWXh+S3JvE=;
	b=HMhgG7vJ818P4A+Dz37zpNwNa5aYwqu2S31/U9lpGam2z64X7+3a1UqFx/I7X2+obO
	lZrO0Z10TAc+3fFjGiRs1liMUxhkeGk277tb5OrTcgKiXz34qV/g+PKCVg8C2R/kkSG3
	uhGThOMoEF7xPVWh5nbJ49BeeuPfxQpKkFYZyqLGLBFPEmS4RGEHrWn0O9H8vemswXWK
	D7LIVPWHQDdba6zfrEQZF/kirKBk/SHescOMi3fI+dQP/YnT/ZHuGQeQuVIGbFsdSM64
	rK2H2uogpOEXOvckggbze77KdY2wFzoVuJBuSdLovyd/YmmA526PTXgExANZfaRO2KGw
	l+FA==
X-Received: by 10.14.149.141 with SMTP id x13mr111415795eej.31.1367153503076; 
	Sun, 28 Apr 2013 05:51:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cd3sm27376495eeb.6.2013.04.28.05.51.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 05:51:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Apr 2013 14:52:01 +0200
Message-Id: <1367153521-12641-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-efl][PATCH] e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
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
X-List-Received-Date: Sun, 28 Apr 2013 13:09:31 -0000

Files enlightenment-0.17.2.1/ChangeLog and enlightenment-0.17.2.1-new/ChangeLog differ
Files enlightenment-0.17.2.1/NEWS and enlightenment-0.17.2.1-new/NEWS differ
Files enlightenment-0.17.2.1/po/ca.gmo and enlightenment-0.17.2.1-new/po/ca.gmo differ
Files enlightenment-0.17.2.1/po/ca.po and enlightenment-0.17.2.1-new/po/ca.po differ
Files enlightenment-0.17.2.1/po/eo.gmo and enlightenment-0.17.2.1-new/po/eo.gmo differ
Files enlightenment-0.17.2.1/po/eo.po and enlightenment-0.17.2.1-new/po/eo.po differ

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
index 228c122..5ff68bb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "e78018ba7a4622efbcbebd6d093b7fa4"
-SRC_URI[sha256sum] = "5e7b7f5ec88d0589bb4db8aae2c198dc9fd91049419e2460cbd7631207ebd799"
+SRC_URI[md5sum] = "dd6ffbe1ee6a804dbd2a7b2645bf3b4d"
+SRC_URI[sha256sum] = "66d250a865ffb97b12cabe8081ae041ce6924f55ffffaca6c65d468bb9f902f9"
-- 
1.8.2.1



