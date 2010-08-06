Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OhGwv-0001eP-Ly
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 09:02:38 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4DA7B11001E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 09:02:30 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C43E711001B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 09:02:29 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225074244.adsl.alicedsl.de
	[92.225.74.244]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 09:02:29 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B6D7E3C090; Fri,  6 Aug 2010 09:02:12 +0200 (CEST)
Date: Fri, 6 Aug 2010 09:02:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100806070212.GA6811@rhein.zuhause.netz>
References: <B3E33FFB737EB346B7569E8F883B89E320C6F92BBA@us194mx002.tycoelectronics.net>
MIME-Version: 1.0
In-Reply-To: <B3E33FFB737EB346B7569E8F883B89E320C6F92BBA@us194mx002.tycoelectronics.net>
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
Subject: Re: xf86-input-mouse -- dependency problem
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
X-List-Received-Date: Fri, 06 Aug 2010 07:02:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

please use bitbake -g foobarr and you get a dependency graph, so you can
see what drags in kdrive stuff.

By the way why you need -kdb and -mouse stuff instead of evdev?
 
Bye Henning


