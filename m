Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id D32EB6B68B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 08:10:32 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id u10so415407lbi.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+7uMjy/AUmPaiYHYY9yJYvJrVjxcO3M+9mcpm2Az+ew=;
	b=A0b6nph9pNY0JXA9ki6xgTyOvERjlPbj1y6yoO1ADRHBpphVYa3Kn4dvtoXylJmlYB
	U3zWhbbxJpxg1m8bCCRbK2hw9n+nVjFOtqTM2+nwhPXcfguNAgdeyD3D3N88l1yQ+vwZ
	8EWpNzmO/85R16Gd/00/Ps8Lk7EhEjqrSxdy3oX+y1Q9FXlvXAFjbZh3cnnZLkT5JyOC
	HykRx+RbLg3PeTDwcjDFYmSAxJ8Cg7zM/JTjJzKsSKJPXK+sJ9rH2cCLtHNMudTpkbg6
	8c3QRD3KtUbPes6o0gBSiKaY9rultcQOf1MlndqDZ3p/L0JrLofOj3uqVCtQydHLeucc
	V77g==
X-Received: by 10.112.24.2 with SMTP id q2mr970826lbf.34.1376554232721;
	Thu, 15 Aug 2013 01:10:32 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id 8sm17238599lbq.4.2013.08.15.01.10.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 01:10:31 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1V9sda-0000Pa-34; Thu, 15 Aug 2013 11:10:30 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 11:10:25 +0300
Message-Id: <1376554226-1550-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/2] libsdl-image: correct license name to Zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 08:10:33 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 4317d93..459bf12 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -1,11 +1,9 @@
 DESCRIPTION = "Simple DirectMedia Layer image library."
 SECTION = "libs"
 
-LICENSE = "zlib"
+LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
-PR = "r0"
-
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
-- 
1.7.10.4


