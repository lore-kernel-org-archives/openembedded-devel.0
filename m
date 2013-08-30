Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 986E56BD7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 01:00:34 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp13so1618144pab.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8ka08dpvThTKmpNk/pI0cUC2lCN8mCJQt1ipsGN53Lc=;
	b=sYzjw1YiW93K5PnTCM/+wtCeyeShT43t+GPkhFYrdsbpjm7oHpg7dBbm9ljAMMv9On
	0WhA8UJo6dvx/q7I7Tba2ebC2q6LNqefPjo/SUIKvpn/TVK9+wsbXA6H2gha7yAxrcxO
	Rdyv3eoQW0BAEf9sAFo8FVWXppck/U/p90Nu6kdXWEwqfYFIQbLeKNPYFxDZbrzwK0gM
	y4q/0jXecS5AR2eCAVVez9St6Vp4zP8hrRkdM65woBXbOSOn2Nv1edybSRrCEOBo1fhS
	ldSAdEwAdEwBr+VtGwDGQugxE62W3MSmoz3znHxvOf2BX+d2z/FUTVKwl/mlxZD8yVP1
	A2hQ==
X-Received: by 10.68.111.197 with SMTP id ik5mr6550200pbb.171.1377824432205;
	Thu, 29 Aug 2013 18:00:32 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id t9sm40693188pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 18:00:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 10:55:51 +1000
Message-Id: <1377824151-7538-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] qt-creator: update to 2.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2013 01:00:35 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../qt-creator/{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb} (87%)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
similarity index 87%
rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index a95ad5a..21d5264 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b5
 SECTION = "qt/app"
 
 SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.8/${PV}/${BP}-src.tar.gz"
-SRC_URI[md5sum] = "5aacdad4491b7dda9758a81384d8da79"
-SRC_URI[sha256sum] = "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df924d6e895e99f45d2"
+SRC_URI[md5sum] = "79ef6c6ece0c00035ef744c9d6e3bd3b"
+SRC_URI[sha256sum] = "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a6cfb9cb297f50c364b9"
 
 S = "${WORKDIR}/${BP}-src"
 
-- 
1.8.3.4


