Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E456F6FF24
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:03:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s67A3d4a002440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jul 2014 03:03:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 03:03:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Jul 2014 03:03:35 -0700
Message-ID: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] fix no newline at end of file
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
X-List-Received-Date: Mon, 07 Jul 2014 10:03:40 -0000
Content-Type: text/plain

The following changes since commit 87bbe91686e1bbc9036aacd924162f17db214aad:

  Uprev memcached from upstream (2014-06-29 23:30:49 -0400)

are available in the git repository at: 

  git://git.openembedded.org/meta-openembedded-contrib rbt/nonewline

for you to fetch changes up to 83bb50ef64429af965af95aa34be88529f664990:

----------------------------------------------------------------
Robert Yang (3):
  meta-oe: fix no newline at end of file
  meta-initramfs: fix no newline at end of file
  meta-networking: fix no newline at end of file

 .../kexec-tools-klibc-2.0.2/x86_basename.patch     |    2 +-
 .../quagga/files/volatiles.03_quagga               |    2 +-
 .../recipes-connectivity/samba/samba/init.samba    |    2 +-
 meta-oe/recipes-devtools/cloud9/cloud9/index.js    |    2 +-
 .../openldap/openldap-2.4.23/initscript            |    2 +-
 meta-oe/recipes-support/rng-tools/files/init       |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.9.5


