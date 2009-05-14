Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M4Yw4-00033C-Sa
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 13:17:13 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M4YpQ-0002ja-MZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 12:10:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48239d390905140352k60f3c63crd2337be420d63bef@mail.gmail.com>
References: <20090513152443.E8DE11893A9@amethyst.openembedded.net>
	<48239d390905140352k60f3c63crd2337be420d63bef@mail.gmail.com>
Date: Thu, 14 May 2009 12:10:14 +0100
Message-Id: <1242299414.4514.28.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: toolchain	updates:
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
X-List-Received-Date: Thu, 14 May 2009 11:17:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-14 at 14:52 +0400, Sergey Lapin wrote:
> > angstrom 2009.X: toolchain updates:
> >  * make gcc 4.3.3 the default compiler (except for ppc and avr32)
> >  * make binutils 2.18 the default (except for armv7a and avr32)
> >  * disable thumb for armv4t/5te since there's no gcc/binutils combo that works 100% with thumb
> Could I have some details please regarding thumb?
> I remember there was a discussion regarding enabling thumb. Then we
> have silent rollback.
> Do I miss something?

As far as OE itself is concerned, the Angstrom distro maintainers have
the discretion to set whatever toolchain policy they want in their own
configuration files; if their changes don't impact any other distros
(which, judging from the checkin message above, these presumably don't)
then there's no requirement for them to consult here in advance, nor
even to justify their actions in retrospect.  It's their own distro and
they can bash it around any way they like.

So, you should probably take this up with those guys on their own
angstrom-distro-devel mailing list rather than here.

p.




