Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R5mfI-00042e-GD
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 00:50:17 +0200
Received: (qmail invoked by alias); 19 Sep 2011 22:44:59 -0000
Received: from p5B0A3FB5.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.63.181]
	by mail.gmx.net (mp061) with SMTP; 20 Sep 2011 00:44:59 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/KBvNgBqvKOsq3rC0cK7LZUENZF8oIlcNAuVfYU1
	fJLbpY0gMp7Bf9
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2011 00:48:35 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <E1R5ctr-0006Nt-SM@garnet.openembedded.org>
In-Reply-To: <E1R5ctr-0006Nt-SM@garnet.openembedded.org>
MIME-Version: 1.0
Message-Id: <201109200048.35316.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Koen Kooi : rfkill 0.4: import from OE .dev
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
X-List-Received-Date: Mon, 19 Sep 2011 22:50:18 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, September 19, 2011 02:24:39 PM git version control wrote:
Is that still required?
> +do_compile() {
> +        oe_runmake
> +}
> +do_install() {
> +        oe_runmake DESTDIR=${D} install
> +}
Andreas


