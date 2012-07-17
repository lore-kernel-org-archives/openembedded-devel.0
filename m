Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrGf2-0002iO-2g
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 00:54:32 +0200
Received: by wgbdr1 with SMTP id dr1so758044wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uAebwqpS5UANloW3IChnW4h/xPjKQ64T240OmFd9ucA=;
	b=PBCBW9bc1JJsOp/a8nQubKLqdb8aEjSvtELWSYcQ18g2g9BPPyUQOkOfAchGvy2/9u
	K3AdeA0kP2HEfwgL233JoFEXsshPJDsaIaXHT3ldXb9SVxQUS/I/qnDhuesXZjfGitnk
	QApD2GgORu1YKB7qnEgz0BDfTRlk91kUq78tInESHY5mSziwIghXUFlaKz72HQmqiPsZ
	bSiaEdKOpqByxPPnErVoPBta5ROI6SmlBGKHYA0v4tyqxHstZ9e00g2WL/Xt+TEROqfg
	9PPVCWUblqJRfa9hf2Ib9cUCUT4gXHhT3OkzeYw3PBs+QpdOf+GRLwL0Qrd1r7CQK8NN
	pXhA==
Received: by 10.216.133.130 with SMTP id q2mr392056wei.131.1342564992447;
	Tue, 17 Jul 2012 15:43:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm29363958wib.8.2012.07.17.15.43.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 15:43:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:43:12 +0200
Message-Id: <1342564992-18614-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342564992-18614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342564992-18614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] gsettings-desktop-schemas: add SRC_URI checksums
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
X-List-Received-Date: Tue, 17 Jul 2012 22:54:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gsettings-desktop-schemas_3.0.1.bb             |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gsettings-desktop-schemas_3.0.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gsettings-desktop-schemas_3.0.1.bb
index ef9bc67..a830905 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gsettings-desktop-schemas_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gsettings-desktop-schemas_3.0.1.bb
@@ -13,3 +13,5 @@ fi
 glib-compile-schemas ${datadir}/glib-2.0/schemas
 }
 
+SRC_URI[archive.md5sum] = "d42f0d79d6449a0eb1bb502eee8eb709"
+SRC_URI[archive.sha256sum] = "6e72158a0e70ae50b8bb992e1486dd2fda43207f4ec4eb03a0d769f210363fd9"
-- 
1.7.8.6



