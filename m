Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D62E87F333
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 07:44:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N7hPKY010927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 00:44:03 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 00:43:46 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 03:43:32 -0400
Message-ID: <20190823074335.162124-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 0/3] Update 2 xfce4 panel plugins
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
X-List-Received-Date: Fri, 23 Aug 2019 07:44:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (3):
  xfce-panel-plugin.bbclass: correct SRC_URI with xfce_verdir
  xfce4-genmon-plugin: 4.0.1 -> 4.0.2
  xfce4-weather-plugin: 0.9.1 -> 0.10.0

 meta-xfce/classes/xfce-panel-plugin.bbclass                   | 4 ++--
 ...e4-genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} | 4 ++--
 ...weather-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} (72%)

-- 
2.20.0


