Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Ngc0V-0005Vf-P1
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 11:47:22 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 14 Feb 2010 11:43:37 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 14 Feb 2010 11:43:38 +0100
Received: from badebec ([87.3.192.228]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 14 Feb 2010 11:43:37 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Ngbwt-0001Oz-KG; Sun, 14 Feb 2010 11:43:35 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2010 11:43:22 +0100
Message-Id: <1266144202-5360-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.6.6.2
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 14 Feb 2010 10:43:37.0353 (UTC)
	FILETIME=[90576F90:01CAAD62]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Update tzdata_2009s to tzdata_2009u
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
X-List-Received-Date: Sun, 14 Feb 2010 10:47:22 -0000

The archive for tzdata_2009s is not available at $SRC_URI anymore.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 .../tzdata/{tzdata_2009s.bb => tzdata_2009u.bb}    |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes/tzdata/{tzdata_2009s.bb => tzdata_2009u.bb} (100%)

diff --git a/recipes/tzdata/tzdata_2009s.bb b/recipes/tzdata/tzdata_2009u.bb
similarity index 100%
rename from recipes/tzdata/tzdata_2009s.bb
rename to recipes/tzdata/tzdata_2009u.bb
-- 
1.6.6.2



