Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV7XY-0000Us-K9
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 21:11:00 +0100
Received: by ggnh1 with SMTP id h1so1523634ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=17oNloD7hBPNroksHb2mqMlIs8YYusWojaP4W4ZTOQk=;
	b=aRHejw0j8nv1QnvVE7sKy2Hqei29JxipFOvFX1HhVUpbz5n+sDIKfTC4w8RdyMR+4H
	xM9hKGnbr8xT7DUch0F56evFuYmHFxaXd8xlZ0ePfS1NSGKUtFYjdN41DWRnjplXItrX
	zirK3odYWUfkdjHsN6R/XWCdywLfYbqYdMAQ4=
Received: by 10.236.131.97 with SMTP id l61mr26934892yhi.52.1322510662036;
	Mon, 28 Nov 2011 12:04:22 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k21sm22610168yhj.3.2011.11.28.12.04.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 12:04:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 20:04:07 +0000
Message-Id: <9a3fc5d37c4cacfbfde28a1cea5fdec58222ded5.1322510613.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322510613.git.otavio@ossystems.com.br>
References: <cover.1322510613.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322510613.git.otavio@ossystems.com.br>
References: <cover.1322510613.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] libinih: bump SRCREV
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
X-List-Received-Date: Mon, 28 Nov 2011 20:11:00 -0000

This version adds support to enumerate the sessions.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index f8fd3e3..cb52503 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -5,10 +5,10 @@ PKGV = "${GITPKGVTAG}"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 
-PR = "r2"
+PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "7ab5f69cde1e921f58d0ef00fa8039d8ea311226"
+SRCREV = "7a43a3655ceffa9f0f7fd68262d8d478c6d0d0af"
 SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



