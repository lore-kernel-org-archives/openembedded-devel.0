Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SJcJg-0002fF-UN
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 05:09:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3G2KtmV014329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Apr 2012 19:20:55 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 15 Apr 2012 19:20:55 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:20:30 +0800
Message-ID: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.202]
Subject: [meta-kde] enable kdelib4-native to build makekdewidgets.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 03:09:25 -0000
Content-Type: text/plain

Hi All,

The original kdelibs4-native recipe is from Samuel Stirtzel, and I update qt4
to enable kdelib4-native to build makekdewidgets.

Regards,
Kai



