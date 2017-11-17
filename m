Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE117883F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:37:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id e19so7941603qte.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rZ80S1kCFH27yUSO7Dt6OTUhPRG7MN9aI9NssbnOAJI=;
	b=Q1J8QrvFJwfowTds7ZuRfmtsjUexkmIqUL9qfP5WyvbEP3Mtd6Is6NlvVw+Dsq9tqP
	PidWxaxNzTsolJr3QlKz/Uta2XajaLx5JKX6v7u5C+naopfv5bH257QoPNIXpGb5dKU2
	Ipm5S4IIAXVhw3msuTQLarxt5gAC+0E/YPjM0jTc6F5EA2GCHoEP08dsSh5nt9OJSDY1
	VJ1LRpAuBENeocpdtsRattXU9L67UYB3Zdt0nhUaoUBlx9DttP1QptOzhVfN380jqwaq
	clnrXhbTUi9RoQDDFHiknLBTBHT6F88T2ssqanDXEowMWq950to8V6zzd/IsFjiYSK2A
	KejA==
X-Gm-Message-State: AJaThX5alsnhtHi36geZiihVfSeOTzKDoLwijEzmhyANL89/DgwPd04f
	atCngSrSpjyv30pVR+80lBPjcgob
X-Google-Smtp-Source: AGs4zMYn6uLcEB19Bb7YmaKvfbUqGz1FIFNWWFquPiqDUrOwNIbNQStPr/33mNrc5iOXsqIZjRRGAA==
X-Received: by 10.237.33.130 with SMTP id l2mr9874926qtc.120.1510943837067;
	Fri, 17 Nov 2017 10:37:17 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z18sm2882958qkb.32.2017.11.17.10.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:37:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:37:09 -0500
Message-Id: <1510943829-25203-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-coverage: update to version 4.4.2
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
X-List-Received-Date: Fri, 17 Nov 2017 18:37:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-coverage_4.4.1.bb => python3-coverage_4.4.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_4.4.1.bb => python3-coverage_4.4.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb b/meta-python/recipes-devtools/python/python3-coverage_4.4.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_4.4.2.bb
index 6aa5c59..c983e0b 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_4.4.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "4c4d997cb32be4703f1fde54e6cd1b1c"
-SRC_URI[sha256sum] = "7a9c44400ee0f3b4546066e0710e1250fd75831adc02ab99dda176ad8726f424"
+SRC_URI[md5sum] = "29a9fe85377e0f7327cf5db1e335483f"
+SRC_URI[sha256sum] = "309d91bd7a35063ec7a0e4d75645488bfab3f0b66373e7722f23da7f5b0f34cc"
 
 inherit pypi setuptools3
 
-- 
2.7.4


