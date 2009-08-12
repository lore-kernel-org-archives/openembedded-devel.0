Received: from [151.189.21.45] (helo=mail-in-05.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1MbM6c-0004ji-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 00:15:38 +0200
Received: from mail-in-15-z2.arcor-online.net (mail-in-15-z2.arcor-online.net
	[151.189.8.32]) by mx.arcor.de (Postfix) with ESMTP id 2944B332A3B;
	Wed, 12 Aug 2009 23:59:09 +0200 (CEST)
Received: from mail-in-10.arcor-online.net (mail-in-10.arcor-online.net
	[151.189.21.50])
	by mail-in-15-z2.arcor-online.net (Postfix) with ESMTP id 1B35A724750; 
	Wed, 12 Aug 2009 23:59:09 +0200 (CEST)
Received: from localhost.localdomain (p5B3B1B4E.dip.t-dialin.net [91.59.27.78])
	(Authenticated sender: leggewie@arcor.de)
	by mail-in-10.arcor-online.net (Postfix) with ESMTPSA id 6A52828EE56;
	Wed, 12 Aug 2009 23:59:07 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-10.arcor-online.net 6A52828EE56
From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 23:58:53 +0200
Message-Id: <1250114333-22259-1-git-send-email-oe-devel@rolf.leggewie.biz>
X-Mailer: git-send-email 1.6.3.3
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] base.bbclass: ftp.matrix.com.br no longer exists
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
X-List-Received-Date: Wed, 12 Aug 2009 22:15:38 -0000

---
 classes/base.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index ef6c0ab..5363e5c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1279,7 +1279,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool
 ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu
-${GNU_MIRROR}	ftp://ftp.matrix.com.br/pub/gnu
 ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu
 ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu
 ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu
-- 
1.5.4.3



