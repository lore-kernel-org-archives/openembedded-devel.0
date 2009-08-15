Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1McHdn-0005e8-HT for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 13:41:43 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1McHNZ-0005iy-NZ for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 11:24:57 +0000
Received: from p5b3b2795.dip.t-dialin.net ([91.59.39.149])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 11:24:57 +0000
Received: from no2spam by p5b3b2795.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 11:24:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 15 Aug 2009 13:24:44 +0200
Message-ID: <h665ts$ms3$1@ger.gmane.org>
References: <4A8516BF.9080405@atmel.com>	<h63h7v$8pk$1@ger.gmane.org>	<4A8581D9.9010205@atmel.com>	<1250264545.12282.1271.camel@mill.internal.reciva.com>	<4A85C292.9030605@atmel.com>	<4A85C7E9.7030402@xora.org.uk>
	<4A85FFD7.7090302@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b2795.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.22 (X11/20090804)
In-Reply-To: <4A85FFD7.7090302@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Sat, 15 Aug 2009 11:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> I have progressed a little further, so I have managed to get
> the Xserver to start, but the xorg.conf I did fails to
> support the mouse. The touchscreen is also nonfunctional but
> A USB keyboard work...

That sounds similar to the problems I'm experiencing with X11 and Opie
in qemu images.  Poky images work, but I wasn't sure where the magic
difference between Poky and .dev could be.



