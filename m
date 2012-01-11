Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rl6nI-0006Ts-1x
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 23:37:20 +0100
Received: (qmail invoked by alias); 11 Jan 2012 22:29:49 -0000
Received: from p5B0A1F6E.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.31.110]
	by mail.gmx.net (mp029) with SMTP; 11 Jan 2012 23:29:49 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18sDM4/oOYs5CE4bhplO64bZ6CZaPGkMSJRvvaSP2
	uJGPPWi3hHLZPB
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2012 23:30:53 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
	<jeeci3$i8k$1@dough.gmane.org>
	<CAP9ODKrgJKaW3EOjBRfXDd0rr+XWRjZTPL4Gx9RFxOASdG6Ccg@mail.gmail.com>
In-Reply-To: <CAP9ODKrgJKaW3EOjBRfXDd0rr+XWRjZTPL4Gx9RFxOASdG6Ccg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201201112330.53226.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] udisks: add sytemd to DEPENDS
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
X-List-Received-Date: Wed, 11 Jan 2012 22:37:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, January 09, 2012 12:29:47 PM Otavio Salvador wrote:
> On Mon, Jan 9, 2012 at 07:38, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > I'm not sure this is the right solution, but I'll take the patch if
> > someone doesn't come up with a better way to solve this.
> 
> The right fix is to handle it in systemd.bbclass and bump every package PR
> using it.
Can we agree on that? I would volunteer to prepare these patches.

Andreas


