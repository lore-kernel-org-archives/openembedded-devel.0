Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OZ7wb-00082V-Ab
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 21:48:38 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AC8B3110009F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 21:48:34 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BE8F81100097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 21:48:33 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052065205.adsl.alicedsl.de
	[78.52.65.205]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 21:48:33 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 40A873C0ED; Wed, 14 Jul 2010 21:48:23 +0200 (CEST)
Date: Wed, 14 Jul 2010 21:48:23 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100714194822.GB9771@rhein.zuhause.netz>
References: <1279133054.4939.16.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279133054.4939.16.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom 2008.1, uclibc: libc.so not found, i. e. not in staging directory
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
X-List-Received-Date: Wed, 14 Jul 2010 19:48:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

hm you want proably uclibc-git anyway because it has nptl-thread support.

Bye Henning


