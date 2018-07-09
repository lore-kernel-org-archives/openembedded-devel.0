Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 081A574F4B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 18:16:15 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id o2-v6so10172627qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 11:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=64Xfr27s6n8STqA04/IUCgNxhR8MRctKenIG1LqmgY4=;
	b=md9V0eLUuw85aPg/84DYIdqiYdFmzCM1wZghF2uLEEu6zfXLLwV7Pl1ZcyZqauNahl
	UdVJ4CL3VlVRei3ZJlfGwqMhtz94ev5Z3JWzJFJ1JcKLxaj3jB5UKkMi+GpfImjdRb3d
	G1REbtbPrYWf5ZSIzeMEyt0VHKG8wZX61xWzy74ofiestOs07C0VxKU4WDKgXnGD9ptu
	Sp8KaEsbU9J0ew/rsJmdxUvAafy29Wds7x6zeyvPv8DmAdoN0YxB+doUoh6dEv5U4x0u
	SPzn4fpbxtaw2bIa8Xo8RUqasiQCoUiyhzaQ3n7FIvbmOvurAeR9UzgnyktLxtVwNUsL
	3lSA==
X-Gm-Message-State: AOUpUlGcQ/P39k2l3akcqZUSpEWpt9Deu/Kx7PtNzVHpZnr9KPTW9cgU
	BtgQFIAwEperh/b9RClGUmSBO/VH
X-Google-Smtp-Source: AAOMgpcIFk7Fc7WqoU2oDDhgq/laNQy+ntHK7iJkUQEFr01xh9bjuURlth4VDjgG3oPyYdHLeWvlBw==
X-Received: by 2002:a37:b246:: with SMTP id
	b67-v6mr6283789qkf.284.1531160176557; 
	Mon, 09 Jul 2018 11:16:16 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	m12-v6sm8571348qkl.54.2018.07.09.11.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 11:16:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 14:16:09 -0400
Message-Id: <1531160169-14761-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.9.2
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
X-List-Received-Date: Mon, 09 Jul 2018 18:16:16 -0000

License-Update: Modify the line number for the license

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.8.1.bb => python-cmd2_0.9.2.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.8.1.bb => python-cmd2_0.9.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
index 145ab98..74dbaef 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=51;endline=51;md5=0f13c9cfc75288223cf7edd2f3b985a2"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=52;endline=52;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "701b916ffac99137bea413205106f993"
-SRC_URI[sha256sum] = "d09976f9ad2327883c2d07b5acb42e66ad52b17e352873c22041ed124bfe8aba"
+SRC_URI[md5sum] = "bfe0900a2288283a40f0ee7533486a2f"
+SRC_URI[sha256sum] = "e7b6b4b76272a051c943c3c709cd760142af16fbc9218e0ed3c22b28ea38d0a8"
 
 inherit pypi setuptools
 
-- 
2.7.4


