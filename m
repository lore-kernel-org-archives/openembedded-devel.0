Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E3A297282F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:02:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56320885"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2015 15:59:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0K82Jrd008442
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:02:19 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 20 Jan 2015 16:03:00 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jan 2015 16:02:17 +0800
Message-ID: <1421740939-2630-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20141218115025.GA2462@jama>
References: <20141218115025.GA2462@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][patch v2][PATCH 0/2] system-setup-keyboard: add new recipe
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
X-List-Received-Date: Tue, 20 Jan 2015 08:03:03 -0000
Content-Type: text/plain

this patch add system-setup-keyboard to meta-oe and also add it's depends
system-config-keyboard.

Li xin (2):
  system-config-keyboard: add new recipe
  system-setup-keyboard: add new recipe

 .../system-config-keyboard_1.4.0.bb                | 27 ++++++++++++++++++++++
 .../system-setup-keyboard_0.8.8.bb                 | 27 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
 create mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb

-- 
1.8.4.2


