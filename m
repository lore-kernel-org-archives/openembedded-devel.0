Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HBdhK-0005SL-Qg
	for openembedded-devel@openembedded.org; Mon, 29 Jan 2007 22:05:54 +0100
Received: (qmail 15462 invoked by uid 813007); 29 Jan 2007 21:05:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 29 Jan 2007 21:05:53 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jan 2007 22:05:49 +0100
User-Agent: KMail/1.9.5
References: <45BE4E7C.6050703@informatik.uni-kl.de>
In-Reply-To: <45BE4E7C.6050703@informatik.uni-kl.de>
MIME-Version: 1.0
Message-Id: <200701292205.50460.openembedded@hrw.one.pl>
Subject: Re: Packages: provide openssl 0.9.8?
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
X-List-Received-Date: Mon, 29 Jan 2007 21:05:55 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 29 stycznia 2007 20:43, Paul Pichota napisa=B3:

> I wonder if openssl 0.9.8 could be added to the packages, since it
> supports Diffie-Hellman with Elliptic Curves.
> I have been able to build it with Nylon, a build environment for the 4G
> Access Cube which is based on OpenEmbedded. After applying patches
> distributed by the OpenWRT project and editing the .bb file the
> libaries were created and the package built.

Please add it into bugtracker. We will test and add it into repository.=20
I wonder how many packages will need updating to use 0.9.8 openssl instead=
=20
of 0.9.7 (I do not know does they are totally compatible).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        Linux! -- Because a big world can not fit in small windows.




