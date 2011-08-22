Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QvauW-0000nE-Ot
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:15:52 +0200
Received: by wwe32 with SMTP id 32so4420051wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0wU11xNWE9fjK4FldTLQfi0jOcTj+vt/VWl2pUP9/yc=;
	b=D0xGHf7Xb441CEH7oQzrlhSAIn+aPSjaePGm2rPoSFlk3+WfYjL5BJppAkvgVfdvVW
	TtXm0nhqO38uqeg7EdhvffmrGN12wufCPe1H8IzwXAL2pxqmsKkk7BPLSoIaeHBva7E8
	Gu8BdOlvggi0ai5Y934qCbf//KbPw6fRWNaFU=
Received: by 10.216.177.68 with SMTP id c46mr2300192wem.98.1314043868374;
	Mon, 22 Aug 2011 13:11:08 -0700 (PDT)
Received: from localhost.localdomain (169.pool85-50-86.dynamic.orange.es
	[85.50.86.169])
	by mx.google.com with ESMTPS id fj19sm1064313wbb.66.2011.08.22.13.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:11:07 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:10:13 +0200
Message-Id: <1314043813-10117-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl] elfe: Add LIC_FILES_CHKSUM to recipe
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
X-List-Received-Date: Mon, 22 Aug 2011 20:15:52 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/elfe_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 8b8f09d..b5126f9 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,4 +1,5 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.7.6



