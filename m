Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 64F4073E44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:58:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97190626"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:02:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H7ucnj016517
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:56:38 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 15:58:26 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:49:13 +0800
Message-ID: <1434527353-47017-8-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
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
X-List-Received-Date: Wed, 17 Jun 2015 07:58:12 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

git send-email will catch error as below
 fatal: 0002-samba-upgrade-to-4.1.12.patch: 965: patch contains a line longer than 998 characters

So, please get patch from
https://github.com/bendaaron/meta-oe-dev/commit/47678ed346a1ce347a64705c76df09d4fa537b0e

