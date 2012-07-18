Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbpw-0000f1-3m
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:12 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1222814wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cJe3l59qjDH32H7qutAtyGl8wjGMlENVIwjrhibV7pQ=;
	b=xVRrbQ5Dfwid0AGbB9QsAagzY/8iD/jMPzq9YuaEyDUocAhtef20de3x8r536w+vZV
	Z9YvJIOe4U/IdG9SItzb8dpy8MYkhdDZ2Gm4JB00CJW6XzR9dAem3YHxnxWFi2jSlAcz
	KUSiRxAXFW6y5oEN+yIu4hfuGX8R/qG23/ASwdw2ZOgxftYCDtJvNXk+PAVR7ItaSzCv
	REhnXDbeXI2f8kYe+ZHFjnQ5OmM/Vj3D5bO7et0lkXJbC93yaz+kDSOMaumd9Ffvj+fU
	fuwzE1+HbmnkB2w/DlRSltaXcQO5aNKScdJixhq0Oez4WAe3d/CCsrzHVN5VJTaRp3Ur
	KUmg==
Received: by 10.180.104.200 with SMTP id gg8mr9885621wib.14.1342646393339;
	Wed, 18 Jul 2012 14:19:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm34626899wib.2.2012.07.18.14.19.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:19:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:15 +0200
Message-Id: <d3b22bad8fc55278ebe5150bc1c40a2a4c11a4fe.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 05/14] efl-from-svn-recipes: update to match PV from svn recipes
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index b2d27fa..9af3b6d 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,6 +1,6 @@
-EFL_PREFERRED_VERSION ?= "1.2.0+svn%"
-EFL_PREFERRED_VERSION_1.0 ?= "1.0.0+svn%"
-EFL_PREFERRED_VERSION_EET ?= "1.6.0+svn%"
+EFL_PREFERRED_VERSION ?= "1.2.1+svn%"
+EFL_PREFERRED_VERSION_1.0 ?= "1.0.1+svn%"
+EFL_PREFERRED_VERSION_EET ?= "1.6.1+svn%"
 
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
-- 
1.7.8.6



