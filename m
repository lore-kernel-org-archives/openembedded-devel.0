Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NT0T2-00020O-3b
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 23:04:35 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DB9B51100098
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 23:02:24 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EC13F1100086
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 23:01:43 +0100 (CET)
Received: from rhein.familie-heinold.de (f052225177.adsl.alicedsl.de
	[78.52.225.177]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 23:01:43 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 92BEF3C118; Thu,  7 Jan 2010 23:01:42 +0100 (CET)
Date: Thu, 7 Jan 2010 23:01:42 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100107220141.GB19522@rhein.zuhause.netz>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262697909.3209.26.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262891117.3218.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262899729.457.1.camel@lenovo.internal.reciva.com>
	<20100107214018.GA19522@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20100107214018.GA19522@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/1] Remove `-lintl` from `LIBS`. (was: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl)
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
X-List-Received-Date: Thu, 07 Jan 2010 22:04:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I just checked in the fix now tested with uclibc and eglibc.

Bye Henning


