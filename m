Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 975BC6AC31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:30:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9K6UKFL010956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 23:30:20 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 19 Oct 2014 23:30:19 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 02:30:17 -0400
Message-ID: <cover.1413786344.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-networking] ntp: add status for initscript
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
X-List-Received-Date: Mon, 20 Oct 2014 06:30:25 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Get /etc/init.d/ntpd support options 'status'.

The following changes since commit 71d2fe7c9e2681fede255d7f5b430d63a122ab18:

  vim: add ncurses-terminfo-base as a runtime dependency (2014-10-18 10:47:43 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ntpd-status
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntpd-status

Wenzong Fan (1):
  ntp: add status for initscript

 meta-networking/recipes-support/ntp/files/ntpd |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.9.5


