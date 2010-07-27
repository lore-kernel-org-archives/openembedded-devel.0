Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Odfa2-0000I5-76
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:32:07 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 05E7C110009D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:31:51 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 576AB110009C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:31:50 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225073080.adsl.alicedsl.de
	[92.225.73.80]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:31:50 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 731563C0EF; Tue, 27 Jul 2010 10:31:36 +0200 (CEST)
Date: Tue, 27 Jul 2010 10:31:36 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100727083136.GB3397@rhein.zuhause.netz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
	<20100727071827.GA3397@rhein.zuhause.netz>
	<alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Tue, 27 Jul 2010 08:32:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hm,

I am not sure the inherit cmake inside cmake is really necessary try it without it and
see what may fail.

Bye Henning


