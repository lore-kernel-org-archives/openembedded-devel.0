Received: from [209.85.218.228] (helo=mail-bw0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MMKba-0005fc-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 13:37:30 +0200
Received: by bwz28 with SMTP id 28so899230bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2009 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=JhjM/7kTKdD6ZAQG35QkZMJSYX/2Mt8otYC5Iv/bgq8=;
	b=Hrue2w3cqwgl3rpPVsYD3FXb+DV1VJXE4Uf7c9AJserd1cOaasYFQt0R3xhYchMb9e
	QppbBCxh3V6jOT9Kb4yEhX6mL+nBdUTS8u2vQtzMycayX5ch13TYuiWTuiiy+aRtSKOA
	85dLrB40d3CP9SZSjQ6tEmt3sTUINdbqZIuoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DDResOHCtbRg8S4notIGWBJP+WRyJGfhQA+MHYULRWg3KHisr5+wsYzXdxjsz12kVn
	qKjLJ+TlbfHm++aRhbOiKDytForxlvFCY2hH4KM1NiimJDQ/gsnqjjGY/2Q1AjOzd4YZ
	pE6EfLg6gKJmw3nZDKdyHlXdcE6IN8n1PJ+E0=
Received: by 10.102.244.8 with SMTP id r8mr6300941muh.22.1246533927707;
	Thu, 02 Jul 2009 04:25:27 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id e9sm11017695muf.2.2009.07.02.04.25.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Jul 2009 04:25:27 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2009 14:25:23 +0300
Message-Id: <1246533923-5560-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <fce2a370907020424q5797bc98x6fa4653ecc2977f7@mail.gmail.com>
References: <fce2a370907020424q5797bc98x6fa4653ecc2977f7@mail.gmail.com>
Subject: [PATCH] qt4: updated version to 4.5.2.
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
X-List-Received-Date: Thu, 02 Jul 2009 11:37:30 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini                                 |    8 ++++++++
 .../0003-no-tools.patch                            |    0
 .../0006-freetype-host-includes.patch              |    0
 .../0007-openssl-host-includes.patch               |    0
 .../0008-qt-lib-infix.patch                        |    0
 .../0010-no-simpledecoration-example.patch         |    0
 ...qt4-embedded_4.5.1.bb => qt4-embedded_4.5.2.bb} |    0
 ...s-native_4.5.1.bb => qt4-tools-native_4.5.2.bb} |    0
 ...4-tools-sdk_4.5.1.bb => qt4-tools-sdk_4.5.2.bb} |    0
 ...qt4-x11-free_4.5.1.bb => qt4-x11-free_4.5.2.bb} |    0
 10 files changed, 8 insertions(+), 0 deletions(-)
 rename recipes/qt4/{qt4-embedded-4.5.1 => qt4-embedded-4.5.2}/0003-no-tools.patch (100%)
 rename recipes/qt4/{qt4-embedded-4.5.1 => qt4-embedded-4.5.2}/0006-freetype-host-includes.patch (100%)
 rename recipes/qt4/{qt4-embedded-4.5.1 => qt4-embedded-4.5.2}/0007-openssl-host-includes.patch (100%)
 rename recipes/qt4/{qt4-embedded-4.5.1 => qt4-embedded-4.5.2}/0008-qt-lib-infix.patch (100%)
 rename recipes/qt4/{qt4-embedded-4.5.1 => qt4-embedded-4.5.2}/0010-no-simpledecoration-example.patch (100%)
 rename recipes/qt4/{qt4-embedded_4.5.1.bb => qt4-embedded_4.5.2.bb} (100%)
 rename recipes/qt4/{qt4-tools-native_4.5.1.bb => qt4-tools-native_4.5.2.bb} (100%)
 rename recipes/qt4/{qt4-tools-sdk_4.5.1.bb => qt4-tools-sdk_4.5.2.bb} (100%)
 rename recipes/qt4/{qt4-x11-free_4.5.1.bb => qt4-x11-free_4.5.2.bb} (100%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b2027d4..f1ae3f9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20754,6 +20754,10 @@ sha256=4f6319c6031af47ef81fef08f465e4db61c0f169f5eb9bbc8f060cc3db3ffafa
 md5=43e7384c59625af0830032348f672a1d
 sha256=f525ad885675f4c2413d67d9a5efaf7c34862d88c796fe7e7e2d05a42a1a66c8
 
+[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.2.tar.bz2]
+md5=62186345c609a72b89f16d83bc7a130f
+sha256=272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc
+
 [ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.5.tar.bz2]
 md5=05d04688c0c0230ed54e89102d689ca4
 sha256=aac89e862c74b2f3ead768e50e9fa7ada1e4225fe9d1d9e05723a3279259eb96
@@ -20810,6 +20814,10 @@ sha256=61831af6b71c7bd4e1ef542071225835d8c741fa8e079bceab8c83f712e396a1
 md5=f81a94e2ab7713b2d375d4e5cfc8e051
 sha256=aa3f5a459d042681a321f33e8d99468337a00674d68b8a512e0078625c1f51da
 
+[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.2.tar.gz]
+md5=d8bcc070a58db25c228b7729ffad4550
+sha256=4e4c8619335cac14ba0c52d1555fab549a562fb774c1c08dcbd2be9de38120a2
+
 [ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.2.0.tar.gz]
 md5=9519eccf0638c9962f73a7b20da77e0e
 sha256=8fdbc7da376b22796879d6e3b756f71a8800ed1b35fc88aa76cddffd6f1fd883
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch b/recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch
similarity index 100%
rename from recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
rename to recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch
similarity index 100%
rename from recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
rename to recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch
similarity index 100%
rename from recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
rename to recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch
similarity index 100%
rename from recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
rename to recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch
similarity index 100%
rename from recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
rename to recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.2.bb
similarity index 100%
rename from recipes/qt4/qt4-embedded_4.5.1.bb
rename to recipes/qt4/qt4-embedded_4.5.2.bb
diff --git a/recipes/qt4/qt4-tools-native_4.5.1.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
similarity index 100%
rename from recipes/qt4/qt4-tools-native_4.5.1.bb
rename to recipes/qt4/qt4-tools-native_4.5.2.bb
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
similarity index 100%
rename from recipes/qt4/qt4-tools-sdk_4.5.1.bb
rename to recipes/qt4/qt4-tools-sdk_4.5.2.bb
diff --git a/recipes/qt4/qt4-x11-free_4.5.1.bb b/recipes/qt4/qt4-x11-free_4.5.2.bb
similarity index 100%
rename from recipes/qt4/qt4-x11-free_4.5.1.bb
rename to recipes/qt4/qt4-x11-free_4.5.2.bb
-- 
1.6.3.3



