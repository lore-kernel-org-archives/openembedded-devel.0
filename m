Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91C20601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:09:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o1so364864qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1bXCdnhdqSG6r4etkvDjID0jUgPpI3/DWz2GM8Dwuu8=;
	b=LXTUfB0677IIRld3LXnjVwea9b3qKOC6tVfm8hL4YhZEh40qCCK0qnyE2fC2I+drfi
	4W3lhFMxr6NWAz4qW2kSI0NDlpoQKne6X64Uv8RY8F0siq8hg2z1LoAvQ4HeCqDNgHfY
	iw2umdY06zNiKPSKYcchL+CfiCSxioQVwQijtaXEoKB9dyhUfsyv2SZoCgViv2vqxCbp
	hJkCQcHFLH6jgqlcX0YAJpfx1syuqEMl+3JNQwUYucVSpUu44NrARe39QDYHToM1klqk
	QXhMIxf6nvhmoil+C+K0A6GGVSNACljtWJ/T9N57GJEfSwNBy/ldnMxP52PdAUREgFiM
	AbTA==
X-Gm-Message-State: AEkoouvuFTeyAp3fPzNuCVIQWMN6Z/hk663VJUIVZano3AMtc+1upwlQByhQbm/1jvcb7w==
X-Received: by 10.55.165.78 with SMTP id o75mr13242388qke.163.1470942553622;
	Thu, 11 Aug 2016 12:09:13 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i65sm2284413qtb.18.2016.08.11.12.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 12:09:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:09:04 -0400
Message-Id: <1470942544-24655-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] ninja: update to version 1.7.1
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
X-List-Received-Date: Thu, 11 Aug 2016 19:09:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/ninja/{ninja_1.6.0.bb => ninja_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ninja/{ninja_1.6.0.bb => ninja_1.7.1.bb} (91%)

diff --git a/meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb b/meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
similarity index 91%
rename from meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb
rename to meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
index 4d6c47e..2a4b829 100644
--- a/meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb
+++ b/meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "484c16336f19bd8970bb6e75322d61b92a229899"
+SRCREV = "b49b0fc01bb052b6ac856b1e72be9391e962398e"
 
 SRC_URI = "git://github.com/martine/ninja.git;branch=release"
 
-- 
1.9.1


