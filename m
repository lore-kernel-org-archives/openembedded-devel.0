Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08E777804A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:15:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l25so170921qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LgbBiPmsjrHj+rT4KBdOHyRiyeUxHYVLFP3bHo0IbmE=;
	b=bydszpvbiW/SB5WYvEL7rrQfmD9W0zDCGA8EwwQlgTrfHEKptxuCAIqLuwJFizRoW9
	YgAq8AA0Go/QKIvXM3l1vF8wxuxKoxx3w1OTAzNbYhzrAbi/q6tRYPTxEnTgkuq2twpI
	hq6Hv3+boDsENOXfI0e9CgTW+TahFu3WIpJHdcoPC+FVFQC6p2fl+XcpPPKI4iuHgxXj
	iB3FKjxfexE9nrtpwEQXsXtNJjYMMYcjFrnvg7iX+t5+ha7kc6soVcqFmaOyffDcMgxZ
	klNVEP12sodyFw+/ru26eFa5Nd395RIhJi2gDVvS2eY4/zUYmOaanUwhRjK0d3b4LFv2
	995Q==
X-Gm-Message-State: AHPjjUgrv1kUEixlsW3tUbWPOooKrcGMVD3s2wht+DI3JRpn8E64wbLc
	Huwra8bC+T7msB0YMlz+cb8J0EP4
X-Google-Smtp-Source: AOwi7QAfwPetph27PITN0xs2k7/FdFpNVtKmex9sDaWPhQNCKc6pIzGJVnSoLY64GyzcAA3JS+GBaA==
X-Received: by 10.200.18.76 with SMTP id g12mr3239562qtj.201.1505841342566;
	Tue, 19 Sep 2017 10:15:42 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 13sm7456625qtp.74.2017.09.19.10.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 10:15:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 13:15:34 -0400
Message-Id: <1505841334-2527-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] po4a: update to version 0.52
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
X-List-Received-Date: Tue, 19 Sep 2017 17:15:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} (100%)

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.52.bb
similarity index 100%
rename from meta-perl/recipes-perl/po4a/po4a_0.49.bb
rename to meta-perl/recipes-perl/po4a/po4a_0.52.bb
-- 
2.7.4


