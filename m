Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYjA7-0008Nf-2v
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 17:48:42 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6303E1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 16:45:12 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 17:46:01 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <201001230943.24210.holger+oe@freyther.de>
	<201001231056.17675.holger+oe@freyther.de>
	<1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
In-Reply-To: <1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
Message-Id: <201001231746.01739.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 16:48:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 15:53:05 Paul Menzel wrote:
> Dear Holger,

> > I also have a new version of the
> > program I use attached... I will probably switch it to use pwclient in
> > the future.
> 
> Thank you for your effort and bringing up `pwclient`. It is so sad, that
> there exists a lot of tools and stuff one does not know about which
> could safe work and time for oneself. I wonder why others projects did
> not face the same problems yet. Probably every project or developers
> wrote her/his own scripts (as OE did with `pw-am.sh`) and everyone
> reinvents the wheel.

Well, I remembered that pwclient exists, so I went to the patchwork website at 
ozlabs.org but I could not find any reference to the tools (or the XML RPC 
API). It was just a matter that writing my version was faster than the time I 
would have to spent searching... :(.

I will probably give up on my version and now look into pw-am.sh.


