Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H6BTz-0006xn-C9
	for openembedded-devel@openembedded.org; Sun, 14 Jan 2007 20:57:35 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0EJtGox017862 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2007 20:55:17 +0100
Message-ID: <45AA8A9F.4070601@dominion.kabel.utwente.nl>
Date: Sun, 14 Jan 2007 20:55:11 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200701082227.08898.openembedded@hrw.one.pl>
In-Reply-To: <200701082227.08898.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: get rid of virtual/libsdl
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
X-List-Received-Date: Sun, 14 Jan 2007 19:57:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> I see more and more reports where people has problems with building SDL 
> stuff just because they have 'virtual/libsdl == libsdl-qpe' in build 
> config. We all know that libsdl-qpe is set of hacks applied to hacks 
> which evolved from other hacks and thats that all is in state which no 
> one want to have something to do. No one ever sent parts of it upstream, 
> no one tried to update it to more recent SDL version etc.
> 
> I would like to have one small change in OE: removal of virtual/libsdl at 
> all or some kind of other change which would mark libsdl-qpe as not 
> providing virtual/libsdl at all. 
> 
> Most of SDL stuff in OE builds without problem with libsdl-x11 and most of 
> them even works when user with libsdl-qpe tries to use it. But if someone 
> tries to build SDL apps with libsdl-qpe then he is hit with linking 
> problems, with '-no-rtti/-rtti' problem etc. I'm tired of it.

moved to packages/obsolete till someone comes up with a support plan.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFqoqeMkyGM64RGpERAkGGAJ9ZXdjowNu+7nAjGJWSMOoPI9AtowCgpipc
cK0rg5pshb76iAKlVfJ4fog=
=/d0v
-----END PGP SIGNATURE-----


