Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWb3x-0008DE-IO for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 20:45:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWb1n-0003p2-TY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 20:43:15 +0100
Received: from p5b3b24db.dip.t-dialin.net ([91.59.36.219])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 20:43:15 +0100
Received: from no2spam by p5b3b24db.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 20:43:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 17 Jan 2010 20:42:52 +0100
Message-ID: <hivp7t$hib$1@ger.gmane.org>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b24db.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Sun, 17 Jan 2010 19:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> Well, there are very good reasons to make this now obsolete:
> - we can flash from console (2.6 userspace)
> - we have a different image-layout (kernel in /boot), thus we can boot
> from every hd partition
> - we can create jffs2 images (see Narcissus) and flash these from
> console, without striping the legacy headers. We can even have 2
> images in nand

Great.  Would be nice to see this documented somewhere in the wiki in a
language that mere humans understand.  I'll volunteer as tester.  I
think I'm stupid enough to qualify ;-)



