Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPOXV-0007EL-Ev
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 23:58:17 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPOVS-0005yq-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 22:56:08 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
Date: Mon, 28 Dec 2009 22:55:45 +0000
Message-ID: <1262040945.28755.270.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: helloworld image
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
X-List-Received-Date: Mon, 28 Dec 2009 22:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2009-12-28 at 23:19 +0100, Leon Woestenberg wrote:
> when compiling my favorite minimal image ("helloworld-image") under
> both the minimal-distro and angstrom
> shows 4 MB of cruft being dragged in.
> 
> What happened?
> 
> I would like to start with nothing and then configure the system for
> what I need.
> 
> Should I start another more-minimal distro or can we change the
> minimal distro to be truely minimalistic?

It might be worth trying DISTRO=micro to see if that works any better
for you.

p.




