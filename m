Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 12C4B733C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEiuWs025022; Fri, 13 Feb 2015 14:44:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M9ebMJIEE0lt; Fri, 13 Feb 2015 14:44:57 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEipcn024984
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-00027K-Po; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:34 +0000
Message-Id: <1423838674-8066-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] python-scons: 2.3.2 -> 2.3.4
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
X-List-Received-Date: Fri, 13 Feb 2015 14:44:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python-scons-native_2.3.2.bb => python-scons-native_2.3.4.bb}    | 0
 .../python/{python-scons_2.3.2.bb => python-scons_2.3.4.bb}           | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.2.bb => python-scons-native_2.3.4.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.2.bb => python-scons_2.3.4.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.2.bb b/meta/recipes-devtools/python/python-scons-native_2.3.4.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.3.2.bb
rename to meta/recipes-devtools/python/python-scons-native_2.3.4.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.3.2.bb b/meta/recipes-devtools/python/python-scons_2.3.4.bb
similarity index 69%
rename from meta/recipes-devtools/python/python-scons_2.3.2.bb
rename to meta/recipes-devtools/python/python-scons_2.3.4.bb
index fc5b302..9b828fa 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.2.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.4.bb
@@ -6,8 +6,8 @@ SRCNAME = "scons"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bbd428da35ec176575a2b0be1f8d7162"
-SRC_URI[sha256sum] = "f993320c5e9515e6567fcce73df0a7a8808414bf1223c69123d3dcf339a449d4"
+SRC_URI[md5sum] = "91fbbb67c2c65b03c746601baac4a6a5"
+SRC_URI[sha256sum] = "4b57d72066fed3b6ff65a7dd9f73633c9b1c09f87520e9b3aae84b3e4864b441"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


