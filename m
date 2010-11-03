Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1PDcI3-0005Vv-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 13:18:10 +0100
Received: from jcn (80.116.251.53) by smtp205.alice.it (8.5.124.08)
	id 4C1A264509381ADB; Wed, 3 Nov 2010 13:17:16 +0100
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1PDcHD-0004m6-Fl; Wed, 03 Nov 2010 13:17:15 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 13:17:11 +0100
Message-Id: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.2.3
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
Subject: [PATCH 0/2] Update tzcode and tzdata to latest versions
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
X-List-Received-Date: Wed, 03 Nov 2010 12:18:10 -0000

Hi,

here are some tzdata/tzcode updates.

Side Note: I played with "git format-patch -M" to detect renames and I kind of
like the result, this way reviewing the changes is easier and from git point
of view the end result is equivalent to a delete/add when applying the
patches.

I am going to push the changes in a few hours if nobody objects.

Thanks,
   Antonio

Antonio Ospite (2):
  tzdata: bump version to 2010o
  tzcode-native: bump version to 2010n

 ...code-native_2010m.bb => tzcode-native_2010n.bb} |   10 +++++-----
 .../tzdata/{tzdata_2010m.bb => tzdata_2010o.bb}    |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename recipes/tzcode/{tzcode-native_2010m.bb => tzcode-native_2010n.bb} (51%)
 rename recipes/tzdata/{tzdata_2010m.bb => tzdata_2010o.bb} (62%)

-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?


