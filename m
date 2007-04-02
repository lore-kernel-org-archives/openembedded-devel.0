Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HYOLz-0007rG-Sl
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 17:21:56 +0200
Received: (qmail 19544 invoked by uid 813007); 2 Apr 2007 15:21:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 2 Apr 2007 15:21:54 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Apr 2007 17:21:48 +0200
User-Agent: KMail/1.9.6
References: <4610C901.2010306@openhardware.net>
	<20070402151328.GN24962@hovland.org>
In-Reply-To: <20070402151328.GN24962@hovland.org>
MIME-Version: 1.0
Message-Id: <200704021721.49473.openembedded@hrw.one.pl>
Subject: Re: patch: shasum vs. sha256sum
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
X-List-Received-Date: Mon, 02 Apr 2007 15:21:57 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 2 kwietnia 2007, Erik Hovland napisa=B3:

> It should be part of the coreutils package. But I don't think it was in
> the coreutils 5.x series which is the verions that mandriva 2007.0 and
> older have in their release.

Debian has sha256sum since coreutils 5.97.

> If not, just get the latest coreutils from your local GNU mirror and
> build it yourself.

Or "bitbake coreutils-native-6.0" to get it.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           You have dialed a purely imaginary number.=20
           Please rotate your phone ninety degrees and try again




