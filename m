Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DDC2078458
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:38:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so11404612qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=madzJLIAyzoQJ0cVBtYNRPDtj9celc/uBkO2tUxYJ/4=;
	b=WbnZ90qwPhJwdL7TBl+kDfpIIKygWn3xoheop11F+5NHGBSmabHkiId0v16IRntVNp
	GBee7h2/RhxbegHPZvMRaY+ea9Qb8vySxVIvHnTUf7SGVuWcD/XlRQ+1F5mdoqNzEDJA
	sJXmaSJTef/HYR5u8xhL9EAau+/C80yt3foK7oIz/v++ByH3KsxAr3bN+LkHNDKebgQc
	5akkfffasMLQQPjJEMXzt/ibUw8KFxNcQmDHbwxjZjziNpg0uKt1pix+Wp/4baWRrSBt
	0EtVL7fJNgUk935SccjKmKjAhAD6lgIZVdvoXljawc5sbXMhxM/AFMA7882uzXxIHqj4
	o8Zg==
X-Gm-Message-State: AKS2vOxnKyo+XE+zYpLd+4fxxLzlcCRbB3wZlE2PaLy4gwfkIXhbFD68
	sLRojaPad/UlLRMCZhg=
X-Received: by 10.55.166.194 with SMTP id p185mr8938459qke.132.1497631122723; 
	Fri, 16 Jun 2017 09:38:42 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	u186sm1808204qka.45.2017.06.16.09.38.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:38:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:38:33 -0400
Message-Id: <1497631113-11460-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 16:38:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.0.bb => python-cmd2_0.7.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.0.bb => python-cmd2_0.7.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
index 5c092a7..a379de0 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=43;endline=43;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "ee92ff1b73765d64bf230e94512d0b7a"
-SRC_URI[sha256sum] = "5ab76a1f07dd5fd1cc3c15ba4080265f33b80c7fd748d71bd69a51d60b30f51a"
+SRC_URI[md5sum] = "4a5b5aab407bdeb49634789f9a42902b"
+SRC_URI[sha256sum] = "d06301cc578a83531261121c0b11d79d29d0a80aca01ed6752c20c4cfcda2dd9"
 
 inherit pypi setuptools
 
-- 
2.7.4


