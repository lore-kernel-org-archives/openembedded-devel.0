Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QKHl3-0005dE-55
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 00:19:53 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QKHiM-0006N3-RJ from Tom_Rini@mentor.com ;
	Wed, 11 May 2011 15:17:06 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 11 May 2011 15:15:17 -0700
Received: from [172.30.80.16] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 11 May 2011 15:17:06 -0700
Message-ID: <4DCB0ACF.2080605@mentor.com>
Date: Wed, 11 May 2011 15:16:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1304925139.git.stefan@buglabs.net>
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 May 2011 22:15:17.0219 (UTC)
	FILETIME=[E87DB330:01CC1028]
Subject: Re: [PATCH 2011.03-maintenance 0/7] Openjdk fixes from master
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
X-List-Received-Date: Wed, 11 May 2011 22:19:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/09/2011 12:29 AM, Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> Hello.
> 
> Another pull request for openjdk related fixes. They have been in master for
> quite some time now and we tested them heavily at Buglabs. They improve the
> openjdk build situation a lot making it more robust and eliminating random
> failures.
> 
> The patch from myself is for the 2011.03 release only as it covers a merge
> failure I introduced with my last pull request.

Sorry for the delay, this has been applied now.  Thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNywrDAAoJEI4NMjfc3nJx6nMIAKNH8EaQlc6qxcdMmrmGufec
ktz8a7EODHHQSvwOhLl8x+BTtds8jQBTd79xD4tJSQxf6XJMd3ZnaEeBBYtJF0VK
CCnIm5AItoaFOP5OdxsCF5+0DiuifdQA86k4q+R2wkAt58VP14oII95D1YGwYvwj
YHmc9ryMwo8+vFDDrQWveEOKdndkJVVLdlKt7a8NWQygNu5Obt131OvJFvgQKnCQ
Dr6ZPkn8E+73AlKINU/fjhfjwUiCszvWErpeUoH6aght5RLWp8pxLC8wTqoPw7RI
F3nlH0Hjd5RAIlhdvTPWnpS45IYEjg7e/HQiN8lPOsd37XFqnMJzJuauMARtB34=
=Z432
-----END PGP SIGNATURE-----


