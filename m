Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHf-0007Zc-4t
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:23 +0200
Received: by yxt3 with SMTP id 3so2495892yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7zosTitTLmDhMRd6q2ne+jYyMM57kLE+Th+L2uIy8bs=;
	b=i04vy+j+7R56PBv0RwErNy17bsponSvwjnwyR+ENIsbGg8LxMMOmI4vAMzrBPA2MaK
	gGnrWz8qgYd4KyVr7TcVNud9hRLkyRMnrP0zijANIV19rCkriEVVK/pRBZ/rm5nzXEzr
	Q419xQ/rAIDdrMfkma96SAklKqOWivmhif4cQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Llinr2VKBYBnzI6ApoBhCyUZy10M/WuUXHetnDDASbYRvu+HJ0TMu6L1slBkixw30+
	EngQlZnN9bol5NApZY7fDF2h0iMC903FrpJuQBAz+GOTuI+ILpISzobnNsWL4Cj7trtH
	2tpN3lz4gt7mX00JBw3IfbVww/Nz04Fi0092A=
Received: by 10.150.12.15 with SMTP id 15mr3780970ybl.175.1287668022032;
	Thu, 21 Oct 2010 06:33:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:41 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:13 -0500
Message-Id: <1287668010-11310-6-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 05/22] e2fsprogs: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:23 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/e2fsprogs/e2fsprogs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 37d3b6d..7697440 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "EXT2 Filesystem Utilities"
 HOMEPAGE = "http://e2fsprogs.sf.net"
-LICENSE = "GPL"
+LICENSE = "GPLv2+|LGPLv2+|NewBSD|MIT"
 SECTION = "base"
 DEPENDS = "gettext-native util-linux-ng"
 DEPENDS_virtclass-native = "gettext-native util-linux-ng-native"
-- 
1.7.0.4



