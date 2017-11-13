Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A674871D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAD85wBg001400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 00:05:58 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 00:05:57 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Nov 2017 16:04:17 +0800
Message-ID: <cover.1510560146.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] networkmanager/polkit: add consolekit only when x11 is enabled
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
X-List-Received-Date: Mon, 13 Nov 2017 08:05:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 5d6d21e98ed594809169d2b2f6964e90a3369a96:

  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport' (2017-10-27 16:39:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_consolekit_171113_1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_consolekit_171113_1

Jackie Huang (2):
  networkmanager: add consolekit only when x11 is enabled
  polkit: add consolekit only when x11 is enabled

 .../recipes-connectivity/networkmanager/networkmanager_1.4.4.bb       | 3 ++-
 meta-oe/recipes-extended/polkit/polkit_0.113.bb                       | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.11.0


