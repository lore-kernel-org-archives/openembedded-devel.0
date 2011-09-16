Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Sci-0000Wp-JT
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:14:08 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=YZn+UU5lY7UrsQQd/t7shPN5z1IUKhFZP4ps7InKkfY=;
	b=KZkfff3PCiWQhPgMeRefiE7o1+qxCYeiHjxgRmLrz8rh18C0pWc6Fzxwdi7/2sKSDf
	aEQUNyyOkfcaxtNKXFy/FdpmDsVea3dWcDj5H4ut7+ldTCPtxbWxNO6iOYMQi9123TUK
	zkn61fx+u2rI1hlNNT5gamuuS/0EU7oBfpBhg=
Received: by 10.223.41.153 with SMTP id o25mr1995546fae.79.1316156938548;
	Fri, 16 Sep 2011 00:08:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm9482507fae.13.2011.09.16.00.08.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:08:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:08:46 +0200
Message-Id: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156746.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1316156746.git.Martin.Jansa@gmail.com>
References: <cover.1316156746.git.Martin.Jansa@gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2011 07:14:08 -0000

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



