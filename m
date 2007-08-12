Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IKD9m-0001C0-FD
	for openembedded-devel@openembedded.org; Sun, 12 Aug 2007 15:06:58 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7CD6mj1026099 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2007 15:06:49 +0200
Message-ID: <46BF05E4.9040609@dominion.kabel.utwente.nl>
Date: Sun, 12 Aug 2007 15:06:44 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46BA010A.1020106@dominion.kabel.utwente.nl>
	<1186920412.5193.15.camel@utx.utx.cz>
In-Reply-To: <1186920412.5193.15.camel@utx.utx.cz>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Reminder: autotools 2.61 will be made default tomorrow
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
X-List-Received-Date: Sun, 12 Aug 2007 13:06:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav Brabec schreef:
> Koen Kooi wrote:
> 
> ERROR: '/OE/org.openembedded.dev/packages/autoconf/autoconf-native_2.61.bb' failed
> 
> It seems that we have a new requirement for the build environment:
> /OE/build/tmp/work/x86_64-linux/autoconf-native-2.61-r0/autoconf-2.61/build-aux/missing: line 54: help2man: command not found

That's now new, sanity.bbclass has been checking for that for over a month now.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvwXkMkyGM64RGpERAml6AJ0aTWGZGo5u9RJ0v/PFxUYId7TSJQCdE1Hw
AaDt8i6l1Yb7MmQ4x+BONOs=
=u+tI
-----END PGP SIGNATURE-----


