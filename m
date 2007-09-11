Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IVBR6-0006lf-9w
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 21:30:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8BJR1YY004426 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 21:27:02 +0200
Message-ID: <46E6EC08.209@student.utwente.nl>
Date: Tue, 11 Sep 2007 21:27:04 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
In-Reply-To: <c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Tue, 11 Sep 2007 19:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello all,
> 

> Maybe a minimal set of USE flags instead of creating -lite or -minimal
> .bb is an option?
> Or, using an include file that defines configuration variables
> (HAVE_GTK, HAVE_X)?

Any form of USE flags is *bad* and *unacceptable*. I'll leave it to the other core people
to throw around terms like 'deterministic' and 'package space' :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG5uwIMkyGM64RGpERAi0IAJ9PQlx4QvSPiTwJnu7uz6ZEk/y8/wCghoJF
fpxV38r3QzACxaFvG+Xwbrc=
=pK1Q
-----END PGP SIGNATURE-----


