Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKGDq-00031l-ID
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 22:41:31 +0200
Received: (qmail 17731 invoked by uid 503); 11 May 2011 20:08:24 -0000
Received: from b6.ovh.net (HELO mail412.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 11 May 2011 20:08:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 May 2011 22:38:43 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 May 2011 22:38:41 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2011 22:30:04 +0200
Message-Id: <1305145805-14609-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305145805-14609-1-git-send-email-eric@eukrea.com>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17568823623319072078
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 5/6] shr: prefer qt 4.7.3
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
X-List-Received-Date: Wed, 11 May 2011 20:41:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/preferred-shr-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 35a4ecd..5cb6e09 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -28,7 +28,7 @@ PREFERRED_VERSION_perl = "5.10.1"
 PREFERRED_VERSION_perl-native = "5.10.1"
 UDEV_GE_141 = "1"
 
-ANGSTROM_QT_VERSION ?= "4.7.2"
+ANGSTROM_QT_VERSION ?= "4.7.3"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"
-- 
1.7.0.4



