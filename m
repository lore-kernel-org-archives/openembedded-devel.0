Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RXA8A-0001E5-4S
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 12:21:14 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 84D9D1100182
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 12:14:28 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7C595110017F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 12:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225006150.adsl.alicedsl.de
	[92.225.6.150]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 12:14:27 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 0E20A3C49D; Sun,  4 Dec 2011 12:14:26 +0100 (CET)
Date: Sun, 4 Dec 2011 12:14:25 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111204111425.GA4871@rhein.zuhause.netz>
References: <jba6p6$bep$1@dough.gmane.org>
	<CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
	<jbdhuo$pe4$1@dough.gmane.org>
	<20111203163423.GA3821@mail.familie-heinold.de>
	<jbdr82$3ri$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jbdr82$3ri$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] rpath problem for llvm libs?
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
X-List-Received-Date: Sun, 04 Dec 2011 11:21:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 03, 2011 at 07:53:53PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 03-12-11 17:34, Henning Heinold schreef:
> > On Sat, Dec 03, 2011 at 05:15:21PM +0100, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE----- So if we were to follow that option
> >> 4) seems to be the way.
> >> 
> >> regards,
> >> 
> >> Koen
> > 
> > Hi,
> > 
> > our original Idea was, that you can install diffrent llvm versions at the
> > same time. We need to discuss if we have still the case or really only
> > one version of llvm. If not we can use directly /usr/lib if not solution
> > 4 with rpath is my favourit. Besides this llvm should go to core, but I
> > wanted to wait for the 3.0 release and christmas holidays to do it.
> 
> - From the llvm website: "December 1, 2011: LLVM 3.0 is now available for
> download!"

I know ;)

Bye Henning


