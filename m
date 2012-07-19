Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrXZ-00074M-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:17:17 +0200
Received: by weyr6 with SMTP id r6so1740223wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/VwbWoE2OumSlvNHEjSqGtTD1e7jtvmqah+eFgSu67s=;
	b=zJx03b3OCjeDWY0bDPG7nz9oqeqQy0GGRLfs+asTgfGx/DBE/yKnNC7QiwNZBr1eVX
	jVHCfcYiCThJGwVTLsMfLMDnC7mEm2cUDbPZ9KTQlu4u3KtITTErwb4ljrjtm0qrycpf
	dM0tNZpXfKfvgNsfxC6udKzjDhdIrfBDlhMunzMKgFzKptXiiiHdAuaHjJ49oLl9P6Y/
	AByaWb6XvC1q1hOpG2iX3ZQYH5CtxdRoUArdy3GmWayvhx/Dpd+eVlRozBLjuPjKIv7e
	P8Aa2bw8h+x69axuwh+mZu2vCO5GKCR46Y41kcOoigw4lhP7Tns5FE8SFNHtgrZAgkuY
	z0Fg==
Received: by 10.216.209.8 with SMTP id r8mr1384122weo.51.1342706756144;
	Thu, 19 Jul 2012 07:05:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm38664927wib.8.2012.07.19.07.05.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:05:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:37 +0200
Message-Id: <fbe710e4a83c645c1d0f9a8edf9f7f3e2d6229df.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] libopus: use 4 spaces instead of tabs in get_libopus_fpu_setting
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
X-List-Received-Date: Thu, 19 Jul 2012 14:17:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
index ed16602..8464664 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
+++ b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_libopus_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
-		return "--enable-fixed-point"
-	return ""
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+        return "--enable-fixed-point"
+    return ""
 
-- 
1.7.8.6



