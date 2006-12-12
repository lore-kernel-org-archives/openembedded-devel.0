Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GuEJ4-0003wj-Jk
	for openembedded-devel@openembedded.org; Tue, 12 Dec 2006 21:32:54 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBCKVGLr008211 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 21:31:16 +0100
Message-ID: <457F1191.2050208@dominion.kabel.utwente.nl>
Date: Tue, 12 Dec 2006 21:31:13 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>
In-Reply-To: <E1GuDwk-0002kI-IJ@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.* removal to a	month later, as it is known to be used by OPIE.
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
X-List-Received-Date: Tue, 12 Dec 2006 20:32:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pfalcon commit schreef:
> removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE. 
> * Suggested by Marcin Juszkiewicz

>  Proposed by:    Koen Kooi
                   ^^^^^^^^^
If you're going to sneak in that commit when I'm offline at least have the decency to
notify me explicitly, so I know to do push the removal cset.

You're free to re-add the fixed version that doesn't break apps depending on bluez-libs,
but not the broken version.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFfxGRMkyGM64RGpERAsFGAJ9mjlQhjzqkHdgyyXng4EsMeE4YZwCcDsyf
/c2lRE3VVUOLqlXbnhz9beg=
=y1bm
-----END PGP SIGNATURE-----


