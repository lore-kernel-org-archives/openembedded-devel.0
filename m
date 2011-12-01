Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RW25J-0004W8-Ch
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:33:37 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 312BC11000B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2011 09:26:58 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 255B711000B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2011 09:26:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052225171.adsl.alicedsl.de
	[78.52.225.171]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2011 09:26:56 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DF0233C49D; Thu,  1 Dec 2011 09:26:55 +0100 (CET)
Date: Thu, 1 Dec 2011 09:26:55 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201082655.GA4447@rhein.zuhause.netz>
References: <jb5vpp$c8o$1@dough.gmane.org>
	<20111201080837.GB17111@novatech.datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <20111201080837.GB17111@novatech.datenfreihafen.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: OE-core based java layer?
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
X-List-Received-Date: Thu, 01 Dec 2011 08:33:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2011 at 09:08:38AM +0100, Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
> > 
> > Beagleboard.org has moved to the OE-core metaverse to build the factory
> > images and we need java support to stay feature compatible with OE classic.
> > 
> > Are there already people working on such a thing or should I just go ahead
> > and add a meta-java to the meta-oe repo and start importing recipes one-by-one?
> 
> Henning already did it. https://github.com/woglinde/meta-java/
> 
> I was able to build openjdk-6 from it. Still having some problems with
> some of our Buglabs java recipes but I think its not meta-java's
> fault. :)

Hi,

thanks for the feedback. I did not found the time to announce it via E-Mail.

But now it is.

Which brings me to the question, if we should host meta-java on the oe git servers or not?

Bye Henning


