Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTXm3-0000sA-MF
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:51:59 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TTXYv-0002p5-99
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:38:25 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 12:38:24 +0000
In-Reply-To: <CAP9ODKq=8EwPNT3wqGAnVuweEj4wwYNGKLhhzHUaP0H-gRSnQg@mail.gmail.com>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com> <1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com> <1351685961.13864.101.camel@phil-desktop>
	<CAP9ODKq=8EwPNT3wqGAnVuweEj4wwYNGKLhhzHUaP0H-gRSnQg@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351687105.13864.110.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-31 at 10:29 -0200, Otavio Salvador wrote:
> Well, I cannot ask for a pool zone for OE or Yocto; it'd be good but
> it is not yet done and I prefer to have it merged and changed once it
> happens.

The obvious problem with that approach is that "it" may never happen
(especially if you're relying on some as-yet-unidentified third party to
do the work) and, even if it does, arbitrarily many people might ship
the broken configuration in the meantime.  Merging a change that we know
is wrong seems like a bad plan.

p.




