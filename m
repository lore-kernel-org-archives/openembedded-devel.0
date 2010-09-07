Received: from blu0-omc4-s34.blu0.hotmail.com ([65.55.111.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mgcse@hotmail.com>) id 1Osxny-0001R2-Jn
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 15:02:46 +0200
Received: from BLU132-W9 ([65.55.111.137]) by blu0-omc4-s34.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 7 Sep 2010 05:59:56 -0700
Message-ID: <BLU132-W907085C23EFDAF5660F2DB0710@phx.gbl>
X-Originating-IP: [212.175.157.5]
From: mahmut g <mgcse@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Sep 2010 12:59:56 +0000
Importance: Normal
In-Reply-To: <AANLkTintK8OdmZbumTuVA6UAv=PYujw9PmjzKL1wtDMj@mail.gmail.com>
References: <BLU132-W8FA51733A7631FEA4FB63B0710@phx.gbl>,
	<AANLkTi=Y90PWXBSsZmbtub-S519CdBaAEEDQ-dnTrsvN@mail.gmail.com>,
	<BLU132-W287C05944F8D53A62038EDB0710@phx.gbl>,
	<AANLkTintK8OdmZbumTuVA6UAv=PYujw9PmjzKL1wtDMj@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Sep 2010 12:59:56.0922 (UTC)
	FILETIME=[926D5DA0:01CB4E8C]
X-SA-Exim-Connect-IP: 65.55.111.173
X-SA-Exim-Mail-From: mgcse@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: selecting needed applications only
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
X-List-Received-Date: Tue, 07 Sep 2010 13:03:15 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> Date: Tue=2C 7 Sep 2010 14:47:30 +0200
> From: fransmeulenbroeks@gmail.com
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] selecting needed applications only
>=20
> 2010/9/7 mahmut g <mgcse@hotmail.com>:
> >
> >
> >     Thanks Frans=2C in this case I have a new question. How can I deter=
mine the packages' dependency? For instance I just want to use QT on user s=
pace. Is that a way to learn which packages must be for QT? I am familiar w=
ith menuconfig selection=2C is there any tool/script which handles dependen=
cies?
> > Regards=2C
> > MahmutG
> >
> >
> Please do not top post.
> There is no need to determine dependencies.
> The build machinery will take care about that and include all what is
> needed (this is specified in the recipe in DEPENDS/RDEPENDS)
>=20
> Just give it a try!
>=20
> Frans
>=20

Thank you=2C I will try at home tonighttonight.
Regards=2C
Mahmut 		 	   		  =

