Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA77E6F75D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 05:43:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2B5hhpk001516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2014 22:43:43 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 10 Mar 2014 22:43:42 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Mar 2014 13:54:08 +0800
Message-ID: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 0/2] ntp: Resolve some abnormal behaviors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2014 05:43:46 -0000
Content-Type: text/plain

Subject: [oe][meta-networking][PATCH V2 0/2] ntp: Resolve some abnormal behaviors

Changes from V1:
1). Split the original one patch into two patches.
2). Remove crypto default support.
3). Use "/var/lib/ntp" as home-dir.


Thanks,
Xufeng


