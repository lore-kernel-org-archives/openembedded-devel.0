Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoj-0006aY-N2
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:42:01 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nIf7E7anZHn++MmC1H8eywma7DG9L4DIBL/sfZ8/Wuo=;
	b=AID0SBz6rBP3CQ40OoCei4NDXQ1GFnUl0GakAIvDAyh25bjVyZWd9Zf3uNDUANajev
	eYsecJreVt5uaMYptLnLUZ50swqQgSIJZMI2vNEf4F77Q5jhGcybvdsVBEiFlWfk5pNk
	cjnkL5zpk4TY39f3qqD1026qBJQ/X9Xwdf9rk=
Received: by 10.223.81.196 with SMTP id y4mr28338fak.6.1318894574530;
	Mon, 17 Oct 2011 16:36:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b10sm224858fam.1.2011.10.17.16.36.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:25 +0200
Message-Id: <0846be28084e47eca8a5eba90eb9aad4dab2054a.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 06/10] abiword: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 17 Oct 2011 23:42:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
index 7da9dee..86c55f0 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) W
 HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
-- 
1.7.7



