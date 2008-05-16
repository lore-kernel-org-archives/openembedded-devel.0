Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Jx7nU-00063L-50
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 23:49:04 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 081318400D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 23:47:12 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AD9058400CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 23:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.4
Received: from rhein.familie-heinold.de (e178075163.adsl.alicedsl.de
	[85.178.75.163]) by mail.familie-heinold.de (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 23:47:11 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 86E82254C; Fri, 16 May 2008 23:47:10 +0200 (CEST)
Date: Fri, 16 May 2008 23:47:10 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080516214710.GA21911@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: MIPS machine.confs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 21:49:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

there are serval .conf under machine/ (rb500.conf,wrt54,wl500g.conf)
which using TARGET_CC_ARCH = "-Os". I suggest this should be not set
there, becaue it's a distribution-thingie. If no one minds I will clean it up.

Bye Henning


