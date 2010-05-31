Received: from smtp-out115.alice.it ([85.37.17.115])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1oE-0002XV-0N
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:01:26 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out115.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:11 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:11 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:10 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j5-0007XP-Vm; Mon, 31 May 2010 11:56:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:57 +0200
Message-Id: <1275299757-28908-13-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:10.0591 (UTC)
	FILETIME=[7F5386F0:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.115
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 12/12] frameworkd_git.bb: bump SRCREV
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
X-List-Received-Date: Mon, 31 May 2010 10:01:26 -0000

ogsmd has now some more reliable support for the Freescale Neptune modem
used in Motorola EzX phones.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/freesmartphone/frameworkd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/freesmartphone/frameworkd_git.bb b/recipes/freesmartphone/frameworkd_git.bb
index 395a137..3d72d8f 100644
--- a/recipes/freesmartphone/frameworkd_git.bb
+++ b/recipes/freesmartphone/frameworkd_git.bb
@@ -4,9 +4,9 @@ AUTHOR = "FreeSmartphone.Org Development Team"
 SECTION = "console/network"
 DEPENDS = "python-cython-native python-pyrex-native"
 LICENSE = "GPL"
-SRCREV = "93673aa09cafc8fb5cfc3cb4055a73e25e595b70"
+SRCREV = "7ee718456af30a7ab1069c4fad0fd33be319c2c8"
 PV = "0.9.5.9+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 inherit distutils update-rc.d python-dir
-- 
1.7.1



