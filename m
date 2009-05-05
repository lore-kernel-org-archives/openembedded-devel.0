Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M1HzZ-0007aj-9L
	for openembedded-devel@openembedded.org; Tue, 05 May 2009 12:35:20 +0200
Received: (qmail 12431 invoked by uid 813007); 5 May 2009 10:29:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 May 2009 10:29:24 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2009 12:28:54 +0200
Message-Id: <1241519336-28278-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1241519336-28278-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1241519336-28278-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 1/2] sane-srcrevs.inc: bump linux-bug to get Ethernet using MAC from U-boot
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
X-List-Received-Date: Tue, 05 May 2009 10:35:29 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 8962174..64781eb 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -111,7 +111,7 @@ SRCREV_pn-libowl ?= "277"
 SRCREV_pn-libxcalibrate ?= "209d83af61ed38a002c8096377deac292b3e396c"
 SRCREV_pn-libxosd ?= "627"
 SRCREV_pn-linux-bfin ?= "3758"
-SRCREV_pn-linux-bug ?= "8918"
+SRCREV_pn-linux-bug ?= "8996"
 SRCREV_pn-linux-hackndev-2.6 ?= "1308"
 SRCREV_pn-linux-ixp4xx ?= "1089"
 SRCREV_pn-linux-openmoko-2.6.24 ?= "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
-- 
1.6.3.rc0





