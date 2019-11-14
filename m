Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF787F6CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 06:10:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id q22so3034767pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ku4W+bh+KwKwhlC1EC4bZUwaB0j6S4PFdYhtjqV38jo=;
	b=jw983nZubHKXjRq7E0UteH71HObdq57iTai9m+gg/SF9RTEEu2fDXcGW9dnA/D6Su8
	nx6zDiop4cBtsZGeqmGl4dbMueWP9CeZ3KuN5X5ksYYFBswrtZoO4YSPgjirDwc3IngU
	txZLSOVefRymNOGZQS+lPB5TTMHguAYMQ9XZ6KxuMgxwv31g46eSzeeN8Jrl21qZ3ESs
	L25H1QBmMDXIAlzwphwEVUYfml3yqeLtVAa2tTNJVcqESph5tEJJVQdSZ6YX2OU0mWkV
	XmlOpbmfcjZ5OntIagW9E/vn704sLBmw2xTZlV7zWpo2YGnfHbU4dZ8ziAPlxf45QQR3
	ZruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ku4W+bh+KwKwhlC1EC4bZUwaB0j6S4PFdYhtjqV38jo=;
	b=CaquP/glVLzPel59ce/XaTKQ2L4MglRGv0YD08/cQDMzQiSnbYbBClagJAMurGxRc8
	4F3WeWpWdrURySgrX7K7eH+mkYkykXUpNtrACFTtgbX5yZUp16HFiG/+5VV2p6fBWa/m
	4RZosjLPNOgXHc95oEmhJWsWDFjQU4zTuGivaEjSRyuNa6rnUwa5+ipq1Cnu0pL3RWcb
	ONBlC4C4aSjyoF6nnZs4DH0yewdP9M9AlwJctfpuX/5ILzzvx7xu9jKUSv67AFKAntuC
	xOfCwiEtdhLfJegrNDf2CsaDr/z5Xas+dC4NVzAjxBw28mU38HhBSh53SKy+ZMNPLEDQ
	VQyQ==
X-Gm-Message-State: APjAAAUPMzKdnNzQlvf8qWTXKEErSmeurWC7DuOm7ACG0Q29lfqcY07S
	hyc8Z3Kgn5AMI9Eyl1vYBdPBL4INZ8o=
X-Google-Smtp-Source: APXvYqwJASS38fvYq6EMl1obsYdcRxSbc44v71Jb80Uuv022mBPGV9wTco0I9sMpvGytAm1nwhcgvg==
X-Received: by 2002:a63:4961:: with SMTP id y33mr8395858pgk.264.1573711815326; 
	Wed, 13 Nov 2019 22:10:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	v15sm4735093pfe.44.2019.11.13.22.10.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 22:10:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 22:10:01 -0800
Message-Id: <20191114061001.3605114-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-six: Update to 1.13.0
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
X-List-Received-Date: Thu, 14 Nov 2019 06:10:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python-six_1.12.0.bb => python-six_1.13.0.bb}         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-six_1.12.0.bb => python-six_1.13.0.bb} (100%)

diff --git a/meta-oe/recipes-devtools/python/python-six_1.12.0.bb b/meta-oe/recipes-devtools/python/python-six_1.13.0.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-six_1.12.0.bb
rename to meta-oe/recipes-devtools/python/python-six_1.13.0.bb
-- 
2.24.0


