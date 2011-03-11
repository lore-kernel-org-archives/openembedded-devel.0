Received: from 4.27.mail-out.ovh.net ([46.105.52.239] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyB1I-0001cV-4c
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 23:41:16 +0100
Received: (qmail 5005 invoked by uid 503); 11 Mar 2011 22:33:09 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 11 Mar 2011 22:33:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Mar 2011 23:39:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Mar 2011 23:39:31 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 22:40:57 +0100
Message-Id: <1299879658-10136-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299879658-10136-1-git-send-email-eric@eukrea.com>
References: <1299879658-10136-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10850015927870532938
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/3] minimal: prefer qt 4.7.2
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
X-List-Received-Date: Fri, 11 Mar 2011 22:41:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: raj.khem@gmail.com
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index caf7826..090a4db 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -115,7 +115,7 @@ require conf/distro/include/preferred-opie-versions-1.2.5.inc
 
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
-PREFERRED_QT_VERSION ?= "4.7.1"
+PREFERRED_QT_VERSION ?= "4.7.2"
 PREFERRED_VERSION_qt4-tools-native = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
-- 
1.7.0.4



