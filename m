Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NB7Di-0005AW-K8
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:38:50 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NB7CH-0002CW-Nv
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:37:17 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NB7CF-00039b-Ua
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:37:16 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
Date: Thu, 19 Nov 2009 13:37:12 +0000
Message-Id: <1258637832.23826.88.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 13:38:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 13:06 +0000, Hodgson, Simon wrote:
> I'm looking to make it as easy as possible to get started, so ideally all the packages I need will be available from that distro's standard repositry.
> 
> I've tried SuSE in the past and given up trying to get all of the required tools installed, and more recently been using Debian, but the Python version in Debian is a few versions behind and there was talk of OE soon requiring a more up to date version.

I'm using Debian on most of my machines and I am fairly happy with it.

The python that's currently in Debian is fine for bitbake 1.8.x.  By the
time OE starts to require bitbake 1.10.x, I suspect Debian's python
support will have caught up: failing that, you can always install the
package from Ubuntu.

p.




