Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8D416F8D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:16:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2I9G0JV014451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 02:16:01 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 02:15:59 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Mar 2014 17:15:57 +0800
Message-ID: <cover.1395133995.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] openldap: add a dependency to make do_compile pass
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
X-List-Received-Date: Tue, 18 Mar 2014 09:16:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 3c5bd3a077d04c140d774d258ac9f2652dda2669:

  phpmyadmin: update to 4.1.9 (2014-03-17 10:46:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/openldap
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/openldap

Chong Lu (1):
  openldap: add a dependency to make do_compile pass

 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


