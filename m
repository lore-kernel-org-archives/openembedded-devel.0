Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QOc1y-0003hr-AU
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 22:47:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QObz6-0001xM-0z
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 22:44:16 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306183247.15595.12.camel@computer>
References: <1302085494.2267.20.camel@computer>
	<1302086637.14449.353.camel@phil-desktop>
	<1306183247.15595.12.camel@computer>
Date: Mon, 23 May 2011 21:44:06 +0100
Message-ID: <1306183446.3120.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: fennec fonts too small
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
X-List-Received-Date: Mon, 23 May 2011 20:47:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-23 at 22:40 +0200, Lukas-David Gorris wrote:
> Then something seems to go wrong with this auto dpi detection mechanism.
> Might it detect the dpi correctly but not set the font accordingly?
> That makes me wonder if my Xserver even knows the current screen dpi.
> How does it get that information? It does know the resolution since that
> is an essential part of xorg.conf but does it know the screen size? How
> to investigate futher?

What does xdpyinfo say?

p.




