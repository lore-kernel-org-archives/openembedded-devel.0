Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Sbm-0000Wp-Tz
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:13:10 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=YZn+UU5lY7UrsQQd/t7shPN5z1IUKhFZP4ps7InKkfY=;
	b=LlXuTS4Z0KvMoV32kvI1B4/5wTLDG7dB2Wm3d6Ro5UZKV+tBRw86GvjZG7cuzi7aHv
	OImEwTsn25wVd0YI7smA7kp/rxfLHOgRbFWiGqoBnYI+Iu3cK9S03GG3H9WzRBZ4YlXp
	zYhb3VGLqR/PDdP4o2ErarniR0W1BzyugVdDo=
Received: by 10.223.100.152 with SMTP id y24mr1336526fan.63.1316156880857;
	Fri, 16 Sep 2011 00:08:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l20sm9479443fad.12.2011.09.16.00.07.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:07:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:07:48 +0200
Message-Id: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156827.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1316156827.git.Martin.Jansa@gmail.com>
References: <cover.1316156827.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] enjoy: Add var LIC_FILES_CHKSUM to recipe
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
X-List-Received-Date: Fri, 16 Sep 2011 07:13:11 -0000

From: pespin <pespin.shar@gmail.com>

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.7.6.1



