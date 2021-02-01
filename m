Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.28942.1612150858002885215
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1113eb81014998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 19:40:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 31 Jan 2021 19:40:42 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Sun, 31 Jan 2021 19:40:41 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>
Subject: [meta-oe][PATCH 0/1] add crash to NON_MULTILIB_RECIPES
Date: Mon, 1 Feb 2021 11:40:36 +0800
Message-ID: <20210201034037.16383-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fixes Yocto #4148. But there is no such kind of information in
previous commit messages of layer meta-openembedded. So record it here.

Kai Kang (1):
  meta-oe: add crash to NON_MULTILIB_RECIPES

 meta-oe/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

