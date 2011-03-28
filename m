Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q4CN7-0004SC-Ej
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 15:20:41 +0200
Received: from jcn (82.57.78.141) by smtp205.alice.it (8.5.124.08)
	id 4D0D0038088C481F; Mon, 28 Mar 2011 15:12:50 +0200
Received: from ao2 by jcn with local (Exim 4.74)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Q4CFP-0005sQ-DK; Mon, 28 Mar 2011 15:12:43 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Mar 2011 15:12:33 +0200
Message-Id: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.4.1
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [PATCH 0/2] Usual tzdata tzcode updates
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
X-List-Received-Date: Mon, 28 Mar 2011 13:20:41 -0000

I am going to push these in a couple of hours.

Antonio Ospite (2):
  tzdata: Updated to 2011d
  tzcode-native: update to 2011d

 ...code-native_2011b.bb => tzcode-native_2011d.bb} |   10 +++++-----
 .../tzdata/{tzdata_2011b.bb => tzdata_2011d.bb}    |    5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011d.bb} (51%)
 rename recipes/tzdata/{tzdata_2011b.bb => tzdata_2011d.bb} (64%)

-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?


