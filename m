Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TUOhZ-0007DG-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 22:22:53 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TUOUL-0006AF-QJ; Fri, 02 Nov 2012 22:09:14 +0100
Message-ID: <1351890547.4358.120.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 02 Nov 2012 21:09:07 +0000
In-Reply-To: <5635412.CqmEY78XQ7@helios>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<2240810.9tyY23JxNH@helios> <20121102130743.GC4416@windriver.com>
	<5635412.CqmEY78XQ7@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Fri, 02 Nov 2012 21:22:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-02 at 13:38 +0000, Paul Eggleton wrote:
> I have to say I think that these days this could be better implemented as one 
> ntp recipe with a PACKAGECONFIG that you can use to enable OpenSSL support if 
> desired. (At the time the ntp/ntp-ssl split was done, PACKAGECONFIG did not 
> exist). Then it becomes a distro-level choice as to whether this is enabled as 
> I believe was originally intended.

Yes, agreed, that would be ideal.

p.




