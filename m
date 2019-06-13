Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 632EB6C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 03:24:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,367,1557158400"; d="scan'208";a="67175624"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jun 2019 11:24:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 837554CDDAEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 11:24:20 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 13 Jun 2019 11:24:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Jun 2019 11:25:32 +0800
Message-ID: <20190613032534.9975-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 837554CDDAEA.A860D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [yocto][meta-openembedded][master][warrior][PATCH 0/2] python-pywbem: solved the conflict with python3-pywbem
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
X-List-Received-Date: Thu, 13 Jun 2019 03:24:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Use the update-alternatives class to resolve conflicts.

Zang Ruochen (2):
  [yocto][meta-openembedded][master][warrior][PATCH 1/2] python-pywbem: solved the
    conflict with python3-pywbem
  [yocto][meta-openembedded][master][warrior][PATCH 2/2] python3-pywbem:solved the
    conflict with python-pywbem

 .../recipes-extended/pywbem/python-pywbem_0.11.0.bb      | 9 ++++++++-
 .../recipes-extended/pywbem/python3-pywbem_0.11.0.bb     | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.20.1




