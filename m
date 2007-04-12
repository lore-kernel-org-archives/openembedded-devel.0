Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Hc5wa-0007z7-M9
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 22:31:00 +0200
Received: (qmail 3014 invoked by uid 813007); 12 Apr 2007 20:30:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 12 Apr 2007 20:30:57 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2007 22:30:46 +0200
User-Agent: KMail/1.9.6
References: <bdb0025f0704121326y3fef7ab6q62eb7b906ce3e947@mail.gmail.com>
In-Reply-To: <bdb0025f0704121326y3fef7ab6q62eb7b906ce3e947@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200704122230.47033.openembedded@hrw.one.pl>
Subject: Re: gcc (and others) missing some links to binaries
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
X-List-Received-Date: Thu, 12 Apr 2007 20:31:00 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 12 kwietnia 2007, Rodrigo Vivi napisa=B3:

> When I was using mamona I've noticed that gcc was installed but
> without the gcc command... Then I realized that in package there were
> only this files
>
> /usr/bin/arm-mamona-linux-gnueabi-gcc
> /usr/bin/arm-mamona-linux-gnueabi-gccbug
>
> but not the /usr/bin/gcc or gccbug


> Do you have any idea?

gcc-symlinks, binutils-symlinks packages are what you need ;)


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I'm trying to decide if I should kill you or simply feign death
      until you feel awkward and leave.




