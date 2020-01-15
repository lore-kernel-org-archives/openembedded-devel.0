Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1D37F9C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:28:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889252"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 79C624CE1CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:19:51 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:28:56 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:06 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:18 -0800
Message-ID: <1579093951-77460-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 79C624CE1CB3.A672C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-h5py: upgrade 2.9.0 -> 2.10.0
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
X-List-Received-Date: Wed, 15 Jan 2020 09:28:59 -0000
Content-Type: text/plain

-License-Update: Copyright year updated from 2008 to 2008-2013.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
index 7822e463e..9db23918c 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
@@ -2,12 +2,12 @@ SUMMARY = "Provides both a high- and low-level interface to the HDF5 library fro
 HOMEPAGE = "https://www.h5py.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6"
+LIC_FILES_CHKSUM = "file://licenses/license.txt;md5=798db444108a3ba1de5f804ff696ebb1"
 
 SRC_URI = "git://github.com/h5py/h5py.git \
            file://0001-cross-compiling-support.patch \
           "
-SRCREV ?= "8d96a14c3508de1bde77aec5db302e478dc5dbc4"
+SRCREV ?= "1156f5ac1ca38db85dcd906cf19a7aba90d0b39a"
 
 inherit setuptools3
 
-- 
2.17.1




