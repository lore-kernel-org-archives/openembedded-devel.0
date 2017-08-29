Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A546B7822A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:28:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T9SDGU013394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:28:13 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 Aug 2017 02:28:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:27:25 +0800
Message-ID: <cover.1503998700.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] corosync: fixes and add support for extra features
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
X-List-Received-Date: Tue, 29 Aug 2017 09:28:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 108cb0394a96ea51c2c3fffb470622b6cd357c63:

  multipath-tools: RDEPEND on bash (2017-08-28 11:06:07 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_corosync_170829_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_corosync_170829_0

Jackie Huang (2):
  corosync: fixes for sysvinit and systemd
  corosync: add support for extra features

 .../recipes-extended/corosync/corosync_2.4.2.bb    | 54 +++++++++++++++-------
 1 file changed, 38 insertions(+), 16 deletions(-)

-- 
2.11.0


