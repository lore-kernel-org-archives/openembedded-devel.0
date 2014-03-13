Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 374D26EAC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:26:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2D3QhqT020758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 20:26:43 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 12 Mar 2014 20:26:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Mar 2014 11:26:40 +0800
Message-ID: <cover.1394681037.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] net-snmp: add knob whether nlist.h are checked
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
X-List-Received-Date: Thu, 13 Mar 2014 03:26:46 -0000
Content-Type: text/plain

The following changes since commit 3cb58d800c5131bd0519a676a45c26f47b69745f:

  fbgrab: fix installed but not shipped warnings (2014-03-11 14:58:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/netsnmp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/netsnmp

Chong Lu (1):
  net-snmp: add knob whether nlist.h are checked

 ...snmp-add-knob-whether-nlist.h-are-checked.patch | 35 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |  4 +++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch

-- 
1.8.1.2


