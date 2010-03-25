Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuqmW-0004zA-Io
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:23:45 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:33 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:33 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:30 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqj4-0006tQ-5V; Thu, 25 Mar 2010 18:20:10 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:56 +0100
Message-Id: <1269537597-26456-5-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:32.0933 (UTC)
	FILETIME=[79A4CD50:01CACC3F]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 4/5] ezx: update ezx-gen-blob version
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
X-List-Received-Date: Thu, 25 Mar 2010 17:23:45 -0000

NOTE: this version builds fine but the resulting binaries do not seem to
be correct, their size is about 300KiB instead of the expected 64KiB.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 1b4972a..8451e3d 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -56,7 +56,7 @@ SRCREV_pn-epdfview ?= "346"
 SRCREV_pn-epiphany ?= "7837"
 SRCREV_pn-essential-dialer ?= "194"
 SRCREV_pn-ezx-boot-usb-native ?= "2512"
-SRCREV_pn-ezx-gen-blob ?= "2426"
+SRCREV_pn-ezx-gen-blob ?= "2517"
 SRCREV_pn-ezxd ?= "2513"
 SRCREV_pn-fbgrab-viewer-native ?= "1943"
 SRCREV_pn-flashrom ?= "3682"
-- 
1.7.0.3



