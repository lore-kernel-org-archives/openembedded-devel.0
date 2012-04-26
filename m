Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJy-00068S-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:18 +0200
Received: by wera1 with SMTP id a1so778636wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vX6AQzD6XzmMm4CAoA5R2EiBz0iZQXkbFYMO4GtmWCg=;
	b=rm73lo6z918AbxKc9Y6307wzF4BUKSDGY0KpgqtZ144KSo47rYIrY0El8A+gErRkRo
	zdDZW9Fn4J2FTV5b9X2PcjvvZCMarkA5q+ihE2C4v2lVZHmcipHh08nKCt+dluvC/E99
	2uuBOKtc8uDbjXD0awXdEtaYud2zo7B6OJEFcnlOYPXHHufJbzXcO7ICp4uwBnSmF4cN
	Kw7HPufbyo8aTaYJEgE0SQ9eb5lK/xzdMSJACvyQ5T0NHgp4sbO6riESs7+54t+0wem4
	W6a8+jBMVtlHhvJ1k3cpC5rnna/Wm5OjeOpUqhO/BbMjjRJSVHhqyES1FSypzkuWgntO
	g6AQ==
Received: by 10.216.137.232 with SMTP id y82mr4120465wei.82.1335444693341;
	Thu, 26 Apr 2012 05:51:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm10812248wib.0.2012.04.26.05.51.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:14 +0200
Message-Id: <01bbde05b12022defef9e462154e532d6e4eea9a.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 09/15] eio: fix LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:18 -0000

* formal changes in r66247 and copy&paste fix in r66262

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eio.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eio.inc b/meta-efl/recipes-efl/efl/eio.inc
index 71a7eda..4d28fab 100644
--- a/meta-efl/recipes-efl/efl/eio.inc
+++ b/meta-efl/recipes-efl/efl/eio.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Enlightenment Input Output Library"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=180fca752525726bd6ba021689509a08"
 DEPENDS = "ecore eina"
 
 inherit efl
-- 
1.7.8.5



