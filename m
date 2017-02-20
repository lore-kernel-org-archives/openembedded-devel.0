Return-Path: <straka.derek@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B55C971B1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:58:48 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 1so6648398pgz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/ZA1I3W0UDEWIcnTBTGpBP6t9DHCvkAOxBnEFRRcVFo=;
	b=J88FS9nAuNTPAP5Dajl9YBH+6rCqDJHlP8G7g/pvWO0KV7/6reo7KKxHfsB87SixUL
	5MHuHnoYqhqSnyblNNE4n9rVv5tRnlkFxpcd9qbLOpZX6LHFBZ/uVdADk09eegN1xz4G
	li8QfPvTm/7QiZi6aPtb99XYJAZ8y+3OV0m3YMhFsFMNPE6180UJ4Xq9CAZmTXpQY2AF
	1Nm9SfHwb2aCDyrGtUbog2GwrTJvNlPdcKQQfgtM/WenZMwHzWm16ffZpGcq4E3yzbxW
	ZKaaD81jJVHoLUeNPHtUMxajWYc/3g30ygN7IUqa2hRchdCsgo/ov5Wll5l8fD5x0NsZ
	ntkg==
X-Gm-Message-State: AMke39lU4k4tTCHwR3yYY1mZf/5DSD9ez2GPdmzCoDlofGaRPPkygy234I8P1YoQxGYlUg==
X-Received: by 10.84.179.165 with SMTP id b34mr33721178plc.147.1487613529429; 
	Mon, 20 Feb 2017 09:58:49 -0800 (PST)
Received: from localhost.localdomain (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id
	t133sm36658496pgc.24.2017.02.20.09.58.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 09:58:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:58:16 -0500
Message-Id: <1487613496-16407-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] ninja: update version to 1.7.2
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
X-List-Received-Date: Mon, 20 Feb 2017 17:58:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/ninja/{ninja_1.7.1.bb => ninja_1.7.2.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/ninja/{ninja_1.7.1.bb => ninja_1.7.2.bb} (100%)

diff --git a/meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/ninja/ninja_1.7.1.bb
rename to meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
-- 
2.7.4


