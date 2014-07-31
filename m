Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id AA1F3706FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 20:30:19 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf12so5098923vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Py7H0I6SAW/oJprVP2ZetNyU1S501T6saZWYgo0McfQ=;
	b=VzTIOX8dTugmUPkHBVgP3/Hs0uLgU8XqaqIoj4cm3DD0WobNIYyua1sXsFfWn9I4tm
	wpOTWs9BHEM8fGSmXaVSk/FY0LRzVD8XQ9S4uIQ6A8f93IWYuAofKbJWAZntpSp7jFos
	13KGyjtqy2IjicrFEk8CSjIFgF7evh0Z5Xfpif9yDWARs9FvnDfUMaVxPwqIAWusya7A
	6zjceHz8H4RND9b7ZC8+YXwQDxLXQ7h2ddFuf2cto3gU+ygUI1yRAygWWSilZTFUzOxb
	saTIODgc150OAaZchTsYlL3Bp9fhmB36lovSViHRTlvigRllqua8lj9WdopHTAHC2vBg
	LpWA==
X-Received: by 10.52.129.200 with SMTP id ny8mr790005vdb.27.1406838620690;
	Thu, 31 Jul 2014 13:30:20 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	u18sm14807683vdi.20.2014.07.31.13.30.18 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jul 2014 13:30:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jul 2014 17:29:54 -0300
Message-Id: <1406838594-30903-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] swig: Update to 3.0.2
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
X-List-Received-Date: Thu, 31 Jul 2014 20:30:20 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-devtools/swig/{swig_2.0.12.bb => swig_3.0.2.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/swig/{swig_2.0.12.bb => swig_3.0.2.bb} (57%)

diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb b/meta-oe/recipes-devtools/swig/swig_3.0.2.bb
similarity index 57%
rename from meta-oe/recipes-devtools/swig/swig_2.0.12.bb
rename to meta-oe/recipes-devtools/swig/swig_3.0.2.bb
index d3707ee..ac41914 100644
--- a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
+++ b/meta-oe/recipes-devtools/swig/swig_3.0.2.bb
@@ -4,7 +4,5 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
 
-
-SRC_URI[md5sum] = "c3fb0b2d710cc82ed0154b91e43085a4"
-SRC_URI[sha256sum] = "65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7"
-
+SRC_URI[md5sum] = "62f9b0d010cef36a13a010dc530d0d41"
+SRC_URI[sha256sum] = "a2669657cabcedc371f63c0457407a183e0b6b2ef4e7e303c1ec9a3964cc7813"
-- 
1.7.10.4


