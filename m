Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 91CDE71C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:36:17 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d10so1079681qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pzq/E89NwcVRPVe/fGSD5zGW/E7ndv8vmSpgbsalpag=;
	b=T6NdLBIekD7cVbk/u1oby3BM/QQ+ALkCHb2IAEG3emAt+ajD3MUSdPH0SwlKZivqeX
	itr/tU4NK5tJWqahHmsTFG93C8WtlHkak4TLenLeFuAUrW0HxIoAKV4QZhgA3wFywDrz
	hyf94D1JHDLVLx4nC5wMMfNidAcxrWihZNHZHSmvDvEK8A5QOhLQtVJOrgpAn2vs7A2k
	faSojmybsmW8XNilGqSW+G7IdsrZWcWHtkFNoWmtckeFU5leR6n3LpBxZbATdZguaRRP
	XfXoYtwgBd9X8oSutVw8Eaofz7dcKyk5FY//ZovEVApIgPKJFsKZN9/dWBoZAokY8UD/
	uEgg==
X-Gm-Message-State: AIVw113CC7O8Nd623Vqd2VtrhBpwSbHZDxLM7e56k2lNNxnKBA04L9pP
	lr/AobouzjSXcRKbZvU=
X-Received: by 10.200.42.206 with SMTP id c14mr22592925qta.278.1500921378552; 
	Mon, 24 Jul 2017 11:36:18 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id a27sm1663676qta.1.2017.07.24.11.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:36:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:36:12 -0400
Message-Id: <1500921372-15518-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-vobject: update to version 0.9.5
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
X-List-Received-Date: Mon, 24 Jul 2017 18:36:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-vobject_0.9.4.1.bb => python-vobject_0.9.5.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vobject_0.9.4.1.bb => python-vobject_0.9.5.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.5.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.9.5.bb
index fc95193..d2f343e 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.5.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "73432a3e6e9a4788f73a9acc4d7b1fa8"
-SRC_URI[sha256sum] = "faea7d4fb3e2bc8ef6367e7f9b4ad0841aa1980fd5dd96d05c7a90e39880811c"
+SRC_URI[md5sum] = "aa629d6ae95db5edfd5b2402eb1073cb"
+SRC_URI[sha256sum] = "0f56cae196303d875682b9648b4bb43ffc769d2f0f800958e0a506af867b1243"
 
 inherit pypi setuptools
 
-- 
2.7.4


