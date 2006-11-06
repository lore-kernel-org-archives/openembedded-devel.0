Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GgzKK-0001cZ-Nv
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 08:55:28 +0100
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kA67sALr011197 for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2006 08:54:10 +0100
Message-ID: <454EEA21.7050108@dominion.kabel.utwente.nl>
Date: Mon, 06 Nov 2006 08:54:09 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	kA67sALr011197
Subject: [RFC] New MACHINE_FEATURE: 'screen'
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
X-List-Received-Date: Mon, 06 Nov 2006 07:55:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I was building an =C3=85ngstr=C3=B6m bootstrap image for my loft[1] and n=
oticed it was building
psplash. Since the loft lacks support for graphical output (except usb-vg=
a adaptors), it
would be nice to leave out stuff like bootsplashes. What do you think abo=
ut adding
'screen' to MACHINE_FEATURES?

regards,

Koen

[1] http://www.giantshoulderinc.com/hardware.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFTuohMkyGM64RGpERAop0AJ92ZeeLZnkQNUqm3WwhSFu+kAywBwCgkCjl
xKxp1OaG9JnlHE7p3mJSn7Y=3D
=3DO8KR
-----END PGP SIGNATURE-----


