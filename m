Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HqPz2-00055b-BG
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 10:44:45 +0200
Received: (qmail 10035 invoked by uid 813007); 22 May 2007 08:43:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 May 2007 08:43:51 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 May 2007 10:43:46 +0200
User-Agent: KMail/1.9.6
References: <4651EFEE.50907@atmel.com>
	<189F751D-9A54-4A17-84FD-82CD2BF62403@gmx.net>
	<003a01c79c29$1985a690$26031a0a@atmel.com>
In-Reply-To: <003a01c79c29$1985a690$26031a0a@atmel.com>
MIME-Version: 1.0
Message-Id: <200705221043.47508.openembedded@hrw.one.pl>
Subject: Re: ERROR: Task 2246 ( ...org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
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
X-List-Received-Date: Tue, 22 May 2007 08:44:48 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 22 maja 2007, Ulf Samuelsson napisa=B3:

> Been trying to fetch all packages in advance by
>
> $ bitbake -c fetch gpe-image
>
> but that does not work.

"bitbake -cfetchall gpe-image" is for that


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       If you're going down in flames, aim for something expensive.




