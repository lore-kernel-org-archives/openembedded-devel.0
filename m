Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q4CNc-0004Wy-Gr
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 15:21:12 +0200
Received: from jcn (82.57.78.141) by smtp208.alice.it (8.5.124.08)
	id 4C1A2716158CEFE1; Mon, 28 Mar 2011 15:13:36 +0200
Received: from ao2 by jcn with local (Exim 4.74)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Q4CFQ-0005sS-3g; Mon, 28 Mar 2011 15:12:44 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Mar 2011 15:12:34 +0200
Message-Id: <1301317955-22559-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
References: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [PATCH 1/2] tzdata: Updated to 2011d
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
X-List-Received-Date: Mon, 28 Mar 2011 13:21:12 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 .../tzdata/{tzdata_2011b.bb => tzdata_2011d.bb}    |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename recipes/tzdata/{tzdata_2011b.bb => tzdata_2011d.bb} (64%)

diff --git a/recipes/tzdata/tzdata_2011b.bb b/recipes/tzdata/tzdata_2011d.bb
similarity index 64%
rename from recipes/tzdata/tzdata_2011b.bb
rename to recipes/tzdata/tzdata_2011d.bb
index 158f4ce..ca225bf 100644
--- a/recipes/tzdata/tzdata_2011b.bb
+++ b/recipes/tzdata/tzdata_2011d.bb
@@ -6,6 +6,5 @@ require tzdata.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
-
+SRC_URI[md5sum] = "03c5793502b7c41985edd73146bf7e36"
+SRC_URI[sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
-- 
1.7.4.1



