Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 708077F265
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:22:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA8AMe19006855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2019 02:22:40 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 8 Nov 2019 02:22:39 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 8 Nov 2019 18:22:33 +0800
Message-ID: <20191108102237.34824-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 0/4] Update 3 packages
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
X-List-Received-Date: Fri, 08 Nov 2019 10:22:40 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  xfce4-genmon-plugin: 4.0.1 -> 4.0.2
  xfce-panel-plugin.bbclass: correct SRC_URI with xfce_verdir
  xfce4-weather-plugin: 0.9.1 -> 0.10.0
  xfce4-screensaver: 0.1.5 -> 0.1.8

 meta-xfce/classes/xfce-panel-plugin.bbclass                | 4 ++--
 ...ce4-screensaver_0.1.5.bb => xfce4-screensaver_0.1.8.bb} | 7 ++++---
 ...genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} | 4 ++--
 ...ther-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_0.1.5.bb => xfce4-screensaver_0.1.8.bb} (81%)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} (72%)

-- 
2.17.1


