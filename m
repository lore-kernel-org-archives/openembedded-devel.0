Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N9Dac-0006Jb-1G
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 09:02:37 +0100
Received: from tamarin.localnet (unknown [80.187.150.90])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A99981B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2009 08:12:10 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Nov 2009 09:00:50 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<1258050962.25369.454.camel@lenovo.internal.reciva.com>
	<1258134424.25369.475.camel@lenovo.internal.reciva.com>
In-Reply-To: <1258134424.25369.475.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911140900.50318.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Sat, 14 Nov 2009 08:02:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 13 November 2009 18:47:04 Phil Blundell wrote:
> On Thu, 2009-11-12 at 18:36 +0000, Phil Blundell wrote:
> > It turns out that colons in flag names aren't actually accepted by the
> > parser, but something similar with dots is OK.  So, here's a patch to
> > make it work.  The modified notation is actually:
> >
> > SRC_URI[mytarball.md5sum] = "d3b07384d113edec49eaa6238ad5ff00"
> 
> I've committed this patch now.  Also, by way of example, I've converted
> busybox 1.14.3 to use the new notation.


thanks


