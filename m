Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NxJgJ-0004cs-MO
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 14:39:40 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2EF6411001C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 14:36:01 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2CFDE11000EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 14:36:00 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225074135.adsl.alicedsl.de
	[92.225.74.135]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 14:36:00 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1238B3C09D; Thu,  1 Apr 2010 14:35:59 +0200 (CEST)
Date: Thu, 1 Apr 2010 14:35:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401123558.GA20218@rhein.zuhause.netz>
References: <1270119942-11215-1-git-send-email-zlo@zlo.nu>
	<1270120375-11311-1-git-send-email-zlo@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <1270120375-11311-1-git-send-email-zlo@zlo.nu>
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
Subject: Re: [PATCH] freetype 2.3.5/2.3.6: Import GetDescender() fix
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
X-List-Received-Date: Thu, 01 Apr 2010 12:39:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2010 at 01:12:54PM +0200, Marc Olzheim wrote:
> [PATCH] freetype 2.3.5/2.3.6: Import GetDescender() fix from Savannah from
> ftcalc.c 1.79 for Savannah bug report #23556.
> 
> This was fixed by freetype a month after the release of 2.3.6.

Thanks for the patch, but it's maybee better to update freetype
to a recent version.

Bye Henning


