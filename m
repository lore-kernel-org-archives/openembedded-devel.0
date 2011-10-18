Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RGB2f-0007dD-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:53:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RGAx4-0000rT-0W
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:47:34 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 15:47:33 +0100
In-Reply-To: <4E9D16AD.7040403@telia.com>
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1318949254.22985.146.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 14:53:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-18 at 08:03 +0200, Ulf Samuelsson wrote:
> My comparision between 2 similar machines indicate that
> 32 bit 11.04 with Psyco-Dist is 20% faster than 64 bit with 11.04
> 
> The machine running 64 bit 11.04 was tested with 32 bit 11.04
> using an external disk (connected through e-SATA) and results
> were very close to the numbers for the other 32 bit machine
> 
> I didn't save those numbers but I think that is good enough
> to draw the conclusion that adding JIT for 64 bit (PyPy?) will reduce build
> time significantly.

You seem to have changed two things at once there (or perhaps just made
a bit too much of a leap in your conclusion).  Did you test 32-bit
without the JIT?

p.




