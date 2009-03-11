Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LhJwr-0007so-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 09:37:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6AF92140933E;
	Wed, 11 Mar 2009 09:37:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzSg7LuinwaG; Wed, 11 Mar 2009 09:37:58 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 3D7461416BA5;
	Wed, 11 Mar 2009 09:37:57 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: pHilipp Zabel <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
References: <49B5E3B9.70409@gmail.com>
	<1236709292.28500.27.camel@hammer.suse.cz> <49B73DC1.5000902@gmail.com>
	<74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
Date: Wed, 11 Mar 2009 09:37:48 +0100
Message-Id: <1236760668.4955.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: Ben Gamari <bgamari@gmail.com>, beagleboard@googlegroups.com,
	Vitus Jensen <vjensen@gmx.de>, openembedded-devel@lists.openembedded.org,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Avahi recipe
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
X-List-Received-Date: Wed, 11 Mar 2009 08:37:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:

> >> I guess that it's caused by
> >> distro/include/preferred-om-2008-versions.inc.
> >>
> >> Remove three avahi related lines from it and try again.
> >>
> >
> > Nope, no dice. In fact, things are getting even stranger:

Ben, what will happen, it you remove avahi_0.6.21.bb from the tree?
Maybe it poisons the dependency checker?


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



