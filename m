Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1PDcI3-0005Vx-Rs
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 13:18:09 +0100
Received: from jcn (80.116.251.53) by smtp205.alice.it (8.5.124.08)
	id 4C1A264509381AE4; Wed, 3 Nov 2010 13:17:17 +0100
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1PDcHD-0004mC-Pb; Wed, 03 Nov 2010 13:17:16 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 13:17:12 +0100
Message-Id: <1288786633-18309-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
References: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzdata: bump version to 2010o
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
X-List-Received-Date: Wed, 03 Nov 2010 12:18:09 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 .../tzdata/{tzdata_2010m.bb => tzdata_2010o.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/tzdata/{tzdata_2010m.bb => tzdata_2010o.bb} (62%)

diff --git a/recipes/tzdata/tzdata_2010m.bb b/recipes/tzdata/tzdata_2010o.bb
similarity index 62%
rename from recipes/tzdata/tzdata_2010m.bb
rename to recipes/tzdata/tzdata_2010o.bb
index 42db5e3..ab5ecba 100644
--- a/recipes/tzdata/tzdata_2010m.bb
+++ b/recipes/tzdata/tzdata_2010o.bb
@@ -6,5 +6,5 @@ require tzdata.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tar.md5sum] = "9e33cb126c8cb6673f39390d347fb0e2"
-SRC_URI[tar.sha256sum] = "1454a13a32e23e81195404d00ab97a64a356e9a5852fc7d121ed7e58cbdb75aa"
+SRC_URI[tar.md5sum] = "5cae5c56fad81dc29f8fcd933a05768e"
+SRC_URI[tar.sha256sum] = "cd0f3799688b3b870cd988505e47c2975b1808e73ec0677bc9db4b705b534c07"
-- 
1.7.2.3



