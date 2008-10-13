Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpQjf-0001wF-2r
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 18:57:35 +0200
Received: from [92.116.253.95] (helo=[10.129.253.95])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpQeo-0002bT-DL
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 18:52:35 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2008 18:52:33 +0200
User-Agent: KMail/1.9.9
References: <200809031554.52267.zecke@selfish.org>
	<200810130034.18105.zecke@selfish.org>
	<1223854206.5230.6.camel@dax.rpnet.com>
In-Reply-To: <1223854206.5230.6.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200810131852.34080.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.253.95
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Mon, 13 Oct 2008 16:57:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 13 October 2008 01:30:06 Richard Purdie wrote:
> On Mon, 2008-10-13 at 00:34 +0200, Holger Freyther wrote:
> > On Wednesday 03 September 2008 15:54:52 Holger Freyther wrote:
> > > Hey guys,
> >
> > okay, I merged these patches now.
>
> Hmm, that will teach me to take my eye off the mailing lists. So we do
> git checkouts now when parsing?

No, nothing changes. If you want to use git-rev-list (e.g. I want that for the 
openmoko distro) you put BB_GIT_CLONE_FOR_SRCREV=1 into your local.conf.

I think this is a sane default, the next part will be implementing the idea 
from werner.

z.


