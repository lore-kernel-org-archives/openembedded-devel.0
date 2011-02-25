Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pt3th-0000jY-AG
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:04:17 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pt3sP-0008HS-QO
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:02:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<4D679C54.9060202@opendreambox.org>
	<AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
Date: Fri, 25 Feb 2011 20:02:52 +0000
Message-ID: <1298664172.3818.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Fri, 25 Feb 2011 20:04:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-02-25 at 09:28 -0800, Khem Raj wrote:
> On Fri, Feb 25, 2011 at 4:11 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > The point I was trying to make is that feature detection at compile time
> > is impossible, if the feature can be disabled by the kernel config
> > (which is the case for epoll and inotify, which in turn were the
> > examples discussed on the mailing list in May 2010). You need to do
> > runtime tests in programs intended to be portable.
> 
> which may not be easy to do for cross compiled packages unless they are patches
> to make this test dynamic

Isn't a runtime test dynamic by definition?  I'm not quite sure how
cross-compiling is relevant to this.

p.




