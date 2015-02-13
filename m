Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 157F1733CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEioll025007; Fri, 13 Feb 2015 14:44:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZX5S0GenJsEn; Fri, 13 Feb 2015 14:44:57 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEip9o024983
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-00027F-N9; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:33 +0000
Message-Id: <1423838674-8066-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] python-pycurl: 7.19.5 -> 7.19.5.1
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
 .../python/{python-pycurl_7.19.5.bb => python-pycurl_7.19.5.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.bb => python-pycurl_7.19.5.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.5.bb b/meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python-pycurl_7.19.5.bb
rename to meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb
index e4619c7..0d0effe 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "\
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "47b4eac84118e2606658122104e62072"
-SRC_URI[archive.sha256sum] = "69a0aa7c9dddbfe4cebf4d1f674c490faccf739fc930d85d8990ce2fd0551a43"
+SRC_URI[archive.md5sum] = "f44cd54256d7a643ab7b16e3f409b26b"
+SRC_URI[archive.sha256sum] = "6e9770f80459757f73bd71af82fbb29cd398b38388cdf1beab31ea91a331bc6c"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
2.1.0


