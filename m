Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mjb8s-0002XK-VT
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 17:56:03 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MjaqW-0000qx-K1
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 16:37:05 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MjaqW-0000wN-5v
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 16:37:04 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
	<19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
Date: Fri, 04 Sep 2009 16:37:00 +0100
Message-Id: <1252078620.27780.515.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Fri, 04 Sep 2009 15:56:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-09-04 at 08:27 -0700, Khem Raj wrote:
> Other distros also need this change. IMO it will be better
> that we enforce a rebuild otherwise users might have issues that
> are hard to debug.

Why do other DISTROs need this change?  Surely if they aren't using
sane-toolchain.inc to set TARGET_OS then they oughtn't to be affected.

p.




