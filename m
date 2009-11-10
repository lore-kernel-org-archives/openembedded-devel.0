Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1N7t4Y-0005ar-Dj
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:56:01 +0100
Received: from w1203.wlan.rz.tu-bs.de ([134.169.204.187] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1N7t3H-0006Ym-R6 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 16:54:42 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1N7t3H-00010S-7Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:54:39 +0100
Date: Tue, 10 Nov 2009 16:54:39 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091110155439.GH3998@excalibur.local>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
	<1257864635.5228.17.camel@opal>
	<20091110151412.GF3998@excalibur.local>
	<1257867529.29038.212.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1257867529.29038.212.camel@dax.rpnet.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 15:56:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2009-11-10 at 15:38, Richard Purdie wrote:
> On Tue, 2009-11-10 at 16:14 +0100, Stefan Schmidt wrote:
> > > Access control: Having user branches in a dedicated tree means we can
> > > give more users commit access so that they can prepare branches we can
> > > pull. This might lead to (IMHO much appreciated) improvements in the
> > > development model towards a pull model.
> > 
> > But why the hassle of administrate an own git repo service for this? I always
> > thought OE was small on admin power.
> 
> Note that we're taking about one extra "contrib" repository with user
> branches so the extra admin overhead is minimal. People proposed a repo
> per user but that wasn't felt to be acceptable due to the admin
> concerns.

For both you would have to fetch the ssh key and put it into gitosis. The later
one would also need an initial tree creation. The point I'm making is that on an
external git repo hoster even that work would be gone.

Anyway, I stop here. I was mostly interested in the reasons behing the
decisions not more.

regards
Stefan Schmidt


