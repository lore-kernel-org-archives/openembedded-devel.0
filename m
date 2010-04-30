Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1O7qsw-0001tw-LE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 16:08:07 +0200
Received: from p5b036a42.dip.t-dialin.net ([91.3.106.66] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1O7qpL-0005pq-Jc by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 16:04:26 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1O7qpK-0005Zh-LV
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 16:04:22 +0200
Date: Fri, 30 Apr 2010 16:04:22 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100430140422.GA3403@excalibur.local>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1272552574.3865.814.camel@trini-m4400>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible fall-out
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
X-List-Received-Date: Fri, 30 Apr 2010 14:08:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-04-29 at 07:49, Tom Rini wrote:
> On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
> > 
> > I've been talking to RP and we both like to merge his branch as soon as
> > the last problem (the cross lamanger) has been addressed. RP estimates
> > that will happen early next week.
> > But after it has been merged there might be some fallout, which we would
> > like to have some help with. If you don't want to help out and and don't
> > want the possible breakage: don't git pull for the time being.
> 
> Related, do we have people signing up for building ___ targets?  I'll
> assume angstrom + beagleboard + beagleboard-demo will be covered :)

I can take care of imote2, the ezx devices and sgh-i900. All armv5.

I bet the SHR guys are taking care about om-gta02 and om-gta01. Which would be
armv4.

regards
Stefan Schmidt


