Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OVtTg-0007Nk-Ln
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 23:45:25 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 05D7C110009E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jul 2010 23:40:37 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9D0D7110009B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jul 2010 23:40:35 +0200 (CEST)
Received: from rhein.familie-heinold.de (g230116218.adsl.alicedsl.de
	[92.230.116.218]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jul 2010 23:40:35 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 916D03C097; Mon,  5 Jul 2010 23:40:31 +0200 (CEST)
Date: Mon, 5 Jul 2010 23:40:31 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100705214031.GA2879@rhein.zuhause.netz>
References: <4C3137CF.8090503@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C3137CF.8090503@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gpsd_2.94.bb: fix CROSS COMPILE badness
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
X-List-Received-Date: Mon, 05 Jul 2010 21:45:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

latest libusb seems to use pkgconfig. So please rewrite the configure.ac,
with pkgconfig support for libusb instead of disabling it.

Bye Henning


