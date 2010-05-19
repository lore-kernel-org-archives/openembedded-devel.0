Received: from ip-70-38-54-39.static.privatedns.com
	([70.38.54.39] helo=ginevra.hungrycats.org ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <postmaster@ginevra.hungrycats.org>)
	id 1OEq1U-0003U3-Dz for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 22:37:49 +0200
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
Received: from gibbs.hungrycats.org (gibbs.vpn7.hungrycats.org [10.132.226.42])
	by ginevra.hungrycats.org (Postfix) with ESMTP id 861722C013;
	Wed, 19 May 2010 16:24:57 -0400 (EDT)
Received: from zblaxell by gibbs.hungrycats.org with local (Exim 4.69)
	(envelope-from <oe-dev-esightcorp@mailtoo.hungrycats.org>)
	id 1OEpox-0007Mw-DP; Wed, 19 May 2010 16:24:51 -0400
From: Zygo Blaxell <oe-dev-esightcorp@mailtoo.hungrycats.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 May 2010 16:24:22 -0400
Message-Id: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 70.38.54.39
X-SA-Exim-Mail-From: postmaster@ginevra.hungrycats.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Update libsdl-directfb to version 1.2.14 and make it build again
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
X-List-Received-Date: Wed, 19 May 2010 20:37:49 -0000

libsdl-directfb 1.2.11 doesn't build with current org.openembedded.dev,
failing with CROSS COMPILE Badness, missing headers, and other problems.

 recipes/libsdl/{libsdl-x11-1.2.14 => files}/sdl.m4 |    0
 recipes/libsdl/libsdl-directfb_1.2.14.bb           |   56 ++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)



