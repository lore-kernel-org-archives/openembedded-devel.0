Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8T65-0000yW-Lz
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 07:24:00 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id B32AD1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 06:33:29 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 07:22:09 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
In-Reply-To: <200911120656.41249.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200911120722.09166.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 06:24:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 06:56:41 Holger Hans Peter Freyther wrote:
> On Thursday 12 November 2009 06:47:22 Robert P. J. Day wrote:
> >   seriously, either the build of xterm_207 should be fixed, or that
> > package should be dropped in its entirety.  it's been at least three
> > weeks since i pointed out that it doesn't build, and even explained in
> > detail *why* it doesn't build and how to fix it.  to no avail.
> >
> >   so, a humble suggestion -- either fix it, or remove it from OE
> > entirely.
> 
> Did you attempt to create a patch?

and on top of that it...it builds here... creates a ipk with the xterm binary 
in it. So I don't see the need to remove the recipe.

z.


