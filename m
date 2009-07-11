Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPQmy-0000Oq-Ka
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 02:50:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2E36A505C1D;
	Fri, 10 Jul 2009 20:37:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28707-09; Fri, 10 Jul 2009 20:37:09 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E85C3505C54; Fri, 10 Jul 2009 20:37:08 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2D1664FCFB0;
	Fri, 10 Jul 2009 20:37:05 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 12403A26460; Fri, 10 Jul 2009 20:37:04 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 20:36:58 -0400
Message-Id: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/4] xf86-input-elographics: add 1.2.3
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
X-List-Received-Date: Sat, 11 Jul 2009 00:50:04 -0000

Fixes build with xserver-xorg 1.6.1.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 conf/checksums.ini                                 |    4 ++++
 ...cs_1.1.0.bb => xf86-input-elographics_1.2.3.bb} |    0
 2 files changed, 4 insertions(+), 0 deletions(-)
 copy recipes/xorg-driver/{xf86-input-elographics_1.1.0.bb => xf86-input-elographics_1.2.3.bb} (100%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a29274d..b9a2d85 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25482,6 +25482,10 @@ sha256=1583e1dae6e3ecd34ba55deae7dfc052efede0378f852de6224308d7e7d5b2d8
 md5=50a9c32af12ca4733afe23042f012f9c
 sha256=76ded0e6977f7d562a8236bc810423cd050320531be9621d868a48309ebc4d63
 
+[http://xorg.freedesktop.org/releases/individual/driver/xf86-input-elographics-1.2.3.tar.bz2]
+md5=cc2923460c8eff9652b01889a063058d
+sha256=67550c8f4a85a8029f08880adf487e2efd4585e7adbe8da357fbd49750b08d8f
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/driver/xf86-input-elographics-X11R7.0-1.0.0.5.tar.bz2]
 md5=24c33f833bb2db72a07c3d28bfc0aae9
 sha256=f1b7f84175d33f4d18c83cd0d37bd3962acd668922fa074a8ae29e18517cdda7
diff --git a/recipes/xorg-driver/xf86-input-elographics_1.1.0.bb b/recipes/xorg-driver/xf86-input-elographics_1.2.3.bb
similarity index 100%
copy from recipes/xorg-driver/xf86-input-elographics_1.1.0.bb
copy to recipes/xorg-driver/xf86-input-elographics_1.2.3.bb
-- 
1.6.3



