Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pvcs3-0002AF-3p
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 22:49:11 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pvcqd-0006Aw-Ck
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 22:47:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D711947.4030104@gmail.com>
References: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<1298979308.23547.67.camel@phil-desktop>
	<AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
	<1299080486.23547.230.camel@phil-desktop>
	<20110303041807.GA2692@sakrah.homelinux.org>
	<1299254943.23547.334.camel@phil-desktop> <4D711947.4030104@gmail.com>
Date: Fri, 04 Mar 2011 21:47:37 +0000
Message-ID: <1299275257.3930.23.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 04 Mar 2011 21:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 08:54 -0800, Khem Raj wrote:
> I am talking about --with-linker option

Does that make much of a difference here?  I would have thought that any
given DISTRO would probably want to use either gold or ld.bfd as the
default and they could manage that by just configuring binutils
appropriately, and/or by installing a wrapper script for ld.  It's not
totally obvious to me that --with-linker solves any significant problem.

p.




