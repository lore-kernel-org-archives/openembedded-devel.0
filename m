Return-Path: <straka.derek@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0D5871B1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:01:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id a123so11095854pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Eur0IPsc1W0KamUirfTpqdQTXtdlubbKf7325bsd7z0=;
	b=ZCZ+pL9cVYeTkZeuya/FlVnYliEkEYrQjWL2L+rDzOnttVltb2B9PChG4KvP9D4DVU
	0y3K1f7Nk0ELJ8JWPu9WX8tuTG1utPTZBm17daq1eAp1tqe+MVDGn0HWH+dnES7s9BvV
	u7TILAVmzQm0CyI8mU0eg5tIPTVv9FaZyKq9s37p7xwl16qOE/uTfQn86CFikUaKc1Mi
	2+EkhJ1rhpcj+2e1S+QJwkl9yKzX8iFK3xwbcMT5YjF5h4MalEJzso3LOOgXU3/VdadX
	Rel2qf57MSsnZ0bARVrtxEPdeeKM4i08LYITPQbLEnpUfbxbH+AvKiLC8+aeOyDFz0gY
	5ktw==
X-Gm-Message-State: AMke39lQ4FJ5X9kJNOk67VdF2nmgMnIh+JlselrcvB8GXzjTfSeCeIKOimPKXDtU2GgIUg==
X-Received: by 10.98.111.194 with SMTP id k185mr27434235pfc.83.1487613699186; 
	Mon, 20 Feb 2017 10:01:39 -0800 (PST)
Received: from localhost.localdomain (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id
	o125sm36281006pfb.109.2017.02.20.10.01.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 10:01:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 13:01:32 -0500
Message-Id: <1487613692-17308-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCHv2] ninja: update version to 1.7.2
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
X-List-Received-Date: Mon, 20 Feb 2017 18:01:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/ninja/{ninja_1.7.1.bb => ninja_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ninja/{ninja_1.7.1.bb => ninja_1.7.2.bb} (91%)

diff --git a/meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
similarity index 91%
rename from meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
rename to meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
index 2a4b829..37ef00b 100644
--- a/meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
+++ b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "b49b0fc01bb052b6ac856b1e72be9391e962398e"
+SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
 
 SRC_URI = "git://github.com/martine/ninja.git;branch=release"
 
-- 
2.7.4


