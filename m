Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D131470034
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:42:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u791gimZ029127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 8 Aug 2016 18:42:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:42:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 21:42:38 -0400
Message-ID: <cover.1470706568.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 0/4]add ttf-fonts packages
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
X-List-Received-Date: Tue, 09 Aug 2016 01:42:47 -0000
Content-Type: text/plain

Changed in V2:

- Add missing changes in layer.conf.

- Don't use TABS in meta-oe layers.

//Hongxu

The following changes since commit da81d9ef8d052c1884abd8dc0d5354f2e9a23cc4:

  proftpd: return stderr to syslog (2016-08-05 09:34:51 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fonts
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fonts

Hongxu Jia (4):
  ttf-abyssinica: add version 1.500 to support Amharic language
  fontforge-native: support python module
  ttf-lohit: add version 2 to support Indian languages
  ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support Sinhala
    language

 meta-oe/conf/layer.conf                            |  3 +++
 .../fontforge/fontforge_20150824.bb                |  2 +-
 .../ttf-fonts/ttf-abyssinica_1.500.bb              | 17 +++++++++++++++
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb | 24 ++++++++++++++++++++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb  | 23 +++++++++++++++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb

-- 
2.8.1


