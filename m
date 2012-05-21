Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgM-0001FI-VM
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:00 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENocI031655
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:50 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENoRo030112
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:50 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:50 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAok008382;
	Mon, 21 May 2012 09:23:48 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:13 -0500
Message-ID: <1337610609-1173-15-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 14/70] audiofile: Update LICENSE field version to GPLv2 and LGPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:34:00 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL/GPL to LGPLv2
  and GPLv2 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/audiofile/audiofile_0.2.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/audiofile/audiofile_0.2.6.bb b/recipes/audiofile/audiofile_0.2.6.bb
index 6840506..f7e3b3b 100644
--- a/recipes/audiofile/audiofile_0.2.6.bb
+++ b/recipes/audiofile/audiofile_0.2.6.bb
@@ -3,9 +3,9 @@ API for accessing a variety of audio file formats, such as AIFF/AIFF-C, \
 WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
 Research, Amiga IFF/8SVX, and NIST SPHERE."
 SECTION = "libs"
-LICENSE = "LGPL GPL"
+LICENSE = "LGPLv2 GPLv2"
 RPROVIDES_${PN} += "audiofile"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.68k.org/~michael/audiofile/audiofile-${PV}.tar.gz \
 	   file://audiofile-m4_quote_fix.diff;striplevel=0 \
-- 
1.7.0.4



