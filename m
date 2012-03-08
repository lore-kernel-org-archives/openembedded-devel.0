Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iFH-0003v2-KY
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:23 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so193839eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dU07NW2PvkVxelP7vI0mpfCsRMdw0oLq+WQ6ijaYPUU=;
	b=rUiuZE6Pew9qa4w2aOrct2IQUtLnF/bo/zHPO4pkdgwR6/0CSDMWiLNPuBusNNE6O9
	zCZkSlLpqBnLlB2KE/FKL26JY+U77Hq26BLEkBaM3cSjS8oZfs8wA60SWYs/aaeMH7bs
	py3iwwwuOqEOVn6lRecCqV3UxayIj9EKasEIoZXH7mgVOZyP5j/4YvgVqmJtGjuzn6aZ
	pdowDLb5EjYppDEnP4bxKW5xO4+0Qio0Suxkdfdt2ywDtAjiibOqF6fm88l/XZj0pOpY
	B6lYmsPBafWpAaLXRXfARRtzOWOf5lPZW3vTGwz6YWKrov/ERjlQisVThaYmuRpjiLJ6
	A/IA==
Received: by 10.14.98.133 with SMTP id v5mr2511274eef.95.1331231447519;
	Thu, 08 Mar 2012 10:30:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x42sm8938083eeb.1.2012.03.08.10.30.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:06 +0100
Message-Id: <209751fbed412e7ef3ffcf576fa8010cd3658349.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/7] python-elementary: another PR bump for libtiff3->libtiff5
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
X-List-Received-Date: Thu, 08 Mar 2012 18:39:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-elementary_svn.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index daaf119..dfe194b 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
-- 
1.7.8.5



