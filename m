Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87DAE7C763
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:32:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x281WhUf006712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:32:43 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:32:42 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:32 -0500
Message-ID: <20190308013237.194105-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-gnome][meta-xfce][PATCH 0/5] Upgrade packages
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
X-List-Received-Date: Fri, 08 Mar 2019 01:32:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (5):
  thunar: 1.8.2 -> 1.8.4
  libtimezonemap: 0.4.5 -> 0.4.6
  gvfs: 1.39.1 -> 1.39.92
  metacity: 3.28.0 -> 3.30.1
  libgtop: 2.38.0 -> 2.39.91

 .../gvfs/{gvfs_1.39.1.bb => gvfs_1.39.92.bb}          |  4 ++--
 .../libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb} |  6 ++++--
 ...ibtimezonemap_0.4.5.bb => libtimezonemap_0.4.6.bb} | 11 ++++-------
 .../{metacity_3.28.0.bb => metacity_3.30.1.bb}        |  2 +-
 .../thunar/{thunar_1.8.2.bb => thunar_1.8.4.bb}       |  4 ++--
 5 files changed, 13 insertions(+), 14 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.39.1.bb => gvfs_1.39.92.bb} (93%)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb} (60%)
 rename meta-gnome/recipes-gnome/libtimezonemap/{libtimezonemap_0.4.5.bb => libtimezonemap_0.4.6.bb} (74%)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.28.0.bb => metacity_3.30.1.bb} (95%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.2.bb => thunar_1.8.4.bb} (86%)

-- 
2.20.0


