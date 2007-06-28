Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1I3vit-0001P6-KN; Thu, 28 Jun 2007 17:15:55 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5SFBLUg028518; Thu, 28 Jun 2007 17:11:21 +0200
Message-ID: <4683CF96.40005@dominion.kabel.utwente.nl>
Date: Thu, 28 Jun 2007 17:11:18 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1I3v58-0000nG-7W@linuxtogo.org>
In-Reply-To: <E1I3v58-0000nG-7W@linuxtogo.org>
X-Enigmail-Version: 0.95.1
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.20: update sharpsl-rc patch to	fix IRQ issues (bug 2555)
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
X-List-Received-Date: Thu, 28 Jun 2007 15:15:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav commit schreef:
> linux-rp-2.6.20: update sharpsl-rc patch to fix IRQ issues (bug 2555)

> +CONFIG_BT_HCIUSB_SCO=m

It's a bluetooth remote instead of a wired one?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGg8+WMkyGM64RGpERAs/hAJ0TIVkby9z4YVMT+M4UtqjemgJ94QCfX7tn
F9R/ThEbdkY4BG16izmCzNg=
=iS6M
-----END PGP SIGNATURE-----


