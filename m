Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SDkhC-0000J9-5V
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Mar 2012 00:53:26 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Mar 2012 00:43:52 +0200
Message-Id: <1333147432-24643-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] qt4: move from 4.8.0 to 4.8.1
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
X-List-Received-Date: Fri, 30 Mar 2012 22:53:26 -0000

* Follow OE-Core.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* NOTE: Currently, the patch is only in OE-Core's master-next branch.

 ..._4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} |    0
 ..._4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-qt/qt4/{qt4-embedded_4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} (100%)
 rename meta-oe/recipes-qt/qt4/{qt4-x11-free_4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} (100%)

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
-- 
1.7.5.4



