Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA741791FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:50:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U1o1EZ008116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:50:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 18:50:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 09:07:44 +0800
Message-ID: <20181030010748.3266-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 0/4] Upgrade 4 packages
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
X-List-Received-Date: Tue, 30 Oct 2018 01:50:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  xfconf: 4.13.5 -> 4.13.6
  xfce4-clipman-plugin: 1.4.2 -> 1.4.3
  xfce4-notifyd: 0.4.2 -> 0.4.3
  thunar: 1.8.1 -> 1.8.2

 .../{xfce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb}       | 4 ++--
 ...clipman-plugin_1.4.2.bb => xfce4-clipman-plugin_1.4.3.bb} | 4 ++--
 .../recipes-xfce/thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb} | 4 ++--
 .../xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb}            | 5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb} (84%)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.2.bb => xfce4-clipman-plugin_1.4.3.bb} (76%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb} (86%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb} (67%)

-- 
2.18.0


