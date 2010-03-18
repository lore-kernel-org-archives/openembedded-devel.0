Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NsIrJ-0000V7-DB
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:47:53 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Mar 2010 17:42:00 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Mar 2010 17:41:59 +0100
Received: from jcn ([82.57.79.31]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 18 Mar 2010 17:41:58 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NsInF-0002tl-UG; Thu, 18 Mar 2010 17:41:57 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Mar 2010 17:41:56 +0100
Message-Id: <1268930516-11113-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 18 Mar 2010 16:41:58.0977 (UTC)
	FILETIME=[ED86E310:01CAC6B9]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Update vala-dbus-binding-tool.inc
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
X-List-Received-Date: Thu, 18 Mar 2010 16:48:32 -0000

HOMEPAGE and SRC_URI changed at freesmartphone.org

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 .../vala-dbus-binding-tool.inc                     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index 96c2836..b28079c 100644
--- a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -1,11 +1,11 @@
 DESCRIPTION = "Vala DBus Binding Tool"
 SECTION = "devel"
 DEPENDS = "vala libgee libxml2 intltool-native"
-HOMEPAGE = "http://www.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
+HOMEPAGE = "http://wiki.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
 LICENSE = "GPLv2"
-INC_PR = "r2"
+INC_PR = "r3"
 
-SRC_URI = "http://www.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
+SRC_URI = "http://downloads.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
 
 inherit autotools_stage
 
-- 
1.7.0



