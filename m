Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RW1n3-0003RC-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:14:45 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RW1ga-0002o0-KN by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:08:06 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RW1h8-0004sM-Le for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:08:38 +0100
Date: Thu, 1 Dec 2011 09:08:38 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201080837.GB17111@novatech.datenfreihafen.org>
References: <jb5vpp$c8o$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jb5vpp$c8o$1@dough.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 01 Dec 2011 08:14:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
> 
> Beagleboard.org has moved to the OE-core metaverse to build the factory
> images and we need java support to stay feature compatible with OE classic.
> 
> Are there already people working on such a thing or should I just go ahead
> and add a meta-java to the meta-oe repo and start importing recipes one-by-one?

Henning already did it. https://github.com/woglinde/meta-java/

I was able to build openjdk-6 from it. Still having some problems with
some of our Buglabs java recipes but I think its not meta-java's
fault. :)

regards
Stefan Schmidt


