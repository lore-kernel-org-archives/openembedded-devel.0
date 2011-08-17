Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZdY-0003yl-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:30:00 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:25:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2011 08:25:23 +0200
Message-ID: <cover.1313561874.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v3 0/2] Import ckermit recipe
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
X-List-Received-Date: Wed, 17 Aug 2011 06:30:00 -0000
Content-Type: text/plain


Ckermit is useful, not least as an alternative to lrzsz for serial port
file-transfer (it has been a lot more robust in a number of cases).

This patch series imports the ckermit recipe from oe-dev. Thereafter, ckermit
gets updated to the latest version, which also has the licensed change to BSD
3-clause.

V3: * Reset PR to r0.

V2: * Rebasing on the latest OE-version
    * Make sure that the patch is a rename, not add/delete pair.

The following changes since commit 6d424db5a0f952956a218e82a3ef0c43ebaafd5a:

  xcb: add missing bbappends (2011-08-16 13:07:31 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe ckermit
  https://github.com/darander/meta-oe/tree/ckermit

Anders Darander (2):
  ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
  ckermit: update to version 9.0

 meta-oe/recipes-support/ckermit/ckermit_301.bb |   58 ++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ckermit/ckermit_301.bb

-- 
1.7.5.4



