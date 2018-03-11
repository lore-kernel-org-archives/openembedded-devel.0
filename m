Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD597888A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:56:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v124so9429940qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wYwvyHCqJ5wWBalYBFiL0I+SttIcqVRw9iNco0K1w8c=;
	b=FAZIswoAHaCDiSXrJCNHwbEixKvlAhp2gqIwsGKvSSo0a5+MgxneiRxOzG/3Hfz8b6
	ZJCyfbf+1JZ+xVJiZV8OlZyEIQSYQvGlbgqrC2yCs47GUyvatH8h7vnTOVLJWBi7JEnW
	BcI8bqbLuMLiD2NWlLNvMH3iyv2DegS2TwmeuWXBPElRl3Dk/QVAifgF4uYBcPDHeRzr
	3sUrJxC8ARD93wGBJPGb7th7WXiXiU0SLnjEmqQCsjd6Za2ZTjn+UpGhHUUCLyiBPyrQ
	lpG6mYAE4gGIYNnyzXaX5f+gbC6133rJ0/tSRSuMhl8oKbStg+8WKF1B9JWeOoRYETyT
	HjrQ==
X-Gm-Message-State: AElRT7Fdi0zLUze6yx9rZ9WHTHmX8Szab2zPck62XZD2IK/gU4aoap8F
	l4mAWlH6LplNBl4mH5LevjI2ec8S
X-Google-Smtp-Source: AG47ELuoOYuX6abtEq0mcpMYU32L1mQqEsLCwNrj6H99HKgk3H7DOwfd7zHCePj2xF5y3SLd2H+a5w==
X-Received: by 10.55.21.40 with SMTP id f40mr7973700qkh.287.1520805395955;
	Sun, 11 Mar 2018 14:56:35 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id d129sm73147qkb.21.2018.03.11.14.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:56:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:56:26 -0400
Message-Id: <1520805386-3909-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-pid: update to version 2.2.0
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
X-List-Received-Date: Sun, 11 Mar 2018 21:56:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pid_2.1.1.bb => python3-pid_2.2.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pid_2.1.1.bb => python3-pid_2.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pid_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pid_2.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pid_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pid_2.2.0.bb
index c88d9a0..e438319 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_2.2.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/trbs/pid/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
 
-SRC_URI[md5sum] = "9634b1e3d545544a9d496e25e4530d14"
-SRC_URI[sha256sum] = "b443169d3dc21397695b4a82016fadb4cfdb0ed8b2ddb4aaa428e1701bb34e1f"
+SRC_URI[md5sum] = "04d30308013d16aa882b3806feda8ab2"
+SRC_URI[sha256sum] = "d8bb2ceec21a4ae84be6e9d320db1f56934b30e676e31c6f098ca7218b3d67d4"
 
 inherit pypi setuptools3
 
-- 
2.7.4


