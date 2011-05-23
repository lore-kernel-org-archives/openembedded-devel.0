Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1QObys-0003bj-MU
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 22:44:03 +0200
Received: from fw.roethelheim.stw.uni-erlangen.de ([131.188.23.50]
	helo=[172.17.29.222])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1QObvo-0006Vs-65
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 21:40:52 +0100
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302086637.14449.353.camel@phil-desktop>
References: <1302085494.2267.20.camel@computer>
	<1302086637.14449.353.camel@phil-desktop>
Date: Mon, 23 May 2011 22:40:47 +0200
Message-ID: <1306183247.15595.12.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Mon, 23 May 2011 20:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 06.04.2011, 11:43 +0100 schrieb Phil Blundell:
> On Wed, 2011-04-06 at 12:24 +0200, Lukas-David Gorris wrote:
> > It tried out fennec on htcleo machine (4,2" wvga, 217 ppi specified) and
> > noticed the fonts are itsy. Maybe it would be good to install a modified
> > configuration in order to make it more usable. It's possible to set font
> > minima via about:config .
> > 
> > Should a configuration be added?
> 
> I think fennec ought to be figuring this out for itself at run time.  It
> can get the screen dpi from the xserver.
> 
> p.
> 

Then something seems to go wrong with this auto dpi detection mechanism.
Might it detect the dpi correctly but not set the font accordingly?
That makes me wonder if my Xserver even knows the current screen dpi.
How does it get that information? It does know the resolution since that
is an essential part of xorg.conf but does it know the screen size? How
to investigate futher?

Best
Lukas



