Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbHhU-0001DS-5M
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:42:28 +0200
Received: by yib18 with SMTP id 18so2108672yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=pQwBipphpnjbRxyimjbdtE1jCty4iLytE6SD9OI7Mvc=;
	b=CZaOXakiWxck1/Ceg3JRmYWKV9FFb3uGZ0lWVR864bhJ9396KaQCdyBVZUCx4dSmz/
	snp6+I8pyyUVrBab/TD/5NolcjTEjm2MuXcsic+RgS1YKWWY4ULAFu+Maob8aTLKiDfc
	z869WixrHwhcKmMLV3FL7cife/PBFvWDsoYtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=QijQ1GYbt+ronL47eKfXaqR/lahOvurd7ICPMCvzRWzHrrjjPAe2D8K/Oec0FfhRTR
	RVzNoY/tjKC1N1wWGUoS5mWLio2U1FTzfPn/sPyCKFRiVDdD3Xq+iTaUvDaIeJFAI9Bg
	HSEsFvtTzXdbVsA4aZuRwvqwRZZIrmkzhPVhk=
Received: by 10.150.251.9 with SMTP id y9mr3954097ybh.371.1309203527335;
	Mon, 27 Jun 2011 12:38:47 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e24sm3675890yhk.51.2011.06.27.12.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:38:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 19:38:25 +0000
Message-Id: <f441489e8e744b0125c7dce7e9cb2f9ce0798971.1309203431.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 4/4] inih: bump SRCREV to sync with upstream r12
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
X-List-Received-Date: Mon, 27 Jun 2011 19:42:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index f750bdb..fbdb520 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -6,10 +6,10 @@ PKGV = "${GITPKGVTAG}"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 
-PR = "r1"
+PR = "r2"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "af230b4c7ef2529413ffc37cee513ef8f35c9598"
+SRCREV = "7ab5f69cde1e921f58d0ef00fa8039d8ea311226"
 SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



