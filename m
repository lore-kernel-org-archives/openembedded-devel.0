Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhM6-0008NP-GB
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:22 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so2063381wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XtTn72ZFVR3BkxoGy7kyKvC1Hqj/6xqasjBnsnvutTs=;
	b=DUK4RiZFFubz4YkIcjWmA2glb+yMmIkFoRHywwrfRdD5bMj9D0pq0A3gVkg3YONW4p
	4M4h1HV8AKP6WiVNyRFUzKr8xHFd+3WO/YH3LQbZHnwIPnSEoeGn0KNi2u3S92squJw0
	G8fhDITU8TRb93lOvYw5wooyR+L6yC805vYmihM8GkYQSc+k0FvFABGOzlIN0FvHkVhC
	HzJlWvr3+8Dg1BXbd636En8kNd+2qTJpR9XGw4IsqH3LKYLNFoVZwJolUEmT1AkWfxAC
	Bi1dsIYmOGSq4H/a7C8/eFzMeAyqR0JjQ8zgo12omD4GPqCpgLZY8BSJqUKnS3uUNFZm
	LRDg==
Received: by 10.180.14.8 with SMTP id l8mr15169930wic.6.1349102367759;
	Mon, 01 Oct 2012 07:39:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm16735863wiv.11.2012.10.01.07.39.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:48 +0200
Message-Id: <275273308ebeac252cc5466192a476733ed50a1d.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] elmdentica: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 01 Oct 2012 14:52:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index c965b68..f3bf939 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "A indenti.ca client for E"
 DEPENDS = "glib-2.0 gconf curl elementary sqlite3-native azy"
 LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
 SECTION = "e/apps"
 HOMEPAGE = "http://elmdentica.googlecode.com"
 AUTHOR = "seabra"
-- 
1.7.12



