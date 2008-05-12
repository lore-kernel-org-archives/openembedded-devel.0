Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Jvf8V-00028s-VK
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 23:00:45 +0200
Received: (qmail 12154 invoked by uid 813007); 12 May 2008 20:59:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2008 20:59:25 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2008 22:58:40 +0200
User-Agent: KMail/1.9.9
References: <48246A67.4030800@balister.org> <g01vo9$fb9$1@ger.gmane.org>
In-Reply-To: <g01vo9$fb9$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805122258.40698.openembedded@haerwu.biz>
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 21:00:47 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Friday, 9 of May 2008, Koen Kooi napisa=B3:
> Philip Balister wrote:
> > I'd like to change the variable used for the user to add packages to
> > a standard image from ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL.
> > This is an image property, and not Angstrom specific.
> >
> > Is there anything wrong with this idea?
>
> Yes, since it is intended to put angstrom specific stuff inside the
> image.=20

If you want to have own images - create them. Otherwise we have people=20
which builds random images and can not be supported (why does=20
my 'minimal-image' does not have working touchscreen when I start Abiword=20
from icon after booting to full X.org with E17?).

> It is there because it got fed up receiving hate-mail everytime=20
> I edited an image recipe. Since we seem to have a couple of resident
> angstrom-haters nowadays, I vote for leaving it as-is.

I vote against IMAGE_EXTRA_INSTALL. Let it live as ugly Angstrom hack for=20
breaking sane images into unsupportable ones.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     If you can't learn to do it well, learn to enjoy doing it badly.
     		-- Ashleigh Brilliant




