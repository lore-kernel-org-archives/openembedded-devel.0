Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PvXUB-0003Oy-Uj
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 17:04:12 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PvXSm-0005uT-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 17:02:44 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110303041807.GA2692@sakrah.homelinux.org>
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
Date: Fri, 04 Mar 2011 16:09:03 +0000
Message-ID: <1299254943.23547.334.camel@phil-desktop>
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
X-List-Received-Date: Fri, 04 Mar 2011 16:04:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-02 at 20:18 -0800, Khem Raj wrote:
> On (02/03/11 15:41), Phil Blundell wrote:
> > Yeah, that might be true.  Or we could maybe just switch the default
> > linker to be gold, at least on targets that it supports. 
> 
> Yes I have been doing this slowly for ARM. but probably it will be
> better with gcc 4.6 where linker will be selectable with options

I'm not quite sure I understand what you're saying there.  Can you
clarify?

p.




