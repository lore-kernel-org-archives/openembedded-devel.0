Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Oz2f0-0005Aq-L1
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:25:40 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DE1FC1100286
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:25:29 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 405FC1100248
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:25:29 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052238008.adsl.alicedsl.de
	[78.52.238.8]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:25:29 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B4B633C0DD; Fri, 24 Sep 2010 09:25:09 +0200 (CEST)
Date: Fri, 24 Sep 2010 09:25:09 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100924072509.GA23005@rhein.zuhause.netz>
References: <1285271969-17472-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1285271969-17472-1-git-send-email-fransmeulenbroeks@gmail.com>
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
Subject: Re: [PATCH] directfb-1.1.1: remove
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
X-List-Received-Date: Fri, 24 Sep 2010 07:25:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 23, 2010 at 09:59:29PM +0200, Frans Meulenbroeks wrote:
> code is from 2008, not pinned
> src tarball is not available any more
> (see http://www.directfb.org/downloads/Old/)
> lastest version we have is 1.4.2
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> 
> We might consider also removing 1.0.0, 1.1.0 and the lower 1.2.x versions
> 
>  .../directfb-1.1.1/fix-pkgconfig-cflags.patch      |   47 --------------------
>  recipes/directfb/directfb_1.1.1.bb                 |   30 ------------
>  2 files changed, 0 insertions(+), 77 deletions(-)
>  delete mode 100644 recipes/directfb/directfb-1.1.1/fix-pkgconfig-cflags.patch
>  delete mode 100644 recipes/directfb/directfb_1.1.1.bb
> 
Acked-by: Henning Heinold <heinold@inf.fu-berlin.de>


