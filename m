Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E4EBF75868
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 08:31:05 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so12875802pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=os5rpVX58orsVRN29Uucgof0F1k7CEZwstI63oiVyT0=;
	b=L2CqGB6WB/TZaGzeMfIFdYyBmHMOuMTs7LMedrGZo9CivCdRuaiZAiKBH243btBO1z
	wWemVdj/2lTeEs5RB/0MC+p1S9s4AfUP3alhnnhFpY11I7QPAhe6dRpyDoEp8iav/g//
	zhI5xv9ZUbXTd9oTU4hpgBzEgJ6L8020KGqx8Tg/hH+XRFviI1kD+a4YqYXP6gQyByhI
	YXjq6GBLU0hkx1MMJ7wOyaLis0XeZZPRRh66A39mULVQo0QHo9YeqUer6Et8MPY/3gwR
	hWcc086CiHHoEK4nslzLdTeyI5bo9VHeW4SaJr0N0NlV6a53J5K0Q8NAqR7c1dDMJ7uo
	83Rw==
X-Received: by 10.66.144.2 with SMTP id si2mr27204783pab.115.1437121866067;
	Fri, 17 Jul 2015 01:31:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	nl10sm10378060pdb.38.2015.07.17.01.31.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 01:31:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2015 18:30:36 +1000
Message-Id: <1437121836-27901-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [meta-qt5][PATCH] libconnman-qt5: update to 1.0.91
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
X-List-Received-Date: Fri, 17 Jul 2015 08:31:06 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 0ca57e2..f79dc0c 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.0.89+git${SRCPV}"
+PV = "1.0.91+git${SRCPV}"
 
-SRCREV = "79a8d10479ba55951ffa375a66797eedff230dd3"
+SRCREV = "f9ce5eaa124fc5a1a554540c94331301bb2b1b49"
 SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
 
 S = "${WORKDIR}/git"
-- 
2.4.5


