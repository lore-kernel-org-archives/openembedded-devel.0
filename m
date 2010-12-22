Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PVYBo-0002Cw-IH
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 00:33:48 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LDU00I8VS32I4K0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Dec 2010 17:33:15 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7307A14AF64; Wed,
	22 Dec 2010 18:33:02 -0500 (EST)
Date: Wed, 22 Dec 2010 18:33:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTik_GNNX5vMMsjZO7PTdf6od8ah-uHBfbe31sKnA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101222233302.GB12820@denix.org>
MIME-version: 1.0
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org> <4D1259F7.9030905@mentor.com>
	<4D126BCC.1020508@mentor.com>
	<AANLkTik_GNNX5vMMsjZO7PTdf6od8ah-uHBfbe31sKnA@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum	bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 23:33:48 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Dec 22, 2010 at 02:42:31PM -0800, Khem Raj wrote:
> On Wed, Dec 22, 2010 at 1:21 PM, Tom Rini <tom_rini@mentor.com> wro=
te:
> > On 12/22/2010 01:05 PM, Tom Rini wrote:
> >>
> >> On 12/22/2010 12:38 PM, Koen Kooi wrote:
> >>>
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> On 22-12-10 12:14, Koen Kooi wrote:
> >>>>
> >>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
> >>>> ---
> >>>> conf/sanity.conf | 2 +-
> >>>> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>>>
> >>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
> >>>> index 0f53cb2..1c83c14 100644
> >>>> --- a/conf/sanity.conf
> >>>> +++ b/conf/sanity.conf
> >>>> @@ -3,7 +3,7 @@
> >>>> # See sanity.bbclass
> >>>> #
> >>>> # Expert users can confirm their sanity with "touch conf/sanit=
y.conf"
> >>>> -BB_MIN_VERSION =3D "1.8.18"
> >>>> +BB_MIN_VERSION =3D "1.10.0"
> >>>>
> >>>> SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
> >>>> SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
> >>>
> >>> If people are agreeing, can I get some Acked-by lines please?
> >>
> >> I agree with the concept but I want a patch that says 1.10.2 onc=
e Chris
> >> releases that hopefully later today.
> >
> > To be clear, this is because 1.10.0 has some bugs that aren't all=
 that hard
> > to hit and 1.10.1 reports itself as 1.10.0. =A0I strongly suspect=
 we have
> > users that stay on the trailing edge, would get 1.10.0 release an=
d hit
> > issues.
>=20
> For 1.10.2
>=20
> Acked-by: Khem Raj <raj.khem@gmail.com>

Let's wait for 1.10.2, but:

Acked-by: Denys Dmytriyenko <denis@denix.org>

--=20
Denys



