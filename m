Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoM-0006aY-U6
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:41 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bmP/CE40cL9y8PwonqPms1SMMkeLA4tNs/fOkeDbJdU=;
	b=wgamCRXVtJlarXw9q38xkYS+rIJhovf6YrnKDTQ811c2NPJlkhxtMBpJkEk8Y+xJD1
	j4ZyVifSBsQIfDAnxNAHpbyp0F/Hz8zr3lQv1loL0TdHk2FEcuflCsCyrlQRH76BhC2b
	cLzNdk9K+lqihD8db8iwnpfFAYReUVqR/LhOw=
Received: by 10.223.81.196 with SMTP id y4mr26627fak.6.1318894552119;
	Mon, 17 Oct 2011 16:35:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v19sm178191faa.13.2011.10.17.16.35.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:35:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:22 +0200
Message-Id: <3e66a8dddbac14675304a49dad4c2258844677c1.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 03/10] e-wm-illume-dict-pl: fix licensing information
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
index e07de94..bfab3c9 100644
--- a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
+++ b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "Polish dictionary for Illume keyboard"
 SECTION = "x11/data"
-SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
+SRCREV = "38fdd9bb0d8296e984bb6443466801eea6f62f00"
 PV = "1.0+gitr${SRCPV}"
 PE = "1"
 PR = "r0"
-LICENSE = "unknown"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
 
-- 
1.7.7



