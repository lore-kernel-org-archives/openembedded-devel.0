Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1Hvqom-0006ZA-93
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 10:24:36 +0200
Received: (qmail 12188 invoked by uid 813007); 6 Jun 2007 08:22:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 6 Jun 2007 08:22:15 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jun 2007 10:22:10 +0200
User-Agent: KMail/1.9.7
References: <46665B15.8090401@dominion.kabel.utwente.nl>
	<74d0deb30706060046q7a91542bl6591542175161eb5@mail.gmail.com>
	<466669AD.6050809@dominion.kabel.utwente.nl>
In-Reply-To: <466669AD.6050809@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200706061022.11908.openembedded@hrw.one.pl>
Subject: Re: RFC: splitting task-boot out of task-base
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
X-List-Received-Date: Wed, 06 Jun 2007 08:24:37 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 6 czerwca 2007, Koen Kooi napisa=B3:
> +# packages which content depend on MACHINE_FEATURES need to be
> MACHINE_ARCH +#
> +PACKAGE_ARCH_task-boot =3D "${MACHINE_ARCH}"

PACKAGE_ARCH =3D "${MACHINE_ARCH}"

And then commit.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          Monday is a hard way to spend one-seventh of your life.




