Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3289977D3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w43so19842420wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rqGTr5dYiOF/+/3/AEpA0VX3ncJQ0sCJncgt2P6gSY0=;
	b=KAgKWdTFXXEkpmZWLX2h5e/cCA+552tf22JeUKlgPeVdAzI6PisqRWYUJSIsSa8LkX
	ITVF3qr2Ur/jTps8Fogy94QYu0D+lsWLbnsPY/ruRDyvkj7psYVv5ANVkHD5BSNIRDjj
	OlQJqJD8KskMYRWd9RPZIzmhy70z0pM1BzF+CbRk2D/CChJx2LRNXZ8Fo+QevcE87jdD
	WWcRPyFNwYOPDQnhhLmHHat5V1NxymThoAo8paszh+f6sseZwotMlowrFA6/z1+/0Kmp
	ypy5CPI+AIVPvF6gPv8DZ9jgAV1nnVg2hh3kmlwHKZA0G90fKSe/4qi4S3rLQw1q1WBO
	rn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rqGTr5dYiOF/+/3/AEpA0VX3ncJQ0sCJncgt2P6gSY0=;
	b=ZL+d3r4KaZcF6ZhtkB5+XB5PHNDDC4RcxUop34cgYvV6VR+uIt7fyl3o9SQs+/YC3H
	6nn3a6Rnn6H10JWl9og64L6YhCV2mlXMdkU7zTRvwRgJmLVOFUhqAK+LENhRDikaEF0b
	ZH/KqzM7XCldmDR95Otuv0mTHPaK4IEQINLjq4LtgyE8Iwc+Jlv/+B6XVtIGiOWFCo8k
	3wQqPxidwByQHTDo6NGtU38IRTrDPTGNSwZynycXcSNtx07+9JaXj9gwKmzWvUZOMLxS
	d/OntD2uxRlpJsduqdMzMvNva3De/pveyeqz38RCMZFoHO7ISqnuWM+EKY6zr67Jxu+B
	926w==
X-Gm-Message-State: AFeK/H1On733nzd/FSj4hgu5/fzorRM14AYGmh1WVLt0vuYqmZ0uwJO82Sapl23TJjxzXw==
X-Received: by 10.223.134.50 with SMTP id 47mr2453617wrv.50.1490960298223;
	Fri, 31 Mar 2017 04:38:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	189sm2567191wmm.31.2017.03.31.04.38.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:38:03 +0200
Message-Id: <20170331113803.31535-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 7/7] alsa-equal: Update SRC_URI to something valid
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:17 -0000

From: Khem Raj <raj.khem@gmail.com>

www.thedigitalmachine.net has disappeared

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
index 637d029ba..3bed70e1a 100644
--- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "A real-time adjustable equalizer plugin for ALSA"
-HOMEPAGE = "http://www.thedigitalmachine.net/alsaequal.html"
+HOMEPAGE = "https://web.archive.org/web/20161105202833/http://thedigitalmachine.net/alsaequal.html"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "alsa-lib"
 
 SRC_URI = " \
-    http://www.thedigitalmachine.net/tools/alsaequal-${PV}.tar.bz2 \
+    https://launchpad.net/ubuntu/+archive/primary/+files/alsaequal_${PV}.orig.tar.bz2 \
     file://0001-Fix-asneeded.patch \
     file://0002-Fix-Eq-CAPS-plugin-name.patch \
     file://0003-Fix-mixer.patch \
-- 
2.12.2


