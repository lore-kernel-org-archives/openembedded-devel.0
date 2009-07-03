Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMgE6-0001F8-PE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 12:42:42 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MMg2M-00033U-LE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 11:30:34 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MMg2M-0005N9-B2
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 11:30:34 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
Date: Fri, 03 Jul 2009 11:30:33 +0100
Message-Id: <1246617033.26610.65.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 03 Jul 2009 10:42:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-07-03 at 12:19 +0200, Jean-Michel Hautbois wrote:
> When I modify my local.conf file, specifying:
> PREFERRED_VERSION_glibc                 ?= "2.8"
> PREFERRED_VERSION_glibc-initial         ?= "2.8"

There doesn't appear to be any recipe for glibc 2.8 in the repository.
Maybe you could try using 2.9 instead.  If this isn't suitable then
perhaps you would like to contribute a recipe for 2.8.

p.




