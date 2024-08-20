Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9ADC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 05:40:48 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.11991.1724132446827711496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 22:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Aug
 2024 13:40:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Aug 2024 13:40:44 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
	<jaminlin1207@gmail.com>
Subject: [PATCH v1 0/1] meta-oe:drgn: add new recipe
Date: Tue, 20 Aug 2024 13:40:42 +0800
Message-ID: <20240820054044.1538795-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 05:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111860

Jamin Lin (1):
  meta-oe:drgn: add new recipe

 .../drgn/python3-drgn_0.0.27.bb               | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb

--=20
2.25.1


