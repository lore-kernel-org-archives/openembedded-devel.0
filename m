Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6443.1595368869932435581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 15:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06LM18ic002867
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 15:01:08 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 21 Jul 2020
 15:00:55 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 0/1][v2] toybox-inittab unpack to S
Date: Tue, 21 Jul 2020 15:00:54 -0700
Message-ID: <20200721220055.37211-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Should apply to master or master-next.  Built for both
using poky.

Joe Slater (1):
  toybox-inittab: unpack to S

 .../recipes-core/toybox/toybox-inittab_0.8.2.bb   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.17.1

