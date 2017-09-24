Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30AFF7830A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 01:04:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8O14smG017138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 23 Sep 2017 18:04:54 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sat, 23 Sep 2017 18:04:53 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Sun, 24 Sep 2017 08:51:19 +0800
Message-ID: <20170924005120.28783-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/1] lvm2: refactoring code to disable package config thin-provisioning-tools
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
X-List-Received-Date: Sun, 24 Sep 2017 01:04:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Martin,

Khem and Andre gave comments on the commit of my last commit for lvm2 to filter gplv3 license. So I refactoring the code to filter all the variations of gplv3.

Sorry for inconvenience.

Regards,
Kai



Kai Kang (1):
  lvm2: refactoring code to disable package config
    thin-provisioning-tools

 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.14.1


