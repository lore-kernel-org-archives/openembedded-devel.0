Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 32C8371E12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:09:40 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id x35so16732359qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0eI0vaC7q1xkk1Ggo1IQgUBjtme7lFMZI2Qae7iSN4=;
	b=DcgL6L6MLtNs1UZ1MBRHVNlZcVU6336qfANgJohz92lQ86a5jizU1jLrXNxPp/hno2
	B/pf/K6RP+mMMKkMGukKIPJ6EkwSg3jVI5Si9WLdQ8z8Tn7xd7w6vMpxqoRBC+hHaE7y
	Csfm4Dybk4lTLau/u7q7QqnGVzlDzg/87+cKs0HEyTZDl9fSPmdeJZ/ZfBG7dVIm8gJC
	U/zJ4fWKodeBZzfki645xP9IVnK1wk/9rXIzb1j2KD0CXpT6tGMKpb4zMR8FijMSE4rn
	eHB9SDm+ZZxJDxCQBVUvrYUUcmheZsGtu5/K0OOCylDlbJNhUvivek797q8oWFEBa6yo
	VVAw==
X-Gm-Message-State: AMke39nMPfJRG77Yys/qtEDVHv/jzBkfYLWQB5kg6+yq6uxCB5PgRUsoWbklzoSQlF5H3Q==
X-Received: by 10.200.38.117 with SMTP id v50mr5295186qtv.230.1487808582010;
	Wed, 22 Feb 2017 16:09:42 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	x125sm1710956qkd.17.2017.02.22.16.09.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:09:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:09:33 -0500
Message-Id: <1487808573-25780-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: drop execute bit on recipes
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
X-List-Received-Date: Thu, 23 Feb 2017 00:09:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz_2016.10.bb  | 0
 meta-python/recipes-devtools/python/python3-pytz_2016.10.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-python/recipes-devtools/python/python-pytz_2016.10.bb
 mode change 100755 => 100644 meta-python/recipes-devtools/python/python3-pytz_2016.10.bb

diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python-pytz_2016.10.bb
old mode 100755
new mode 100644
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb
old mode 100755
new mode 100644
-- 
2.7.4


