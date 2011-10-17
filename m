Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoU-0006aY-Ct
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:46 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4Ku+3VeOwScuo9Rln2YNgXEThqx+gIbSlL2G56x5+c4=;
	b=X965EFqAZn0XojV20+ZzOUdNa/Dknzt9/HUkMsTGrvp+TM2dvUhFNDXRsdRLGb1Z+x
	C8jBxPhlP7vyTHHZfpZdpP9REf04YE591OQ7NXX98nhzDTF4QYdcFw42YkgD5xsxSY3M
	T7LgFqUpW+i37CbbNpE3Ka3rulyToklhkLrr0=
Received: by 10.223.17.3 with SMTP id q3mr27494715faa.28.1318894559634;
	Mon, 17 Oct 2011 16:35:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f23sm224342faf.0.2011.10.17.16.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:35:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:23 +0200
Message-Id: <2c5b1efcd1b66912b32ffd47013054c34955d33b.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 04/10] e-tasks: fix licensing information
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-tasks_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-tasks_svn.bb b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
index eff0275..b79353b 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "e-tasks is a todo program for Openmoko phones"
 HOMEPAGE = "http://code.google.com/p/e-tasks/"
 AUTHOR = "cchandel"
-LICENSE = "GPLv2"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 SECTION = "e/apps"
 DEPENDS = "elementary eina edbus sqlite3"
 
-- 
1.7.7



