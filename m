Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iFW-0003v2-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:38 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so193839eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8rJpj4dBtzpMPdrkIdp7qEvnUFSuSu5GXDueJZtToNY=;
	b=w67QJcwP42hcEaVT9EGInS+bIO5572MRUteREGQP/dmDkex6/2AEvizMgrQ1y8FerS
	ZqVlvEmztdRxCxeSyfhWJ+E3ToTSrlpz/pmIa0SZgpRuEsn6DjGRhGuHUQGhd4gKPOmM
	zvwW+jbkHo2GE3IyKwk0IVelcAua/Xddlbg4bffeADJCQ+0MINrj4jeAqgZr6iWtVtN6
	0KvRVF9iVIGtJeAW/QfNvneu8RNvQA7a/ZgFokuuxo8oL0PnAsluCD0KGZKctuCXy8gQ
	VFny6zkZpK28YUFj0PT+6VEXyeLX29NqJmSGH4VMsidrZWI0ehnj3JNn69hxyQKITbn8
	Zm4A==
Received: by 10.213.15.14 with SMTP id i14mr1419907eba.209.1331231462177;
	Thu, 08 Mar 2012 10:31:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n55sm8894344eef.6.2012.03.08.10.31.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:31:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:08 +0100
Message-Id: <abf8a749d2aa03917dc89ac454f58601e14fc42f.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 7/7] eve: another PR bump for libtiff3->libtiff5
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
X-List-Received-Date: Thu, 08 Mar 2012 18:39:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 7836c8b..1111553 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
-- 
1.7.8.5



