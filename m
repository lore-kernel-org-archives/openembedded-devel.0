Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJcW-0005JH-VV
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 13:59:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CD540314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id WX7bSlzS7ve8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:11 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 45295314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:10 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 12:58:10 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 12:58:06 +0000
Message-Id: <1291813088-23444-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
References: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] conf/local.conf.sample: remove unused variable CVS_TARBALL_STASH
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
X-List-Received-Date: Wed, 08 Dec 2010 12:59:45 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 conf/local.conf.sample |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 1085163..ac42f29 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -176,10 +176,6 @@ IMAGE_FSTYPES = "jffs2 tar"
 # Uncomment this if you want BitBake to emit the log if a build fails.
 BBINCLUDELOGS = "yes"
 
-# Specifies a location to search for pre-generated tarballs when fetching
-# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
-#CVS_TARBALL_STASH = ""
-
 # Uncomment this if you want to install shared libraries directly under their SONAME,
 # rather than installing as the full version and symlinking to the SONAME.
 # PACKAGE_SNAP_LIB_SYMLINKS = "1"
-- 
1.7.2.3



