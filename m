Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KqFRg-0007po-Gz
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 01:06:24 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A23698400B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2008 01:01:14 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C8D7B8400A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2008 01:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178090112.adsl.alicedsl.de
	[85.178.90.112]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2008 01:01:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 0F53A3C1DE; Thu, 16 Oct 2008 01:01:12 +0200 (CEST)
Date: Thu, 16 Oct 2008 01:01:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081015230112.GB5563@rhein.zuhause.netz>
References: <200810151022.38477.zecke@selfish.org>
	<200810152153.52020.zecke@selfish.org> <gd5i1h$frs$1@ger.gmane.org>
	<200810160043.08202.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200810160043.08202.zecke@selfish.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 23:06:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

just checked for uclibc. It has the HASH support at least in the svn version
I checked, but it is disabled in our configs.

Bye Henning


