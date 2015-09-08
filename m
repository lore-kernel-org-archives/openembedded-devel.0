Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC3565C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 09:37:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t889b8Lh021434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Sep 2015 02:37:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 02:37:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Sep 2015 17:31:46 +0800
Message-ID: <1441704708-22940-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] Upgrade efivar and efibootmgr
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
X-List-Received-Date: Tue, 08 Sep 2015 09:37:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  efivar: 0.7 -> 0.21
  efibootmgr: 0.6.0 -> 0.12

 .../{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb}    | 21 ++++++++--------
 .../efibootmgr/files/docbook-fixes.patch           | 28 ----------------------
 .../files/w-keep-existing-mbr-signature.patch      | 26 --------------------
 meta-oe/recipes-extended/efivar/efivar_git.bb      |  8 +++----
 4 files changed, 15 insertions(+), 68 deletions(-)
 rename meta-oe/recipes-extended/efibootmgr/{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb} (39%)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch

-- 
1.9.1


