Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q4CMe-0004NN-HI
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 15:20:12 +0200
Received: from jcn (82.57.78.141) by smtp208.alice.it (8.5.124.08)
	id 4C1A2716158CEBF8; Mon, 28 Mar 2011 15:13:00 +0200
Received: from ao2 by jcn with local (Exim 4.74)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Q4CFQ-0005sU-J7; Mon, 28 Mar 2011 15:12:44 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Mar 2011 15:12:35 +0200
Message-Id: <1301317955-22559-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
References: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [PATCH 2/2] tzcode-native: update to 2011d
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
X-List-Received-Date: Mon, 28 Mar 2011 13:20:12 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 ...code-native_2011b.bb => tzcode-native_2011d.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011d.bb} (51%)

diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011d.bb
similarity index 51%
rename from recipes/tzcode/tzcode-native_2011b.bb
rename to recipes/tzcode/tzcode-native_2011d.bb
index 30996d9..1cc7757 100644
--- a/recipes/tzcode/tzcode-native_2011b.bb
+++ b/recipes/tzcode/tzcode-native_2011d.bb
@@ -6,11 +6,11 @@ require tzcode-native.inc
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2011b"
+TZDATA_PV = "2011d"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
-SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
-SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
+SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
+SRC_URI[tzcode-2011d.sha256sum] = "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
+SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
+SRC_URI[tzdata-2011d.sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
-- 
1.7.4.1



