Received: from blu0-omc4-s14.blu0.hotmail.com ([65.55.111.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mgcse@hotmail.com>) id 1OsxQT-0002z5-AJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:37:26 +0200
Received: from BLU132-W28 ([65.55.111.136]) by blu0-omc4-s14.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 7 Sep 2010 05:35:38 -0700
Message-ID: <BLU132-W287C05944F8D53A62038EDB0710@phx.gbl>
X-Originating-IP: [212.175.157.5]
From: mahmut g <mgcse@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Sep 2010 12:35:37 +0000
Importance: Normal
In-Reply-To: <AANLkTi=Y90PWXBSsZmbtub-S519CdBaAEEDQ-dnTrsvN@mail.gmail.com>
References: <BLU132-W8FA51733A7631FEA4FB63B0710@phx.gbl>,
	<AANLkTi=Y90PWXBSsZmbtub-S519CdBaAEEDQ-dnTrsvN@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Sep 2010 12:35:38.0286 (UTC)
	FILETIME=[2D032CE0:01CB4E89]
X-SA-Exim-Connect-IP: 65.55.111.153
X-SA-Exim-Mail-From: mgcse@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Tue, 07 Sep 2010 12:37:26 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



     Thanks Frans=2C in this case I have a new question. How can I determin=
e the packages' dependency? For instance I just want to use QT on user spac=
e. Is that a way to learn which packages must be for QT? I am familiar with=
 menuconfig selection=2C is there any tool/script which handles dependencie=
s?
Regards=2C
MahmutG






> Date: Tue=2C 7 Sep 2010 14:21:41 +0200
> From: fransmeulenbroeks@gmail.com
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] selecting needed applications only
>=20
> 2010/9/7 mahmut g <mgcse@hotmail.com>:
> >
> >
> > I am new at OE. Actually I heard from many people Openembedded is the b=
est and decided to try. However I couldn't figure out how I can select appl=
ications just I want to be included to my image. There are too many files a=
nd rules. I had tired to use with beagle board and finally given up. The ma=
in reason for learning and using OE was that we wanted to use QT on our boa=
rd. May someone advice any nice guide or documents which show how to select=
 just wanted applications and how I can add a new application=2C it will be=
 appreciated.
> > Regards=2C
> > MahmutG
>=20
> If you want full control make your own image. E.g. start with
> recipes/images/minimal-image.bb copy and rename that and add the
> packages you want to add to IMAGE_INSTALL.
>=20
> Good luck=2C Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =

