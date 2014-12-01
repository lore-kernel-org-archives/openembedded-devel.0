Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4CF6721D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 09:44:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB19iSQB015538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 1 Dec 2014 01:44:28 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Mon, 1 Dec 2014 01:44:27 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Dec 2014 17:43:18 +0800
Message-ID: <1417426998-26729-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] meta-gnome: fix typo of directory name
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
X-List-Received-Date: Mon, 01 Dec 2014 09:44:28 -0000
Content-Type: text/plain

Fix typo of directory name 'recipe-devtools' in meta-gnome. It should
recipes-devtools.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/{recipe-devtools => recipes-devtools}/glade/glade3_%.bbappend | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/{recipe-devtools => recipes-devtools}/glade/glade3_%.bbappend (100%)

diff --git a/meta-gnome/recipe-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
similarity index 100%
rename from meta-gnome/recipe-devtools/glade/glade3_%.bbappend
rename to meta-gnome/recipes-devtools/glade/glade3_%.bbappend
-- 
1.9.1


