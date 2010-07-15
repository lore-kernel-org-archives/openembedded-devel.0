Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OZUPk-0002IL-B0
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 21:48:12 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9855C110009F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 21:48:08 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C1F471100097
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 21:48:07 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052233245.adsl.alicedsl.de
	[78.52.233.245]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 21:48:07 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8B33C3C0ED; Thu, 15 Jul 2010 21:48:06 +0200 (CEST)
Date: Thu, 15 Jul 2010 21:48:06 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100715194805.GA8103@rhein.zuhause.netz>
References: <1279133054.4939.16.camel@mattotaupa>
	<20100714194822.GB9771@rhein.zuhause.netz>
	<1279216348.3741.24.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279216348.3741.24.camel@mattotaupa>
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
Subject: Re: uclibc-git: oe_runmake failed: error: '__a1' undeclared (first use in this function) (was: angstrom 2008.1, uclibc: libc.so not found, i. e. not in staging directory)
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
X-List-Received-Date: Thu, 15 Jul 2010 19:48:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

seems that this revision fixes ppc and brakes arm. Not good, I will revert the commit.

Bye Henning


