Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMjIT-0006Vv-Jm
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 15:59:25 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MMj6j-0008Lh-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 14:47:17 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MMj6j-0007Pa-6i
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 14:47:17 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8cad0aa0907030558o656e8aabu403320a9b947fe37@mail.gmail.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
	<8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
	<1246623479.2136.15.camel@mill.internal.reciva.com>
	<8cad0aa0907030530j5223d171la360f1c5a28b213e@mail.gmail.com>
	<1246624818.2136.16.camel@mill.internal.reciva.com>
	<8cad0aa0907030558o656e8aabu403320a9b947fe37@mail.gmail.com>
Date: Fri, 03 Jul 2009 14:47:16 +0100
Message-Id: <1246628836.2136.26.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 13:59:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-07-03 at 14:58 +0200, Jean-Michel Hautbois wrote:
> And my branche is stable/2009.

I guess that's most likely the problem; I haven't checked, but it's
quite possible that glibc 2.9 is only in the main .dev branch and not
(yet) in stable.  If that's the case, you can probably just copy the
file over from a .dev checkout.

p.




