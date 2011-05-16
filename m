Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QM122-0003By-7V
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 18:52:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QM0a6-00046B-JF
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 18:23:42 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
Date: Mon, 16 May 2011 17:49:42 +0100
Message-ID: <1305564582.2429.90.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Mon, 16 May 2011 16:52:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 14:52 +0200, Frans Meulenbroeks wrote:
> I think the community could benefit if you add info (a pointer) in this
> thread
> - how to set up a build environment
> - policies on what goes into oe-core and meta-oe and what not (and how to
> deal with things that do not go into it)
> - a migration scenario from the current repo to the new structure (what are
> we doing with the existing recipes)
> - how to add new distro's and bsp's
> 
> I know some (if not all) info has been sent around over time, but I feel it
> would help if this announcement would carry the info to get people started
> (and/or point to a web page that has the above info).

Yes, agreed, I think that would be useful.  The build environment setup
is certainly a bit different to "classic" oe and it took me a while to
figure it out.  At the time there didn't seem to be much documentation
on how that stuff was meant to work, though with hindsight I now suspect
the Poky manual might have been the place to look.

p.




