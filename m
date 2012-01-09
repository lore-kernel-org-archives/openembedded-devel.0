Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkFG7-0006r1-5O
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 14:27:31 +0100
Received: from localhost (193.235.91.228) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.213.0; Mon, 9 Jan 2012
	14:18:40 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Jan 2012 14:18:37 +0100
Message-ID: <e8d484337a916535783d0def3fcc2e7f62ae11c7.1326114932.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.2
In-Reply-To: <cover.1326114932.git.anders@chargestorm.se>
References: <cover.1326114932.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 1/2] systemd: git repo moved
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
X-List-Received-Date: Mon, 09 Jan 2012 13:27:31 -0000
Content-Type: text/plain

Freedesktop have reorganized the git repository structure.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 2548d10..bdaaf16 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -20,7 +20,7 @@ inherit useradd pkgconfig autotools vala perlnative
 
 SRCREV = "f6cebb3bd5a00d79c8131637c0f6796a75e6af99"
 
-SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://0001-disable-xsltproc-completely.patch \
            ${UCLIBCPATCHES} \
           "
-- 
1.7.8.2



