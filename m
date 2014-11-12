Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4292F65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:13:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC2DN4B001810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 18:13:24 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 18:13:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Nov 2014 10:13:20 +0800
Message-ID: <cover.1415758217.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V2 0/1] libbonobo.inc: add libbonobo-bin package
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
X-List-Received-Date: Wed, 12 Nov 2014 02:13:30 -0000
Content-Type: text/plain

Changed in V2:
As Paul suggested, we should use lib_package class to handle this

//Hongxu

The following changes since commit c78eca1ea7452a62f86b740ec59f1cd39e399d73:

  postfix: create or update aliases.db when using systemd (2014-11-10 15:18:55 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-meta-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-meta-oe

Hongxu Jia (1):
  libbonobo.inc: add libbonobo-bin package

 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


