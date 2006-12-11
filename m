Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Gts7m-0001M5-CF
	for openembedded-devel@openembedded.org; Mon, 11 Dec 2006 21:51:46 +0100
Received: (qmail 7657 invoked by uid 813007); 11 Dec 2006 20:50:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 11 Dec 2006 20:50:16 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Dec 2006 21:50:15 +0100
User-Agent: KMail/1.9.5
References: <456B0DC2.90300@dominion.kabel.utwente.nl>
	<444521399.20061208175939@vanille-media.de>
	<1165789899.5604.43.camel@localhost.localdomain>
In-Reply-To: <1165789899.5604.43.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200612112150.15571.openembedded@hrw.one.pl>
Subject: Re: To be removed recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Dec 2006 20:51:46 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 10 grudnia 2006 23:31, Richard Purdie napisa=B3:
> On Fri, 2006-12-08 at 17:59 +0100, Michael 'Mickey' Lauer wrote:
> > Richard Purdie wrote:

> > >> Package Name:   bluez*2.*
> > >> Reason:         Obsolete by, and conflicts with bluez 3.7
> > >
> > > Fine with me.
> >
> > This can be a problem for Opie, since we used the no-dbus version for
> > quite some time to save space.
>
> In that case we can't remove the no-dbus version needed by opie.

Does someone tested OPIE with dbus version at all? How much does extra=20
packages take etc? Without such testing sentence 'do not remove=20
bluez*nodbus because OPIE needs it' does not have sense.

I also would like to get rid of bluez 2.x because it will be unmaintained=20
software soon due to fact that everyone switched to 3.x versions.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         You can close your eyes to reality, but not to memories.




