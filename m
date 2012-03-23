Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB6Qj-0006GI-JU
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 16:29:29 +0100
Received: by obqv19 with SMTP id v19so2653058obq.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W1G7pb9WVp/bt/HmofH1SpkbtE5e0GmmoWKJUwdXwn8=;
	b=Sm2BIQKeiqd2Yli58wTR69jkN2Ue6l8ptLz5Ps4lkyhofToD5BYnoZu46NcAMivyp4
	cgDPla6dzL5HHIiK8cEEPOta753yfkTL22OjMYBjGh8Emu87Q/2dT17agCMGZp6a5Vyk
	UeQDyjEtfo/sbPbOAsnZNrSMXi1ppioekNYZ8lNcpVu8VSfGZ8V4GcybYXm3WBaFnpHj
	jafDjZ4QMVcEaFmLJWS/zEVB5hJQr51CbKT/HVOu2jdSFlAGWicbCo1v1nokrDjhofPF
	0EWTdEUl5XEf38e2qbcC0msCu79A9DY6pdbyX1+MD8SvfSaNi+ek83ZuxUoivADPLpxH
	Sd9g==
Received: by 10.182.154.5 with SMTP id vk5mr15404728obb.24.1332516032543;
	Fri, 23 Mar 2012 08:20:32 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id d9sm8002592obq.0.2012.03.23.08.20.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:20:31 -0700 (PDT)
Date: Fri, 23 Mar 2012 08:20:33 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120323152033.GA9551@bill-the-cat>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
	<CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
	<CA+M6bXmJ9YWR74eEWj-0pNYVziCNb+8Ac-DKPNG1inPaELKAiA@mail.gmail.com>
	<4F6ACE55.2070002@dresearch-fe.de>
	<20120322221323.GE28378@bill-the-cat>
	<4F6C1FD0.3080307@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4F6C1FD0.3080307@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Fri, 23 Mar 2012 15:29:29 -0000
X-Groupsio-MsgNum: 37965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 08:01:36AM +0100, Steffen Sledz wrote:
> On 22.03.2012 23:13, Tom Rini wrote:
> > On Thu, Mar 22, 2012 at 08:01:41AM +0100, Steffen Sledz wrote:
> >> On 21.03.2012 15:46, Tom Rini wrote:
> >>> On Wed, Mar 21, 2012 at 7:44 AM, Tom Rini <tom.rini@gmail.com> wrote:
> >>>> On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.d=
e> wrote:
> >>>>> libmatthew-java-0.7.1.tar.gz is no longer available at the original
> >>>>> location.
> >>>>>
> >>>>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> >>>>
> >>>> NAK, please switch it to the snapshot.debian.org URL I provided so we
> >>>> don't have to change this recipe at some point in the future again.
> >>>
> >>> On third thought, lemme think about this.  I don't like pointing
> >>> somewhere that might remove it, again, but I also don't like changing
> >>> checksums for folks that already have it down.  So, unless someone
> >>> else disagrees, we'll favor same checksums over retention and if
> >>> fedoraproject removes it, we'll just point at the copy on the OE
> >>> server.
> >>
> >> So finally that's an ACK for my patch?
> >=20
> > Yes, thanks.
>=20
> OK, pushed to oe-classic master.
>=20
> Tom, do you need an extra pull request for 2011.03-maintenance branch?

Yes please.  Thanks!

--=20
Tom

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9slMEACgkQdZngf2G4WwO7wgCgi2C4AcqolRWV78kI+IvHiCuq
rrkAnRQ80kzdjbAF1wP98KqB0l1/aSbV
=+j/r
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
