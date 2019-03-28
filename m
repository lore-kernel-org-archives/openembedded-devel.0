Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 11CF37D15E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2S6LbQ6019137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 23:21:37 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 27 Mar 2019 23:21:36 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Mar 2019 14:21:32 +0800
Message-ID: <1553754094-3471-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 0/2] add python-tqdm and python-cachetools
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
X-List-Received-Date: Thu, 28 Mar 2019 06:21:37 -0000
Content-Type: text/plain

python-tqdm:
Change from V1: add native and nativesdk to BBCLASSEXTEND

Yi Zhao (2):
  python-tqdm: add recipe
  python-cachetools: add recipe

 .../recipes-devtools/python/python-cachetools.inc        | 16 ++++++++++++++++
 .../recipes-devtools/python/python-cachetools_3.1.0.bb   |  2 ++
 meta-python/recipes-devtools/python/python-tqdm.inc      | 13 +++++++++++++
 .../recipes-devtools/python/python-tqdm_4.31.1.bb        |  2 ++
 .../recipes-devtools/python/python3-cachetools_3.1.0.bb  |  2 ++
 .../recipes-devtools/python/python3-tqdm_4.31.1.bb       |  2 ++
 6 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cachetools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-cachetools_3.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm.inc
 create mode 100644 meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cachetools_3.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb

-- 
2.7.4


