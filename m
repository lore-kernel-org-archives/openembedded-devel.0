Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MYOBt-0000XX-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 19:52:55 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 44F452200144
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 19:37:16 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7CABF2200118
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 19:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225145220.adsl.alicedsl.de
	[92.225.145.220]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 19:37:15 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9B4723C324; Tue,  4 Aug 2009 19:37:14 +0200 (CEST)
Date: Tue, 4 Aug 2009 19:37:14 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090804173714.GA11596@rhein.zuhause.netz>
References: <13DFAA6B-CB0C-4A52-97FF-8B57A362F1D9@mac.com>
	<03CA8FE8-A2BC-4B25-B4DC-812309A65456@mac.com>
MIME-Version: 1.0
In-Reply-To: <03CA8FE8-A2BC-4B25-B4DC-812309A65456@mac.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: No more e2fsprogs and other package build errors with latest oe update
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
X-List-Received-Date: Tue, 04 Aug 2009 17:53:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2009 at 07:40:10PM +0400, Elvis Dowson wrote:
> Oh, and another bit of good news, the new updates require 6GB less
> of total hard disk space, compare to what it used to take earlier.
> 
> Elvis

Problem was, that angstroem used debug options for native/host binary too.

Bye Henning


