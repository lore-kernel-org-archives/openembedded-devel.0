Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E4B6F139
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1PAsL83009773
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Feb 2014 02:54:21 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 25 Feb 2014 02:54:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Feb 2014 18:54:15 +0800
Message-ID: <cover.1393325556.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] strongswan: fix building lib32-strongswan failed while systemd enabled
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
X-List-Received-Date: Tue, 25 Feb 2014 10:54:22 -0000
Content-Type: text/plain

The following changes since commit 8089aa451827cb791c7d795b9899dc152d1ceb66:

  vlc: Fix build with flac-1.3.0 (2014-02-24 10:10:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-strongswan
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-strongswan

Hongxu Jia (1):
  strongswan: fix building lib32-strongswan failed while systemd enabled

 meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


