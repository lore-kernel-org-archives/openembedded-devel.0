Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PxzRU-0005GV-53
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:19:32 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PxzPv-00053y-6v by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 11:17:57 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1PxzPs-0007vW-Jl
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:17:52 +0100
Date: Fri, 11 Mar 2011 11:17:52 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311101752.GI7353@excalibur.local>
References: <20110311081950.GG7353@excalibur.local>
	<ilcokq$g5i$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ilcokq$g5i$1@dough.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 11 Mar 2011 10:19:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-03-11 at 10:05, Koen Kooi wrote:
> On 11-03-11 09:19, Stefan Schmidt wrote:
> > 
> > This topic has come up several times now and it did come up again during a TSC
> > meeting yesterday.
> > 
> > It feels like the current OE bugzilla is not in really good shape. The question
> > is how we are going to handle this. On the one hand it might be good to remove
> > as it holds a lot outdated informations and it seems developers are not using it
> > at all.
> > 
> > On the other hand this would cut off a service for atcual users of OE.
> > 
> > If we can find a group of people that is willing to clean the current bugzilla
> > up improve it and make sure that problems in it are actually worked on it still
> > have a chance to stay. We need a clear maintainership for it and bugs need
> > atcually be worked.
> > 
> > Comments? Volunteers?
> 
> Just kill it already, for OE-core we can use the yocto bugzilla which
> has dedicated maintainers.

That leaves still a big part of the metadat without bugzilla coverage.
meta-openembedded. If we find a group of people maintaining it I don't see a
problem with the OE bugzilla to stay.

regards
Stefan Schmidt


