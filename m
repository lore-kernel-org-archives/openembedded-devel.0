Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QvbSG-0004mi-Of
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:50:45 +0200
Received: by wwe32 with SMTP id 32so4439808wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T/LUd11e8IBFfV1bqpsdfq4lw8u1UmHUNIeRDzhjGLo=;
	b=B1Qsb9izSBfBEkTZfRYLQsjDsp8L4TTyPnM0o0g3IcAcOgq0pKjKbXRCvz4WyRI4wk
	KbTcz+dO+EqRsX3joHeqzIHLCdsScbdFFeujYm61OxoDea7ccXhcaA83XCH8yzHilFeg
	O93Y1qPvYlwKG+N7/ukCumAyT5jK1LaVMcsFI=
Received: by 10.216.14.41 with SMTP id c41mr2342217wec.108.1314045960438;
	Mon, 22 Aug 2011 13:46:00 -0700 (PDT)
Received: from localhost.localdomain (169.pool85-50-86.dynamic.orange.es
	[85.50.86.169])
	by mx.google.com with ESMTPS id j11sm4192267wed.18.2011.08.22.13.45.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:45:59 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:45:05 +0200
Message-Id: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl][PATCH 1/4] enjoy: Add var LIC_FILES_CHKSUM to recipe
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
X-List-Received-Date: Mon, 22 Aug 2011 20:50:45 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index eab81b4..d3fea32 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0f507c68d42d1cc0fcb507d007112bf2"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
-- 
1.7.6



