Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzphC-0001uj-EB
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:10 +0200
Received: by wibhn17 with SMTP id hn17so398297wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cJe3l59qjDH32H7qutAtyGl8wjGMlENVIwjrhibV7pQ=;
	b=pIngGA7q/Ip3MHNbQuPsuQSF0sZBz47oeYRV8U+r1vehH+wgED4UhWoQovnTrO4SZi
	PrmTOiQkO+hfLWtyd9UESdoAW3n1B0NxbT0uyGBX78KQRJlym2sqr4i2tB/p3uYz1CxA
	h2kOpVW1fxckmA6w8JpJWSYoI3LlH6xr/i82X4ujjlSaNkDtSr8Y0VjeQhxQxmtGEuX7
	32nTKa9Dpjc+3/MOE5nWyiSeKDE+kAUo8VRY+Kh2nOZOfQ9i4D8Q0Fgfi+Nvx+e6jjCR
	VkaBpA+1mlvjW3B3ttHnaPFcf3mwZnPxcLGxk1pexrGyPL0U/cyhgAS9xc6aN7DhvPPI
	dLjw==
Received: by 10.216.53.193 with SMTP id g43mr1550457wec.67.1344606260904;
	Fri, 10 Aug 2012 06:44:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7833130wiz.4.2012.08.10.06.44.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:00 +0200
Message-Id: <ec20d401fd1164b8912d90bada12f9af39cea6e9.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 05/46] efl-from-svn-recipes: update to match PV from svn recipes
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:10 -0000

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



