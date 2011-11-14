Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RQ4Cg-0001ep-Ky
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 22:36:34 +0100
Received: (qmail invoked by alias); 14 Nov 2011 21:30:08 -0000
Received: from p5B0A3A75.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.117]
	by mail.gmx.net (mp007) with SMTP; 14 Nov 2011 22:30:08 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/gGEgjvxPgDBAFqLnMIv2uLFa4t9a1Ym7yviJDcB
	7ffe56Z+w/2j5O
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 22:35:07 +0100
Message-Id: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 0/5] cleanup and bugfixes
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
X-List-Received-Date: Mon, 14 Nov 2011 21:36:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2:
* midori: cleanup commit message
* tumbler: use INSANE_SKIP

Andreas Müller (5):
  xfce4-dev-tools: cleanups
  midori: update to 0.4.2
  tumbler: initial add 0.1.22
  ristretto: update to 0.3.0
  ristretto: add tumbler to RRECOMMENDS_${PN}

 .../midori/{midori-0.4.1 => midori}/waf            |  Bin 92569 -> 92569 bytes
 .../midori/{midori_0.4.1.bb => midori_0.4.2.bb}    |    4 +-
 .../{ristretto_0.2.2.bb => ristretto_0.3.0.bb}     |    6 ++-
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb   |   32 ++++++++++++++++++++
 .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    8 +++--
 5 files changed, 43 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/midori/{midori-0.4.1 => midori}/waf (100%)
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.1.bb => midori_0.4.2.bb} (58%)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.2.2.bb => ristretto_0.3.0.bb} (64%)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb

-- 
1.7.4.4



