Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pprakash@ti.com>) id 1QIO2A-0006Lf-Ng
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 18:37:42 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p46GX2PG012447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 May 2011 11:33:02 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p46GX2d0013999;
	Fri, 6 May 2011 11:33:02 -0500 (CDT)
From: Punya Prakash <pprakash@ti.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2011 08:29:51 -0500
Message-Id: <1304688591-31481-1-git-send-email-pprakash@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Punya Prakash <pprakash.ti@gmail.com>
Subject: [PATCH] gst-ffmpeg: fix license information
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
X-List-Received-Date: Fri, 06 May 2011 16:37:43 -0000

From: Punya Prakash <pprakash.ti@gmail.com>

* gst-ffmpeg by default compiles FFmpeg/libav with --enable-gpl and --enable-postproc
---
 recipes/gstreamer/gst-ffmpeg_0.10.11.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
index 563521e..26aecce 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "FFmpeg-based GStreamer plug-in"
 SECTION = "multimedia"
 PRIORITY = "optional"
-LICENSE = "LGPL"
+LICENSE = "GPLv2 LGPLv2.1"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
-- 
1.7.0.4



