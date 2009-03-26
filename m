Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Ln62n-0002Vy-J8
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 07:59:57 +0100
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 981645FF24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 07:58:08 +0100 (CET)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id EA8286001A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 07:58:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on bart
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12 autolearn=no version=3.2.3
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 12523604E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 07:58:07 +0100 (CET)
Received: from [192.168.95.60] (unknown [192.168.95.60])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 9BC8D23EC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2009 20:15:07 +0100 (CET)
Message-ID: <49CBD43B.6070402@bolloretelecom.eu>
Date: Thu, 26 Mar 2009 20:15:07 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C9FEFF.2010802@bolloretelecom.eu>
In-Reply-To: <49C9FEFF.2010802@bolloretelecom.eu>
X-Enigmail-Version: 0.95.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Mar 2009 06:59:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> Ideally, I would like to keep only version 4.4.3 and add 4.5.0 sometime
in the near
> future. This would allow us to simplify the rules used to build Qt.
OK, Qt 4.5.0 has landed in OE. For now I have set a DEFAULT_PREFERENCE
of -1 until we get some build reports. I you use Qt, give it a spin
and let me know whether it works for you.

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknL1DsACgkQCL1n3lVB9EbaPQCgyq2iInVmWEQc3wwgIVg+Urb9
UpoAnjs3LrtHqF9yJP+19KS11EiMX2hQ
=3Dgjt1
-----END PGP SIGNATURE-----


