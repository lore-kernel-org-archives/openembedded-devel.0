Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D832071A8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 09:31:49 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id z6-v6so6376967wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HFk09NG3A5yPOi+0TsCxPAf6zTGHG2vZqL0gO8mJOm0=;
	b=sF+yCZa7N9PkbiBONPhk8zQNbX3BZg6shrcIxnVhaMUZx6yUMIRD49ASufJh7aau8j
	UVPBr5pnkuGWI4Ppsg7SOOn+OBapOPcR1MMzOYkYYlCZhWWcA3jyttPE2iOC1l7Ex1mq
	mHXzOMaNmbFAy4bSRwx9uRlthY3t1dpCMS3ConFX0S+lgcKPDfw9q28asKW53gi62x90
	e3/1Cuam5Qz1lIrGj2y8vMkYvd7AM0ozOyrzuZag9HrBK4p8Nx0SFmF4ukrK+tKYfB/l
	z37p99B6Xt2oNdFXGAOLntHCSIl+w8ysztbSzIVbQx+5I9HWapq9oPwrokTYmuE9yTvl
	o0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HFk09NG3A5yPOi+0TsCxPAf6zTGHG2vZqL0gO8mJOm0=;
	b=okvmgeQicuhuCMLgVWFSg1W3Gn1FugpsFeSudXVwJcgGdAGOcdMxbAJH2lPhwofStE
	3b+SSaVZGntyfRRR4OVYz3ZG/+zcenOgl/+pLm4OrLqk1d9X7NxeksAYdrkJW/OaZ5XA
	O0dJSnNMCmUUv1H1l4fYEg5VkARB2h1rMVHplm+MMUI5b23D9sb61NvaFvxlmNXoRqz2
	YSPW1uNtvIO2uPWSlzR6HJUKyLfj4K0CiXAe8ZTlFX2hQwv6OxJb9HR12N5hjRFaFo+W
	UdssMTvPrWtc76aSE5xhwy0R29i81JE9YUs+B3YbaH5BAIjNgdu4QX4lpiubFbwtAjXp
	iA0g==
X-Gm-Message-State: APt69E1Ua7cNJNAyuGLeeuubexJsRRXYS7ii0rXvdxKbU6HZhD+vsHnO
	KqH+rsJAUwUbHLHk3O2HXR3hKg==
X-Google-Smtp-Source: ADUXVKJJdbNx/JPehgf0E2gUTI4LkK79swl6aIwvGh+zjcDpr3Yn/vYmopWeCZ2f2oBhZOQ2LgtG+g==
X-Received: by 2002:a1c:b50b:: with SMTP id e11-v6mr965187wmf.84.1528450310226;
	Fri, 08 Jun 2018 02:31:50 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	d5-v6sm13115797wrp.64.2018.06.08.02.31.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Jun 2018 02:31:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 11:31:41 +0200
Message-Id: <20180608093141.7337-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180608093141.7337-1-schnitzeltony@gmail.com>
References: <20180608093141.7337-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/2] qttranslations: remove qtquick1 translation package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 09:31:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 8c4e04a..f87351c 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -8,6 +8,13 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qttools-native"
 
+do_install_append() {
+    # remove qtquick1 translations - qtquick1 is gone
+    for transfile in `find ${D}/${OE_QMAKE_PATH_TRANSLATIONS} -name qtquick1_*.qm`; do
+        rm $transfile
+    done
+}
+
 PACKAGES =. " \
     ${PN}-assistant \
     ${PN}-designer \
@@ -22,7 +29,6 @@ PACKAGES =. " \
     ${PN}-qtwebsockets \
     ${PN}-qtwebengine \
     ${PN}-qtxmlpatterns \
-    ${PN}-qtquick1 \
     ${PN}-qtscript \
     ${PN}-qtserialport \
     ${PN}-qtbase \
@@ -82,10 +88,6 @@ FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
 
-FILES_${PN}-qtquick1 = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
-"
-
 FILES_${PN}-qtscript = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
 "
-- 
2.14.3


