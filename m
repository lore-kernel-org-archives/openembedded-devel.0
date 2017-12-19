Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37E5C784DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:59:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g10so25416753qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xw23sR7vOA0jKbhgxoTHYKP/FJwFwmd4TljGPmENGZ4=;
	b=F86dw4dyNRbKA7evbTrRnyoT1RkvpNuwiobMKxrNMD/LEgOPS95OX0VBJkZdmtk9h5
	ZNLOG63UYc+naH0VM8KGTaCNHX/JCYNrfMSZ1S7tQ1E6sRU4DSoT9had+f5jpW6t0RTJ
	Af6uY3dmVQ0jWUNIzDMpXT3+t0qi1BNdL9h7+je7kak+VPWnmNRPERAPHBn/XDTdhAbm
	vq2SMwFvPTL8uqearHwddJin5yTk5GQMh7P3IdL2IONQuwsVGljgSq/jNDygPUpF9rzw
	EFhmJyOdpiaqDgXiSx6m8Tgu8520Vg6tecJAB0D56DaGzY1oinVI4/RgWwD9f2AovMl6
	ZWig==
X-Gm-Message-State: AKGB3mJ4Og/oNQKW3OynSY7FQEciOJcIZPd36dzFmvt83ny9TS3wOMvc
	DKtvnYncpZVP2ZzHM7MufSrPyS/S
X-Google-Smtp-Source: ACJfBotURen2pTb5djLI5TzZ1zRJz44a+AyVkS8oEsm+zLy9GyyjDvF+E9+HXZy4WOqOBKz3bSgyuA==
X-Received: by 10.200.57.39 with SMTP id s36mr6542546qtb.208.1513709968765;
	Tue, 19 Dec 2017 10:59:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id x1sm9529229qti.91.2017.12.19.10.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 10:59:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 13:59:21 -0500
Message-Id: <1513709961-27025-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ipaddress: update to version 1.0.19
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
X-List-Received-Date: Tue, 19 Dec 2017 18:59:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ipaddress_1.0.18.bb => python-ipaddress_1.0.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ipaddress_1.0.18.bb => python-ipaddress_1.0.19.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb
rename to meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb
index cc4f589..9c50b46 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
 DEPENDS += "python-pip"
 
-SRC_URI[md5sum] = "310c2dfd64eb6f0df44aa8c59f2334a7"
-SRC_URI[sha256sum] = "5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1"
+SRC_URI[md5sum] = "d0687efaf93a32476d81e90ba0609c57"
+SRC_URI[sha256sum] = "200d8686011d470b5e4de207d803445deee427455cd0cb7c982b68cf82524f81"
 
 inherit pypi setuptools
 
-- 
2.7.4


