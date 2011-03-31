Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5L3c-00034p-SC
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 18:49:17 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q5L1i-0000EX-6E from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 09:47:18 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 09:45:40 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 09:47:16 -0700
Message-ID: <4D94B00B.6040006@mentor.com>
Date: Thu, 31 Mar 2011 09:47:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
	<AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>
In-Reply-To: <AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 16:45:40.0146 (UTC)
	FILETIME=[11801920:01CBEFC3]
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 16:49:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 03:51 AM, Frans Meulenbroeks wrote:

> Adding new machines on a maintenance branch seems somewhat odd as new
> somewhat conflicts with maintenance.
> is this what we want? And if so, what about adding new recipes?

To be clear, I do not have a problem with backporting support for new
hardware nor support for new recipes to 2011.03-maintenance so long as
(as stated on the wiki page) they are first and foremost backports and
secondly something the the users of the branch desire.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlLALAAoJEI4NMjfc3nJxrIQH/3yOQmPPBXVjZjYo4wHtZF1Q
xZ8MZAK6X5NoDkBMZGwMZP0uGAHYeq4FW+C5oMhGQ/Woq0mXHL7MVUUThXL5gGUi
0wH82tw/Pp8hEJjtWey4f9I2sKXDKI0Twa0At5+Ux+VhYsHtIbO3G6Ats029x1dJ
XcXSGvAjZbEcB/GZE8j5UXY9OZZmJXwRQMrz2DGLOMzT4BR5V2aLzyCSPGKD/N1u
D1DgiOJ/xgzOsNmK0yvfWtszyc84GbFKmwbZ3nRvz5FB/fyuW00kB6R6f3a9LQmf
eWMXXy4zI0bLcU+S/TL7kR9ZSnEHqbwZnnYM+ubw0PAqFuDY2XP9TyCjS+U78WQ=
=3EPj
-----END PGP SIGNATURE-----


