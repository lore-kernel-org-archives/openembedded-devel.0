Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1R0WOZ-0000a4-7M
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 12:27:15 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R0WJh-000791-MQ from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 03:22:13 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 5 Sep 2011 12:22:11 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A5D63@eu2-mail.mgc.mentorg.com>
In-Reply-To: <CACW_hTZSavmJbieeL1Wth1rVAm2SdqH5C0kD5Qoq7-9KQRMKcg@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] `PR = "r0"`: Add or not to add?
Thread-Index: Acxojvf6AW4iudSmTsCviDD8ROrcIADJoV2g
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de><j3kn1n$tqr$1@dough.gmane.org><1314785183.3769.22.camel@mattotaupa><j3l22l$5ti$1@dough.gmane.org><20110831115548.GB3273@chargestorm.se><j3l8ni$kr3$1@dough.gmane.org><CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com><j3lad2$v75$2@dough.gmane.org><CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com><j3ld1i$l0g$1@dough.gmane.org><CAP9ODKpupMXbfao42zScW4aJB2X0FHwEzBBDyMH_mdCyqYAJaw@mail.gmail.com><4E5EB734.7070802@balister.org>
	<CACW_hTZSavmJbieeL1Wth1rVAm2SdqH5C0kD5Qoq7-9KQRMKcg@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Mon, 05 Sep 2011 10:27:15 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
Of
> Frans Meulenbroeks
> Sent: Thursday, September 01, 2011 3:07 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] `PR =3D "r0"`: Add or not to add?
>=20
> 2011/9/1 Philip Balister <philip@balister.org>
>=20
> > On 08/31/2011 06:43 AM, Otavio Salvador wrote:
> >
> >> On Wed, Aug 31, 2011 at 10:30, Koen
> Kooi<koen@dominion.thruhere.**net<koen@dominion.thruhere.net>>
> >>  wrote:
> >>
> >>> Besides, this is also on the policy
> >>>>
> >>>
> >>> The OE classic policy maybe, not on the meta-oe policy[1].
> >>>
> >>
> >> ETOOMANYPOLICIES
> >>
> >>  so or you change the policy or you follow it. Otherwise makes no
> sense to
> >>>> have a policy if the person who merge the patches do not follow
> it.
> >>>>
> >>>
> >>> - From
>
http://wiki.openembedded.org/**index.php/Category:Policy<http://wiki.op
> enembedded.org/index.php/Category:Policy>I read:
> >>>
> >>> http://wiki.openembedded.org/**index.php/Commit_Patch_**
> >>>
>
Message_Guidelines<http://wiki.openembedded.org/index.php/Commit_Patch_
> Message_Guidelines>
> >>>
>
http://wiki.openembedded.org/**index.php/Commit_Policy<http://wiki.open
> embedded.org/index.php/Commit_Policy>
> >>>
>
http://wiki.openembedded.org/**index.php/Commit_log_example<http://wiki
> .openembedded.org/index.php/Commit_log_example>
> >>>
>
http://wiki.openembedded.org/**index.php/Styleguide<http://wiki.openemb
> edded.org/index.php/Styleguide>
> >>>
>
http://wiki.openembedded.org/**index.php/Versioning_Policy<http://wiki.
> openembedded.org/index.php/Versioning_Policy>
> >>>
> >>> And none of those say PR =3D r0 is wanted behaviour. OTOH it =
doesn't
> say
> >>> it's
> >>> unwanted either.
> >>>
> >>
> >> So until it is explicit we might keep PR =3D r0 as it seems most
> people
> >> prefer this way.
> >>
> >
> > As long as we are all chiming in, I would like to see all of us
> decide once
> > and for all what to do.
> >
> > I also prefer the explicitly setting PR =3D "r0". Can we work out =
the
> > troublesome cases and see if we can get them fixed? Also, what is
the
> > oe-core view on this?
> >
> > Let's work out what the technical answer is and go from there
>=20
>=20
> Good plan.
>=20
> BTW not sure if it is feasible but ideally a 2nd assingment to a var
> should
> give an error (or at least a warning). This avoids that e.g. a recipe
> and a
> .inc file set the var (or that a var is set twice within the same
> recipe, in
> the past I have seen this). If a variable is intended to be
reassigned,
> weak
> binding should be used. ( ?=3D or so).
>=20
> Frans
Hi,

I did not see any thread on oe-core mailing list about this. Did we
start this thread there?

Noor

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


