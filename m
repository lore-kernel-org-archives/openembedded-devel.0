Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PwXCj-0002zF-QI
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 10:58:22 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PwXBH-0000yu-AW
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 10:56:47 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D74AA7F.6060506@eukrea.com>
References: <1299360603-24687-1-git-send-email-eric@eukrea.com>
	<AANLkTikWU836s9FM0e0XKdZPuYb=cZs9c0Z3t9nvbZZh@mail.gmail.com>
	<4D74AA7F.6060506@eukrea.com>
Date: Mon, 07 Mar 2011 09:57:30 +0000
Message-ID: <1299491850.2132.12.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] dropbear: add 0.53.1
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
X-List-Received-Date: Mon, 07 Mar 2011 09:58:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-03-07 at 10:50 +0100, Eric Benard wrote:
> Hi Khem,
>=20
> On 06/03/2011 00:08, Khem Raj wrote:
> > On Sat, Mar 5, 2011 at 1:30 PM, Eric B=C3=A9nard<eric@eukrea.com>  wrot=
e:
> >> * 0.53.1 brings some improvements over 0.52 which was released
> >> more than 2 years ago. For more details, check the changelog here :
> >> http://matt.ucc.asn.au/dropbear/CHANGES
> >> * Please note that DROPBEAR_SMALL_CODEis now disabled which may
> >> increase the size of the binaries.
> >
> > can you compare the sizes of .52 and .53.1 so we know how much it will =
be
> >>
> for an armv5 target :
> 0.53.1 : 228112
> 0.53.1 + DROPBEAR_SMALL_CODE : 178960
> 0.52 : 183008

Looks like DROPBEAR_SMALL_CODE is still worth having then.  Why was it
disabled?

p.




