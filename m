Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10F1973341
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEiolk025007; Fri, 13 Feb 2015 14:44:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I34DbDUA9VxV; Fri, 13 Feb 2015 14:44:57 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEipjZ024982
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-00027A-Ke; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:32 +0000
Message-Id: <1423838674-8066-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] libpciaccess 0.13.2 -> 0.13.3
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
 .../xorg-lib/{libpciaccess_0.13.2.bb => libpciaccess_0.13.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.2.bb => libpciaccess_0.13.3.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
index d837bbd..bbba24e 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
@@ -8,7 +8,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
-SRC_URI[md5sum] = "b7c0d3afce14eedca57312a3141ec13a"
-SRC_URI[sha256sum] = "abab8c2b050afb89bc29280e9c6b50ec5867174960d88bfb81a01036ec20de19"
+SRC_URI[md5sum] = "1f65be5ffc55641c1846c2f41d180d00"
+SRC_URI[sha256sum] = "6cd76ccae4e06eee47d3ead84a118740e9406e2a9b7adc9b08e92c69ce89c2e3"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.1.0


