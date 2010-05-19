Received: from ip-70-38-54-39.static.privatedns.com
	([70.38.54.39] helo=ginevra.hungrycats.org ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <postmaster@ginevra.hungrycats.org>)
	id 1OEq1U-0003U2-Lp for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 22:37:50 +0200
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
Received: from gibbs.hungrycats.org (gibbs.vpn7.hungrycats.org [10.132.226.42])
	by ginevra.hungrycats.org (Postfix) with ESMTP id 92CBF2C01A;
	Wed, 19 May 2010 16:24:57 -0400 (EDT)
Received: from zblaxell by gibbs.hungrycats.org with local (Exim 4.69)
	(envelope-from <oe-dev-esightcorp@mailtoo.hungrycats.org>)
	id 1OEpox-0007My-Dx; Wed, 19 May 2010 16:24:51 -0400
From: Zygo Blaxell <oe-dev-esightcorp@mailtoo.hungrycats.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 May 2010 16:24:23 -0400
Message-Id: <1274300664-27902-2-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
References: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
X-SA-Exim-Connect-IP: 70.38.54.39
X-SA-Exim-Mail-From: postmaster@ginevra.hungrycats.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libsdl-directfb: move sdl.m4 to common files/
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
X-List-Received-Date: Wed, 19 May 2010 20:37:50 -0000

This prepares for a new recipe which also uses sdl.m4.
---
 recipes/libsdl/{libsdl-x11-1.2.14 => files}/sdl.m4 |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes/libsdl/{libsdl-x11-1.2.14 => files}/sdl.m4 (100%)

diff --git a/recipes/libsdl/libsdl-x11-1.2.14/sdl.m4 b/recipes/libsdl/files/sdl.m4
similarity index 100%
rename from recipes/libsdl/libsdl-x11-1.2.14/sdl.m4
rename to recipes/libsdl/files/sdl.m4
-- 
1.7.1



