Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UMbPs-0007Ps-DC
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 11:52:40 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id CAC02EA042
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2013 11:45:12 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A2CD9A4063C; Mon,  1 Apr 2013 11:35:50 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 11:35:46 +0200
Message-Id: <cover.1364807977.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/1] Pull request 20130401
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
X-List-Received-Date: Mon, 01 Apr 2013 09:52:40 -0000

Hello,

The patch that comes as a follow-up of this message adds the
ttf-inconsolata font recipe from "oe-classic".
The font is intended to be used by the JLime distribution which is
currently being ported to oe-core.

The modifications are done on top of the master branch in the meta-oe
layer.
Please pull into the meta-oe layer.

The following changes since commit 74eee8a7960cf0a898d795cb024b10a58357dbcd:

  multipath-tools: add recipe for git version (2013-03-29 13:16:39 +0100)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-oe.git ttf-inconsolata

Apelete Seketeli (1):
  ttf-fonts: import ttf-inconsolata recipe from oe-classic

 .../ttf-fonts/ttf-inconsolata/OFL.txt              |   97 ++++++++++++++++++++
 .../ttf-fonts/ttf-inconsolata_20100526.bb          |   26 ++++++
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb

-- 
1.7.10.4



