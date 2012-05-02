Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPWA4-0007Hi-7v
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:47:53 +0200
Received: by bkcjm2 with SMTP id jm2so279051bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=k2i1jQ6mQQ8jcGbNrE9GScUM5c+8xyLPyk6SN7OgkF4=;
	b=S4LDBMDMuCCRdTXX2JAdmadxJ4jIglUM+yAVJ14fiXVxBDDpDJL4gk0DoAw2Mkhc9T
	kRaZ0eVkJ2TQQq9iaRAk2PvvWBt3C+mY3amobGWp+I97LzInPTNdakdM2qIl3LLVCeGT
	51AurVuWUQXegfmRgarOYD55ZdQTLGTgRCV01K0pPzczvD1BtMiRx5iWMQc7v8GucrPW
	7mZKYF9ej9QXjDjmKr7FyftQE6uBY1QOEbySm950sV4DPBb3I3LGSJwWPGKWvU8Qu2Vf
	WpU2eNm7amZCmExegyxmYat/yuorRKCqUs1eBcmYL5AWua3sxJxTF3egJLov1e7QBpHM
	fUuw==
Received: by 10.204.133.220 with SMTP id g28mr1229904bkt.54.1335951488313;
	Wed, 02 May 2012 02:38:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id zx16sm2329950bkb.13.2012.05.02.02.38.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:38:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:38:02 +0200
Message-Id: <1335951482-28505-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 12/12] vala-dbus-biniding-tool: bump SRCREV
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
X-List-Received-Date: Wed, 02 May 2012 09:47:54 -0000

* also needed to rebuild after libgee upgrade

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-dbus-binding-tool_git.bb                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index 66df4ed..30a7edd 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -1,5 +1,5 @@
 require vala-dbus-binding-tool.inc
-SRCREV = "fd89af4941d6478575900128d09029fa5549e0db"
+SRCREV = "2c72ff9c981be947837c72d3aa38e1fbf074068f"
 PV = "0.3.2+gitr${SRCPV}"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
-- 
1.7.8.6



