Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QfBvb-0008P9-Vl
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 16:21:12 +0200
Received: from thing2.microtoolsinc.com
	(adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net [76.255.12.150])
	(authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p68EH5V1028876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 8 Jul 2011 09:17:09 -0500
From: "George C. Huntington III" <gchiii@mtiemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:17:00 -0400
Message-Id: <1310134621-25789-1-git-send-email-gchiii@mtiemail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: "George C. Huntington III" <gchiii@mtiemail.com>
Subject: [2011.03-maintenance]
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
X-List-Received-Date: Fri, 08 Jul 2011 14:21:12 -0000

Cherry-pick: 0f0ee32d7045bc75ce9759805d04874499f1c958
Tested-by: George C. Huntington III <gchiii@mtiemail.com>

please add this to the 2011.03-maintenance branch
(sorry, i think i screwed up my last attempt to send this request)


Robert Schuster (1):
  cacao-native_hg: Fix cacao-shutdownguard.patch

 recipes/cacao/cacao-native_hg.bb              |    2 +-
 recipes/cacao/files/cacao-shutdownguard.patch |   32 +++++++++++++-----------
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
1.7.4.1



