Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMhu3-0006zm-8j
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 14:30:07 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MMhiK-00063v-E8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 13:18:00 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MMhiK-0006S6-5f
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 13:18:00 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
	<8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
Date: Fri, 03 Jul 2009 13:17:59 +0100
Message-Id: <1246623479.2136.15.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 03 Jul 2009 12:30:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-07-03 at 14:02 +0200, Jean-Michel Hautbois wrote:
> How can I know which recipes are are in the repository ?

Something like this:

pb@mill:~/oe/org.openembedded.dev$ ls recipes/glibc/glibc_*.bb
recipes/glibc/glibc_2.2.5.bb              recipes/glibc/glibc_2.3.6.bb
recipes/glibc/glibc_2.3.2.bb              recipes/glibc/glibc_2.4.bb
recipes/glibc/glibc_2.3.2+cvs20040726.bb  recipes/glibc/glibc_2.5.bb
recipes/glibc/glibc_2.3.3.bb              recipes/glibc/glibc_2.6.1.bb
recipes/glibc/glibc_2.3.3+cvs20041128.bb  recipes/glibc/glibc_2.7.bb
recipes/glibc/glibc_2.3.3+cvs20050221.bb  recipes/glibc/glibc_2.9.bb
recipes/glibc/glibc_2.3.3+cvs20050420.bb  recipes/glibc/glibc_cvs.bb
recipes/glibc/glibc_2.3.5+cvs20050627.bb
pb@mill:~/oe/org.openembedded.dev$ 

p.




