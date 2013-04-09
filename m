Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UPf9y-000439-QA
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 22:28:56 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 86DFFEA040
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2013 22:18:48 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id B155DA4071C; Tue,  9 Apr 2013 22:12:02 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2013 22:11:51 +0200
Message-Id: <cover.1365536829.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20130409102828.GB2474@jama>
References: <20130409102828.GB2474@jama>
Subject: [meta-oe][PATCH 0/1] Pull request 20130409
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
X-List-Received-Date: Tue, 09 Apr 2013 20:29:08 -0000

Hello Martin,

Added LIC_FILES_CHKSUM variable to the ttf-inconsolata recipe.
I tested it by building successfully on top of master; should have
done so in the first place, sorry for the inconvenience.

Please pull into meta-oe.

The following changes since commit b07f0a239e7ee2b81157399b6befa811a5009813:

  gd: Add mirror for when libgd.org is down (2013-04-08 14:12:24 +0200)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-oe.git add-inconsolata-chksum

Apelete Seketeli (1):
  ttf-inconsolata: add LIC_FILES_CHKSUM variable

 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.10.4



