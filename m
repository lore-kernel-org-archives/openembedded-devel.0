Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id D80A1608CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 15:20:19 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so9830200pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ge5ypY1MywUx0BS1d4WFGnWYw4iOoQhrg1RYe0q2/OQ=;
	b=aAGpHOdAJR6r3kxHUxphojHyaoybHkEJPmcm6wMXM2/fpkLXUK7TJSFTKRGlqzrnht
	G2SR6vMBHgBU7H/0lHExB0frfw16+NQJQMT9+n0Es0o6afDhHt4OUg+feNUy3Ypnp1Jq
	WMw9aefFourKYgav1Qn5HpE1dmJhhKCAAYeS8OWqKzpSzARY3NNcoCBlpWVZFDedDHfa
	dwirZkIZCa0eEtGOj9FVBshlw6L4USH+pjMU/29pqkH3cRe5NaHMPRqSrWDhrY9CrS0O
	rXe9kKMnpss6mEMt/UZDMEvhcv0O/+pLD9FfcgmBYrwHA+eBu/REs93CZTshDUzt6oKM
	/ZJw==
X-Received: by 10.66.121.170 with SMTP id ll10mr47439828pab.126.1373728820448; 
	Sat, 13 Jul 2013 08:20:20 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qb15sm54248781pab.13.2013.07.13.08.20.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Jul 2013 08:20:19 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jul 2013 01:35:56 +1000
Message-Id: <1373729756-21461-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] qt-creator: upgrade to 2.8.0
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
X-List-Received-Date: Sat, 13 Jul 2013 15:20:20 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../qt-creator/{qt-creator_2.7.2.bb => qt-creator_2.8.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.7.2.bb => qt-creator_2.8.0.bb} (84%)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
similarity index 84%
rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
index 2948d81..a95ad5a 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b5
                     file://LICENSE.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 SECTION = "qt/app"
 
-SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.7/${PV}/${BP}-src.tar.gz"
-SRC_URI[md5sum] = "7f1c10740784d3edf2347c27be21fd1a"
-SRC_URI[sha256sum] = "5df913faa43a5fbf44fb1f25faaf6d258134b8f9e6b8ef8a21277136dec9e189"
+SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.8/${PV}/${BP}-src.tar.gz"
+SRC_URI[md5sum] = "5aacdad4491b7dda9758a81384d8da79"
+SRC_URI[sha256sum] = "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df924d6e895e99f45d2"
 
 S = "${WORKDIR}/${BP}-src"
 
-- 
1.8.3.2


