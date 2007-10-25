Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IkxOm-0001lN-45
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 09:45:00 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9P7bYUo025644 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2007 09:37:34 +0200
Message-ID: <472047C3.20208@student.utwente.nl>
Date: Thu, 25 Oct 2007 09:37:39 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
In-Reply-To: <20071025001926.GA14645@lenovo>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: getting started - docbook
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
X-List-Received-Date: Thu, 25 Oct 2007 07:45:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:

> The biggest challange is deciding on the correct terminology.
> I think that I will start creating a glossary so new users can look up
> terms and experienced users can use 'approved term' consistently. (to
> keep the new users from getting unnecessarily confused) A bitbake
> file, a recipe, and a package all seem to be the same thing.  I didn't
> realize that they were all the same thing until this afternoon.

Actually they aren't the same :)

A bitbake file and a recipe are the same thing, but they produces a
package (.ipk, .deb, etc). That's why we have DEPENDS (for the recipe)
and RDEPENDS (for the package).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHIEfDMkyGM64RGpERAg+XAJ9HxHHjWGDPiW7WGriXKtc+Jkm2/QCfYcR1
0KW9zWTfAWtZucToyHJSyrk=
=TP1Q
-----END PGP SIGNATURE-----


