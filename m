Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 02D7977FC1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:31:24 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id k74so24483147qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U8fP6Gi6Y+/ThLr6gW6jWxwuBks0EN6F83nClmCx7KI=;
	b=GxQ8Jxz4FxpzWwWWgfsq7rPT9Q01SgRlySykDhmyYfVsuZuodT9qzfhXexYNMPhMH9
	zXvKAA/7cBX1IRU7bbGnbHHVvCbXvSe485KX3zwEG02rrP5SZbh+/+82CyvxIBNP/Gjh
	paBfGeqVEiGfe+SAxURB+7so1C3PDYAlhTTmogc8bw1fZc7Y3mSZ5BTrNrjfITqamAHl
	v7R0dgAfwh5Aqj44yO9mn74umEgw2UiplHRHhtbkYSDg2/lQhIkkgqffb6HDPwhp9WcV
	iSMZnUXlOEDafjUeuJRU4HIBtv/zmVjOqw+ue40esfUp2ZeWnN+WTMadfNVwxlWAPmJt
	xOHw==
X-Gm-Message-State: AODbwcDQfIXXKnSlnB9bjEFOAMXFe7P6BWoYsyFrAS/weZwM+aoco+mG
	NLTLzPBClvg6fA==
X-Received: by 10.55.33.70 with SMTP id h67mr30037668qkh.163.1495575085897;
	Tue, 23 May 2017 14:31:25 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	s21sm1260702qtc.58.2017.05.23.14.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 14:31:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 17:31:20 -0400
Message-Id: <1495575080-16556-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libcapture-tiny-perl: update to version 0.46
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
X-List-Received-Date: Tue, 23 May 2017 21:31:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libcapture-tiny-perl_0.36.bb => libcapture-tiny-perl_0.46.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.36.bb => libcapture-tiny-perl_0.46.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb
rename to meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb
index e77dd77..2719811 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.46.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "db6444111c30ac01a76a4c118241c7b6"
-SRC_URI[sha256sum] = "ab8742e53ad204a421bc82d5813f3c4c85c76581ea10d910d0aefc161f8cb03d"
+SRC_URI[md5sum] = "d718af07729d26a793949ca6ba2580a7"
+SRC_URI[sha256sum] = "5d7a6a830cf7f2b2960bf8b8afaac16a537ede64f3023827acea5bd24ca77015"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


