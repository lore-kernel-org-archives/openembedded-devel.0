Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2750076E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 02:54:25 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so6611507pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 19:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CaIaH3vxiymZtzjhgMkJ7sKq46oV+TgJLyozs1zlF5Q=;
	b=u/wNwvSJcYtW/4hlpfSc/AsBb+H1SfkjrOLOR9B9lhWA0TPJS5qXttc42JOgf04DVj
	7sJNNrr8lmMfISdkTlC5DUwf63E8qyzue53GaxMwMDbEqBfLwFNzhDPsO65crVKpkxCk
	pgiCB8RbJmD7uPB1IX7FwS2KabAYNMhd7/8bZjlFLHpNNylxhZ2mdztqgAlGGwJrx9Fc
	KisSQJIoUU0P6ZUxpkdGe2dfmJvXG4QaWeNiPChKW3mNxci9wjFkuucMyRbowHuAGdgC
	DhKjaVVGftwAswn52kV3unEcmP+pz6nH1fz9bEqwTrey8Jw52W94w9K0us890UfY/TW+
	Onrg==
X-Received: by 10.69.19.202 with SMTP id gw10mr10323492pbd.60.1442458465523;
	Wed, 16 Sep 2015 19:54:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id bz4sm786495pbd.6.2015.09.16.19.54.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 19:54:24 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 12:55:16 +1000
Message-Id: <1442458516-8989-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] libconnman-qt5: update to 1.0.97
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
X-List-Received-Date: Thu, 17 Sep 2015 02:54:26 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 8724e67..229003d 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.0.92+git${SRCPV}"
+PV = "1.0.97+git${SRCPV}"
 
-SRCREV = "2591cd6013936478d9edaf75f1a45482851af0f2"
+SRCREV = "4cca434935fa4d70d6841a2c20717eecb0beafa8"
 SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
 
 S = "${WORKDIR}/git"
-- 
2.5.0


