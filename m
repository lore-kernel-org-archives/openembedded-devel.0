Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iFA-0003v2-6C
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:16 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so193839eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=A/DQoM8++S+DZJHWGnB4jxiZ2rRWRE6XlXg3krheuRw=;
	b=mmf5DSq6Fx0+TgpTHNy1X+1Qn2AA960iTzKLh8TrabIr9n5nT9tC/AYtPei12MxEfY
	LcRc/uBvzcNvMw2O7L+Hz5FeOvIqTpOdzzxlI3hb3mlVocJHKs5ieQdT7zMw6nX1zfXi
	+Z8OkOHTgBP1oTHiR1S6jpiOG0daHGKnBVMdYA+7vo1svBtDB8z7fhprXV2qf6AN0FVa
	kfQcMajwWtbhLCiCOG/OLFuN5yuZn+xmOkowRQJghvV9YYg3SP6I1FAvw6JtF4h3/ay2
	Q+w/qJU12nZ1jpC3KfG/YpTM8OiUJC9kzm4uXz59e4rNwNoATA83SSvixlTZ6xs44sEX
	7zcw==
Received: by 10.14.133.198 with SMTP id q46mr2532884eei.64.1331231440112;
	Thu, 08 Mar 2012 10:30:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm8878393eeb.7.2012.03.08.10.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:05 +0100
Message-Id: <4063a36fa1c62913cd783f476f90747da3df4aba.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/7] epdf: another PR bump for libtiff3->libtiff5
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
X-List-Received-Date: Thu, 08 Mar 2012 18:39:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 7e6e5ca..73c3e30 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r7"
+PR = "r8"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-- 
1.7.8.5



