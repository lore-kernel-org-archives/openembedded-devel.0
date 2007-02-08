Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1HFCv2-0006VI-MT; Thu, 08 Feb 2007 18:18:48 +0100
Received: from [130.89.6.180] (vpn006180.vpn.utwente.nl [130.89.6.180])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l18HIhox006099; Thu, 8 Feb 2007 18:18:43 +0100
Message-ID: <45CB5B67.1050001@dominion.kabel.utwente.nl>
Date: Thu, 08 Feb 2007 18:18:31 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HFBZs-0003jR-57@linuxtogo.org>
In-Reply-To: <E1HFBZs-0003jR-57@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev bitbake.conf: Add GPE Phone Edition mirror.
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
X-List-Received-Date: Thu, 08 Feb 2007 17:18:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

florian commit schreef:
> bitbake.conf: Add GPE Phone Edition mirror.

>  GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
>  GPEPHONE_MIRROR = "http://gpephone.linuxtogo.org/download/gpephone"
>  GPE_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=${PN}"
> +GPEPHONE_MIRROR = "http://gpephone.linuxtogo.org/download"
> +GPEPHONE_SVN = "svn://projects.linuxtogo.org/svn/gpephone/trunk/source;module=${PN}"

Ehm.... Why did you add another (wrong) GPEPHONE_MIRROR? The one present was working
pretty well.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFy1tnMkyGM64RGpERAgUjAKCFiyAZq6loocZ76UHhlUVpw+19LQCfRzSN
7OTIhn+V3LzKtp1WDLecsdM=
=f2tu
-----END PGP SIGNATURE-----


