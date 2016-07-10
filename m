Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B76A2601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 13:04:24 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so1416303qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 06:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cVi/1NgR79MzIGsXjiP22XlLMX2/MA7RapAPbvl2Rzw=;
	b=fm6bnYuo0XtnWbMu1ouaybMDJ2ar97Gx5p9QWVyHPoP2ZqxTfLeTQo+iysjckrkm+c
	sMyK4C1HyOg6lJM1jQ2SX88gMj41RIwOTusTzqd//g3me5bLjpdqoaqcigXtYgwXpV7J
	u7CPxn855a7VFDlrjBena4nCzWwBLZNc0IRLLfx9pH11gdTt33BW1AidS+hxDPJI32is
	UEkEbczU8jpvXUWg+UF3+yQu4ZvU+QVu+heUZnPkwcPtBUrFBsoK93MrZgCl0asgDowY
	7aarTfID1J8ndqMXbNNLre7abqxMFzjFuJ/zH2NBUbolS1Zn7i5Xnnd5krcbt6zr8T+x
	SZIg==
X-Gm-Message-State: ALyK8tJZWze5Ih3Gvqcs1KgLPlwjJ2qiLAtmzS/3DmI1pmy8lw2xL/NCBxm+5v398aPMXQ==
X-Received: by 10.55.21.160 with SMTP id 32mr19533585qkv.210.1468155865114;
	Sun, 10 Jul 2016 06:04:25 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a67sm2900044qkc.24.2016.07.10.06.04.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 06:04:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 09:04:16 -0400
Message-Id: <1468155857-13944-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-urllib3: update to version 1.16
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
X-List-Received-Date: Sun, 10 Jul 2016 13:04:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-urllib3_1.15.1.bb => python-urllib3_1.16.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.15.1.bb => python-urllib3_1.16.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.16.bb
index 10b31c5..9479f96 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "5be254b0dbb55d1307ede99e1895c8dd"
-SRC_URI[sha256sum] = "d0a1dc60433f7e9b90b4f085f1d45753174b4594558b29eda0009abe0b82da4c"
+SRC_URI[md5sum] = "fcaab1c5385c57deeb7053d3d7d81d59"
+SRC_URI[sha256sum] = "63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c4bf9ab"
 
 inherit pypi setuptools
 
-- 
1.9.1


