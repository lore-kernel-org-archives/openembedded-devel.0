Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HjK41-0005M2-UK
	for openembedded-devel@openembedded.org; Wed, 02 May 2007 21:00:38 +0200
Received: (qmail 31402 invoked by uid 813007); 2 May 2007 18:51:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 2 May 2007 18:51:07 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 May 2007 20:51:02 +0200
User-Agent: KMail/1.9.6
References: <bdb0025f0705021104x23d2c407rb4da0e48e24eb911@mail.gmail.com>
In-Reply-To: <bdb0025f0705021104x23d2c407rb4da0e48e24eb911@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200705022051.03720.openembedded@hrw.one.pl>
Subject: Re: generating debian source packages (dsc)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 19:00:39 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 2 maja 2007, Rodrigo Vivi napisa=B3:
> Hi all,
>
> I'm trying to code a bbclass to build debian source packages, because
> I need these files under mamona repository:
>
>  * .dsc - debian source package control file
>  * .orig.tar.gz - Original source package
>  * .diff.gz - patches that we apply
>
> Since this is my first bbclass I need some help to figure some doubts
> out.

classes/sourcepkg.bbclass is something which you want to extend

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I'm trying to decide if I should kill you or simply feign death
      until you feel awkward and leave.




