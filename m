Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.22745.1594146332790791113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2020 11:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 067IP06Q002728
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jul 2020 11:25:21 -0700
Received: from mt-manjaro (128.224.73.1) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 7 Jul
 2020 11:24:55 -0700
User-agent: mu4e 1.4.10; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-browser?] creating an Angular recipe
Date: Tue, 7 Jul 2020 14:24:53 -0400
Message-ID: <87o8orche2.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.73.1]
Content-Type: text/plain

Hi all,

I'm planning to create an Angular recipe for yocto.

Do you guys think meta-browser is an appropriate layer to store this recipe, or another layer should be used instead (like meta-nodejs)

Thanks,
--
Mingde (Matthew) Zeng
