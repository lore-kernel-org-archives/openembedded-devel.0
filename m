Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B42265DF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:01:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3961JSc025482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:01:24 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 8 Apr 2014 22:58:39 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 13:58:30 +0800
Message-ID: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-oe][PATCH 0/3] Update packages
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
X-List-Received-Date: Wed, 09 Apr 2014 06:01:28 -0000
Content-Type: text/plain


Kai Kang (3):
  libyaml: update to 0.1.5
  sg3-utils: update to 1.38
  yajl: update to 2.1.0

 .../yajl/{yajl_2.0.4.bb => yajl_2.1.0.bb}               | 17 +++++++++++------
 .../libyaml/{libyaml_0.1.4.bb => libyaml_0.1.5.bb}      | 12 ++++++++----
 .../sg3-utils/{sg3-utils_1.31.bb => sg3-utils_1.38.bb}  | 11 ++++++-----
 3 files changed, 25 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-devtools/yajl/{yajl_2.0.4.bb => yajl_2.1.0.bb} (24%)
 rename meta-oe/recipes-support/libyaml/{libyaml_0.1.4.bb => libyaml_0.1.5.bb} (36%)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.31.bb => sg3-utils_1.38.bb} (46%)

-- 
1.8.4


