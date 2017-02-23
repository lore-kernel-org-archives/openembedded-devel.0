Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3DF372FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:04:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x35so2503409qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aGPJEMN5DOvK/jFlmtLefZCc+Chxz9Yh3WDngFSA5y4=;
	b=RueCf06v35OyFsKwEa7/GwtA86jpCfYBa5kcj9l9kqBnq/BpU84Eu3DFQ/Tq7Q7ZUa
	7Wk623kc6Qk6Mmf2pz4wrwaWfFyE71kBcADqlvGxPwoF2nyRTIATG6AoPY4p5QJiOime
	y/KfQttC5lIrencVaT4p+rMdvFrneOp6HhnJKJjzuTdqAFoDiSQvPwshJQQmThvIVr1o
	2Y82w/y8hHhNhZXGo1+OTPZpWEjGKT484Gh8ACPCCNwhGvOsqBpF7CGixbf/upvics/8
	l0Q97P0++Xt5PmLCVWZiNZip9f3Z7gszNXHWKF0Y3wLmO3WoqyUVlrajrAduSSVDutZc
	sZOA==
X-Gm-Message-State: AMke39lXBhcnA8GuJTB7C4fJOcqIBa3L95Y/dDsFCoHQhzv2blZZRYNkAxvQBfeLPf2jzw==
X-Received: by 10.200.0.25 with SMTP id a25mr34088604qtg.191.1487808286088;
	Wed, 22 Feb 2017 16:04:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	f126sm1687026qkc.47.2017.02.22.16.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:04:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:04:37 -0500
Message-Id: <1487808277-25529-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-vobject: update to version 0.9.4.1
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
X-List-Received-Date: Thu, 23 Feb 2017 00:04:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-vobject_0.9.3.bb => python-vobject_0.9.4.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vobject_0.9.3.bb => python-vobject_0.9.4.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.3.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-vobject_0.9.3.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb
index 58cf00b..fc95193 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.3.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.4.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "fe5996008d5e4858d63156b37b43d59c"
-SRC_URI[sha256sum] = "10b150b87ee5fffefd3aa1ea12f31aab45a7b7d010d1ce6816afaff8db726520"
+SRC_URI[md5sum] = "73432a3e6e9a4788f73a9acc4d7b1fa8"
+SRC_URI[sha256sum] = "faea7d4fb3e2bc8ef6367e7f9b4ad0841aa1980fd5dd96d05c7a90e39880811c"
 
 inherit pypi setuptools
 
-- 
2.7.4


