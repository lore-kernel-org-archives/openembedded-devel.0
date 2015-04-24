Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECAA605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:59:35 +0000 (UTC)
Received: by wiun10 with SMTP id n10so32952562wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=xrm2pirMXOk66rS+tS4cEGEWQbpX8DhMftb51Ae8Vdc=;
	b=YazQOoqtIEmV6nCBiWqz+ZZi/iN6yMELoVPI2elLsj8MSUVZ7ge0QencIwRbh3bhTj
	8e6hH6SdT9m87oW44zisZYdm02QXWU68A2SEZUxAl3hzHCLzHht7MBY6PBITsDI+ncZO
	hvEWv1vymMsHHSAFotXHgY8HfDops5hJQef1fkLgwM/nArtIYZu97sZjFsnK9DkiGYiO
	bnfWPM3zfuEe+xxydCUKxNN8gH27L2XsVXIFlBpVg+QN3mvvjWsFOFJDaBLtguoP9qTp
	UffuHxETq/FuODsssnVynXg74L78MOpg11Hd3eZVBlHDg532BlK70uoiwT/JK8rkXjGH
	bZ6A==
X-Received: by 10.181.11.137 with SMTP id ei9mr1464426wid.48.1429909176089;
	Fri, 24 Apr 2015 13:59:36 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id e2sm643447wij.5.2015.04.24.13.59.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 13:59:35 -0700 (PDT)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 23:59:17 +0300
Message-Id: <1429909159-8425-3-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
Subject: [meta-opie][PATCH 3/5] konqueror-embedded: fix LICENSE information
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
X-List-Received-Date: Fri, 24 Apr 2015 20:59:35 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-qtopia/konqueror/konqueror-embedded_20030705.bb | 2 +-
 recipes-qtopia/konqueror/konqueror-embedded_20060404.bb | 2 +-
 recipes-qtopia/konqueror/konqueror-embedded_20070316.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qtopia/konqueror/konqueror-embedded_20030705.bb b/recipes-qtopia/konqueror/konqueror-embedded_20030705.bb
index aec037e..7de3cda 100644
--- a/recipes-qtopia/konqueror/konqueror-embedded_20030705.bb
+++ b/recipes-qtopia/konqueror/konqueror-embedded_20030705.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "KDE Web Browser Konqueror, QtE based Palmtop Environments Edition
 HOMEPAGE = "http://www.konqueror.org/embedded"
 SECTION = "opie/applications"
 DEPENDS = "libqpe-opie openssl libpcre"
-LICENSE = "LGPL GPL"
+LICENSE = "LGPLv2+ & GPLv2+"
 PR = "r5"
 
 # Note if this .bb files fails with the error:
diff --git a/recipes-qtopia/konqueror/konqueror-embedded_20060404.bb b/recipes-qtopia/konqueror/konqueror-embedded_20060404.bb
index f64b93f..ff29e6a 100644
--- a/recipes-qtopia/konqueror/konqueror-embedded_20060404.bb
+++ b/recipes-qtopia/konqueror/konqueror-embedded_20060404.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "KDE Web Browser Konqueror, QtE based Palmtop Environments Edition
 SECTION = "opie/applications"
 HOMEPAGE = "http://www.konqueror.org/"
 DEPENDS = "openssl libpcre virtual/libqte2 dcopidl-native dcopidl2cpp-native"
-LICENSE = "LGPL GPL"
+LICENSE = "LGPLv2+ & GPLv2+"
 PR = "r3"
 
 # this Konqueror needs the KDEDIR set and the font helvetica installed on the target
diff --git a/recipes-qtopia/konqueror/konqueror-embedded_20070316.bb b/recipes-qtopia/konqueror/konqueror-embedded_20070316.bb
index 69824c2..b70efc4 100644
--- a/recipes-qtopia/konqueror/konqueror-embedded_20070316.bb
+++ b/recipes-qtopia/konqueror/konqueror-embedded_20070316.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "KDE Web Browser Konqueror, QtE based Palmtop Environments Edition
 SECTION = "opie/applications"
 HOMEPAGE = "http://www.konqueror.org/"
 DEPENDS = "openssl libpcre virtual/libqte2 dcopidl-native dcopidl2cpp-native"
-LICENSE = "LGPL GPL"
+LICENSE = "LGPLv2+ & GPLv2+"
 PR = "r7"
 
 # this Konqueror needs the KDEDIR set and the font helvetica installed on the target
-- 
2.1.4


