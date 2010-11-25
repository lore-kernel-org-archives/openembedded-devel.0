Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLdha-0002T8-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 16:25:42 +0100
Received: (qmail 24256 invoked by uid 503); 25 Nov 2010 15:28:48 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 15:28:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 17:24:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 17:24:23 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 16:21:20 +0100
Message-Id: <1290698481-17446-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290698481-17446-2-git-send-email-eric@eukrea.com>
References: <1290698481-17446-1-git-send-email-eric@eukrea.com>
	<1290698481-17446-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9198320764597546315
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] minimal: prefer QT 4.7.1
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
X-List-Received-Date: Thu, 25 Nov 2010 15:25:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index a2d23d2..afa8ac6 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -104,7 +104,7 @@ require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
-PREFERRED_QT_VERSION ?= "4.7.0"
+PREFERRED_QT_VERSION ?= "4.7.1"
 PREFERRED_VERSION_qt4-tools-native = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
-- 
1.6.3.3



