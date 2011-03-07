Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PwY5B-0001pC-Ph
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 11:54:33 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PwY3j-00010j-9L
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 11:53:03 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinT-GUhvmLxh80M-41SOAW7c8suBTg9ZR+Pmntq@mail.gmail.com>
References: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
	<1299188687.17920.150.camel@lenovo.internal.reciva.com>
	<AANLkTinT-GUhvmLxh80M-41SOAW7c8suBTg9ZR+Pmntq@mail.gmail.com>
Date: Mon, 07 Mar 2011 10:53:49 +0000
Message-ID: <1299495229.2132.19.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: gcc ICE (gcc 4.1.2, nios2), test program included
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
X-List-Received-Date: Mon, 07 Mar 2011 10:54:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 11:24 +0100, Frans Meulenbroeks wrote:
> > b) debug the failure for yourself (see the gcc manual and/or mailing
> > list for advice); or
> 
> Guess that is the road to travel. Maybe someone has some pointers on
> how to get started with this.

I guess the obvious places to start would be the GCC internals manual:

http://gcc.gnu.org/onlinedocs/gccint/

and the GCC wiki:

http://gcc.gnu.org/wiki/

In particular http://gcc.gnu.org/wiki/DebuggingGCC has some tips for
running the compiler under the debugger.

p.




