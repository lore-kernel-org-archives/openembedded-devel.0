Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OKX7g-0006UD-56
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 15:39:46 +0200
Received: from p5b037ea0.dip.t-dialin.net ([91.3.126.160] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OKX3W-0001dj-St by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 15:35:29 +0200
Received: from stefan by dodger with local (Exim 4.72)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1OKX3V-0003nI-NP for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 15:35:25 +0200
Date: Fri, 4 Jun 2010 15:35:25 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100604133525.GA5602@dodger.lab.datenfreihafen.org>
References: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1006040541390.5274@asterix.crazy-teaparty.dyndns.org>
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1006040541390.5274@asterix.crazy-teaparty.dyndns.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] base.bbclass: add support for checksums in .bb files
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
X-List-Received-Date: Fri, 04 Jun 2010 13:39:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2010-06-04 at 05:42, Vitus Jensen wrote:
> On Tue, 13 Apr 2010, Vitus Jensen wrote:
> 
> >From: Phil Blundell <philb@gnu.org>
> >
> >Ported from .dev branch to allow easy sharing of recipes between
> >.dev and stable branches.
> >
> >Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> 
> May I get comments for this patch?  I think it is really helpfull.

Agreed. This makes syncing recipes easier.

Acked-by: Stefan Schmidt <stefan@buglabs.net>

regards
Stefan Schmidt


