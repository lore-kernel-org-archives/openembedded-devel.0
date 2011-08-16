Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtFwt-0003Yl-1J
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 11:28:39 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	11:24:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 11:24:05 +0200
Message-ID: <cover.1313486613.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 0/2] Import ckermit recipe
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
X-List-Received-Date: Tue, 16 Aug 2011 09:28:39 -0000
Content-Type: text/plain


Ckermit is useful, not least as an alternative to lrzsz for serial port
file-transfer (it has been a lot more robust in a number of cases).

This patch series imports the ckermit recipe from oe-dev. Thereafter, ckermit
gets updated to the latest version, which also has the licensed change to BSD
3-clause.

The following changes since commit 4edc680bfd93f9358f099e1513f916c46347f538:

  libx11: skip self if x11 not in DISTRO_FEATURES (2011-08-16 10:03:11 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe ckermit
  https://github.com/darander/meta-oe/tree/ckermit

Anders Darander (2):
  ckermit: import from OE rev 84812c64e7146d75004b3eeecae22b6d1118c1fb
  ckermit: update to version 9.0

 meta-oe/recipes-support/ckermit/ckermit_301.bb |   58 ++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ckermit/ckermit_301.bb

-- 
1.7.5.4



