Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbqP-0000fg-RX
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:41 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1625270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OaNOTNSM11F5ZNzvLxOV7g1rnqP0tauGrfKkTzZqzWI=;
	b=vEgTRmP9oAOPWu5QpAb4VmAqSzRCPelUVZzNu/obMhyWMHMbYdv6wFrfOe7njRWDay
	4g4rAHvCRvmg7Pz/JQCf6JEUX+ahTA7YmFvdRWV2E8c3TkJfpgIkGwEp3Z1GPQQQuLIs
	xU+n57ygnL6ZQUszBCOcPoi2kofuMAD20Nlwued1hXhrnk+49kHjBqydUotYgT6/ebne
	WFdCbEKiMcs+auGQcmuirnDW6t0RZoKh0GqVpxksBeCi5McidRYIhoobbAERrnmOjZDe
	fMPgfA2afmjXFAnqNhuLkCkmlF75V3R4zrShYFyzT5xfVp5Ql36DoP/4G7Jh0r27u4jB
	/z2A==
Received: by 10.216.114.3 with SMTP id b3mr1444110weh.90.1342646423089;
	Wed, 18 Jul 2012 14:20:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm367289wix.6.2012.07.18.14.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:19 +0200
Message-Id: <69d42afc513922c50f5606f220e3f3772bba5938.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 09/14] e-wm: update LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:41 -0000

* Copyright year was updated in r73192

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 0c9ad93..3e1a660 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas eina ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.7.8.6



