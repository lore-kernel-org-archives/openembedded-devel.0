Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6BF79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:41:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U8feUc021169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:41:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:41:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:59:23 +0800
Message-ID: <20181030075927.23175-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade packages in meta-perl and meta-gnome
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
X-List-Received-Date: Tue, 30 Oct 2018 08:41:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  libwnck3: 3.24.1 -> 3.30.0
  gvfs: 1.36.2 -> 1.39.1
  adduser: 3.118 -> 3.119
  libio-socket-ssl-perl: 2.059 -> 2.060

 .../gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb}   | 44 ++++++++++---------
 ...{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb} |  4 +-
 .../{adduser_3.117.bb => adduser_3.118.bb}    |  6 ++-
 ....059.bb => libio-socket-ssl-perl_2.060.bb} |  4 +-
 4 files changed, 31 insertions(+), 27 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb} (53%)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb} (78%)
 rename meta-perl/recipes-perl/adduser/{adduser_3.117.bb => adduser_3.118.bb} (91%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.059.bb => libio-socket-ssl-perl_2.060.bb} (91%)

-- 
2.18.0


