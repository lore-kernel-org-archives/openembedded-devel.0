Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHl-0007eE-AG
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:29 +0200
Received: by ywl5 with SMTP id 5so2895458ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=PS1sRW9ER09DqCZCP4OqMxkL1zuHX6hNG4tfLexBy0A=;
	b=EHiQWVzDeHJXuUb2oZ51qTU51WtGusUSMP8Qbq+sej0Tgf78ltSLa9ciB/PjHnAixM
	hM7Z5x2scUR6FSJqwNZ6A32T1QnzXh+xELMlSaMic2isS4Bf632AL2hqbn+rVS485S6i
	yBzc7qEEr+SoDPeJFeLKqmqK4rcMdcDm+VMZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hscrxNoAvOj0PZuBAtFKQ9FBbeC/BS4Q5prO4dvCfHyantXsIWw4FEFThdvDFEPB4D
	QQP1W9Z+21KOQd13dm6fbJnvzyBFOYGNpacN7JSC8r3rVZzWTK9pIhayc166LD+4XlJM
	h+BvGioNPoaDXWYuJHqLl+U4+BzEeh7zABvBo=
Received: by 10.151.44.11 with SMTP id w11mr3709832ybj.197.1287668025851;
	Thu, 21 Oct 2010 06:33:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:45 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:15 -0500
Message-Id: <1287668010-11310-8-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 07/22] git: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:39 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/git/git.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index bbbd7e9..003d7fa 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The git revision control system used by the Linux kernel developers"
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=src"
 
-- 
1.7.0.4



