Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QUe0h-0001DO-AN
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 14:06:51 +0200
Received: from [2001:638:602:1183:512:e5ca:4ebb:3ee] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QUdxU-0004im-01 by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 14:03:33 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>) id 1QUdxT-0002tw-F9
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 14:03:31 +0200
Date: Thu, 9 Jun 2011 14:03:31 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110609120331.GB24788@excalibur.local>
References: <1307534514.2529.4780.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
	<1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
	<iso6bf$lu8$1@dough.gmane.org>
	<0C757E680E33864AB113392C7E83F910BE5188@GSX300A.mxchg.m.corp>
	<20110608165027.GA30722@excalibur.local>
	<0C757E680E33864AB113392C7E83F910BE5189@GSX300A.mxchg.m.corp>
	<20110608172121.GB30722@excalibur.local>
	<0C757E680E33864AB113392C7E83F910BE518A@GSX300A.mxchg.m.corp>
MIME-Version: 1.0
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE518A@GSX300A.mxchg.m.corp>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 09 Jun 2011 12:06:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2011-06-09 at 11:42, Hauser, Wolfgang (external) wrote:
> 
> >> I have to check the exact error again, that may take bit.
> 
> It's not a problem with bitbake 1.12.0, the system (debian lenny) I have
> to use to compile my system don't have python 2.6.0 installed, it uses
> 2.5.2 so bitbake 1.12.0 won't run.

OK, that is expected.

> Sorry for complaining about an
> "error". It was a view month ago I set up the OE environment, so I
> forgot the reason why I have to use bitbake 1.10.8.

Thanks for checking.

regards
Stefan Schmidt


