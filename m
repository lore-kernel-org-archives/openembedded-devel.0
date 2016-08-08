Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3A7C77183
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:13:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u787DHZY016352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 00:13:17 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 00:13:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 03:13:10 -0400
Message-ID: <cover.1470640304.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/4]add ttf-fonts packages
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
X-List-Received-Date: Mon, 08 Aug 2016 07:13:18 -0000
Content-Type: text/plain

The following changes since commit da81d9ef8d052c1884abd8dc0d5354f2e9a23cc4:

  proftpd: return stderr to syslog (2016-08-05 09:34:51 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fonts
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fonts

Hongxu Jia (4):
  ttf-abyssinica: add version 1.500 to support Amharic language
  fontforge-native: support python module
  ttf-lohit: add version 2 to support Indian languages
  ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support sinhala
    language

 .../fontforge/fontforge_20150824.bb                |  2 +-
 .../ttf-fonts/ttf-abyssinica_1.500.bb              | 17 +++++++++++++++
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb | 24 ++++++++++++++++++++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb  | 23 +++++++++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb

-- 
2.8.1


