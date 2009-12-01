Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NFQ5t-0003Je-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 11:36:32 +0100
Received: (qmail 31793 invoked by uid 813007); 1 Dec 2009 10:34:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Dec 2009 10:34:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Dec 2009 11:35:07 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
	<ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
In-Reply-To: <ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200912011135.08560.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 10:36:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 1 grudnia 2009 o 11:29:46 Frans Meulenbroeks napisa=C5=82(a):
> 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > hi
> > I want cross compile linphone for compulab EM-x270 board.when i try
> >   sudo bitbake -b
> > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > linphone_3.1.0.bb
> >    then i will get the following error
> >   *bb.parse.ParseError: Could not inherit file classes/autotools.bbclass
> > *
> >    pleasse guide me in compiling linphone for compulab board.
>=20
> first remark:
> there is no need to run bitbake as root.
>=20
> 2nd thing you could check is if the file exists in your tree and if so
> if your path is set properly.

3rd: do not use "bitbake -b" command but "bitbake" because "-b" expands to=
=20
"--be-not-nice-to-me-and-do-not-build-dependencies".

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




