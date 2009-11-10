Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N7p2D-00081s-0o
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 12:37:20 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N7p0y-0006tW-Ti
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 11:36:00 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N7p0y-0004qL-JQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 11:36:00 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdaeo3$9l5$1@ger.gmane.org>
References: <1257762970.29038.40.camel@dax.rpnet.com>
	<hdaeo3$9l5$1@ger.gmane.org>
Date: Tue, 10 Nov 2009 11:35:57 +0000
Message-Id: <1257852957.1484.72.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Tue, 10 Nov 2009 11:37:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-10 at 10:13 +0900, Rolf Leggewie wrote:
> It would have been nice to make sure that Debian actually has 1.8.16
> before making it a requirement.  I prefer to use packaged software so I
> can worry about other things.

Remember that bitbake doesn't need to be installed (into /usr or
anywhere else): you can run it directly from a checkout in your OE
working directory.  That ought to be a reasonable stopgap for most
people until the distributions catch up.

p.




