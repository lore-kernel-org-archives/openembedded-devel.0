Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qbx5l-0000dE-Tr
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 17:54:17 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Qbx2D-0001Fo-Jo
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 17:50:37 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201106291748.09067.schnitzeltony@gmx.de>
References: <201106291728.47032.schnitzeltony@gmx.de>
	<BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
	<201106291748.09067.schnitzeltony@gmx.de>
Date: Wed, 29 Jun 2011 16:50:35 +0100
Message-ID: <1309362635.2551.62.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: In which meta/layer is a home for not yet supported machines
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
X-List-Received-Date: Wed, 29 Jun 2011 15:54:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 17:48 +0200, Andreas Mueller wrote:
> Open and maintain git-repos
> 
> meta-gumstix
> meta-freescale
> meta-karo
> 
> and get them supported by angstrom? Is that a solution for a hobbyist dev (not 
> working for one of these companies)? 

Yes, that's pretty much the size of it.  Creating the repos is fairly
trivial, you can host them on github or gitorious or anywhere you like.
Maintaining them ought to also be fairly low-effort since a basic
machine layer doesn't actually need to contain very much.

p.



