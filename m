Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IE2jB-0000Fw-F2
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:46:01 +0200
Received: (qmail 14091 invoked by uid 813007); 26 Jul 2007 12:44:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 26 Jul 2007 12:44:40 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2007 14:44:35 +0200
User-Agent: KMail/1.9.7
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
	<46A895A1.7040400@dominion.kabel.utwente.nl>
In-Reply-To: <46A895A1.7040400@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200707261444.36655.openembedded@hrw.one.pl>
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Thu, 26 Jul 2007 12:46:01 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 26 lipca 2007, Koen Kooi napisa=B3:

> After multiple success reports I'd like to propose the following
> timeline:

> 20070802: make m4-native 1.4.8 the default
> 20070809: make autoconf-native 2.61 the default

make automake 1.9.6 or 1.10 the default

> 20070816: make pkgconfig-native 0.22 the default
> 20070816+: remove autotools hacks in recipes (e.g overriding
> do_configure)

Who will do each test?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        "To be or not to be that is the question.":
         every programmer knows the answer $2b or (not $2b) is $ff.




