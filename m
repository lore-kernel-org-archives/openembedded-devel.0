Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B92B16FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:15 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so6279992qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=u+VuSLeJdPd+hoVy+1es5Ekl+zgxEUgtz6whG8RL4b0=;
	b=WrZjY8+bYv9nej8U+LObUzXb/S57I0AIAMhNZCFvnt7lv9xOJMZTljmCJEi7fdslBj
	Xu+KJLTee6oyt/acbAOCQrXdaiidc4dzE6LRBW9jILKZaQOxiAbl3Q0ldMidikuuBGox
	tbjpUvD3TasbC9SAQq2lO9kdl9w6df4slaSwtqRCEvdxSnQQUZ31UrLjzAyG7icxIQaW
	pXuTbGWVyzmNagxbJ5MhkO40AvtN+PQ978lYhbmt5JdCuAeN8m4ZVqsTzJ8XvFIX46bY
	2nKVFLAAqjPvZXKxw4r37AiuCAP9AMnTS34XcQWxLieSKCNV3q5f40I7s/dvxo8w5quB
	6Qqw==
X-Gm-Message-State: AD7BkJKZpehfEB0bOtVVkn228HWpFp1JCUe6py1RL2c9w9SkUd4BE3/fbhlrHadVYKP3Mg==
X-Received: by 10.55.79.134 with SMTP id d128mr23356054qkb.73.1458997516120;
	Sat, 26 Mar 2016 06:05:16 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:32 -0400
Message-Id: <ae81670f8fb45588fa90daa17970537a7b1191cf.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 12/30] python-html5lib: update to 0.9999999
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-html5lib_0.999.bb => python-html5lib_0.9999999.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-html5lib_0.999.bb => python-html5lib_0.9999999.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-html5lib_0.999.bb
rename to meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
index 69777e4..bb92e59 100644
--- a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
@@ -2,7 +2,7 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
-SRC_URI[md5sum] = "acb8ba4d6db5637360a07859192eb7f8"
-SRC_URI[sha256sum] = "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
+SRC_URI[md5sum] = "ef43cb05e9e799f25d65d1135838a96f"
+SRC_URI[sha256sum] = "2612a191a8d5842bfa057e41ba50bbb9dcb722419d2408c78cff4758d0754868"
 
 inherit pypi setuptools
-- 
1.9.1


