Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D328977AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:55 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 79so23299240pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JvCjtiGfS6WB07q7sAr5Jsz5/usFKhdy4veCKrpj0KY=;
	b=FB0N08A9VFCHJp5P3grvKsW3TiJm1W9N4DIZeDNu64DEAFdY2kVq3g/76EyYS2m44K
	wnJLLP4juMio/Dw+sVnEBTSL7xPNNtqnt8g21Kcu6N2bx527csBbieIrhfVt1xSlYg3X
	zEOn0TB3OJVZ4fvYVYgYVDRim9YlQqkf6zg1yUcdLz1IDw/J8C7qGos02/KcgAZn4cR3
	pIrWgxnu7+G7cUoXpnX+5g/edzBNRR+t0iWCiXZA8Yhj5dpjB108foBwaT2yk7icSTk0
	b33jpyC6lFdgnfeTIO9G7UQ5FZ+5kP2B/orISIwvvIZtWYTnOmpslS8gZWlKUOnTScTf
	n1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JvCjtiGfS6WB07q7sAr5Jsz5/usFKhdy4veCKrpj0KY=;
	b=PQ88HZi54aJz22y1edvhD7x3FU+AZgBvelnH/72u+bGbZqj1jBEaTSg0Z42vCEJXuD
	AGtuD3cACispEiEvgzkDr2YQVO5JW8GUebfTcOVKkD26v9zG2OlGyECxSWLkfotTSF4c
	KZTuRlizb8D7YC0jKM7ZgwUvqomPhRw+uSB45vzVPtbMvzFfcDCJ7/13f7Jct7Lwmfsd
	OajZF94xn5pham9YIhlNSIeGZ10Do8/EGnsZ05Xbpc+tUwQ8axtNYxBzdGcQs5Lwpp2d
	uqc6jPJ/jelsfi6xjUhZ4YEzNB+0bwuKEiEBa7e8W9fD3PqiykJ3WJxy/eqplQEdMa+R
	AnXQ==
X-Gm-Message-State: AFeK/H3TSiTTVVPoe922s1XRzSvc8p/CM/exdzOsZYTOes+14Q9IFylPhWHja2agTe8gXQ==
X-Received: by 10.98.196.221 with SMTP id h90mr47575400pfk.149.1490208357363; 
	Wed, 22 Mar 2017 11:45:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:33 -0700
Message-Id: <20170322184533.6501-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 10/10] alsa-equal: Update SRC_URI to something valid
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:56 -0000

www.thedigitalmachine.net has disappeared

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.12.0


