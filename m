Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QQ1BC-0003IJ-Cw
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 19:50:34 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QQ18E-000188-T8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 10:47:30 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 27 May 2011 10:44:22 -0700
Received: from [172.30.80.104] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 27 May 2011 10:47:30 -0700
Message-ID: <4DDFE3AF.60900@mentor.com>
Date: Fri, 27 May 2011 10:47:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <irmf2a$fje$1@dough.gmane.org>
In-Reply-To: <irmf2a$fje$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 May 2011 17:44:22.0235 (UTC)
	FILETIME=[B65FFAB0:01CC1C95]
Subject: Re: [2011.03-maintenance] Pull request #19
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
X-List-Received-Date: Fri, 27 May 2011 17:50:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/26/2011 02:00 PM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 6 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Anand Balagopalakrishnan (2):
>       libgles-omap3: Add wsegl.h to the destination include directory
>       qt4: Fix the include path for SGX PowerVR drivers
> 
> Koen Kooi (4):
>       qt4 4.6.3: bump PR for wsegl header change
>       linux-omap 2.6.39: initial add with beagleboard support
>       linux-omap 2.6.39: sync with meta-texasinstruments
>       linux-omap 2.6.39: sync with meta-texasinstruments
> 
> 
> The kernel and gles ones are cherry-picks, the qt4 ones only picked up
> the 4.6.x changes and not the 4.7.x changes.
> And yes, I was stupid enough to use the same commit message for 2
> different commits in .dev.

This has been applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN3+OvAAoJEI4NMjfc3nJxg6IH/07+nJXQ7xp7xAn3+KrjoUzF
qlNz4mP7+nW0KQu+SKRi57HnKlcyHuk3DrM7aFLUh6zXj4iF+MJFFyC8sX1v1/KW
LW+bsUJLbKJNYGPpQY+o9GA/y+BCTW7/txkq7FcRzy/qj7RQs7yI/l5y8jt/0e3L
OUkdkK4q/x6VRS0zLSnm8UtZSxEQ5kb1LNMxZkIANJyrgqR1vdVTz3P3ubF17ur9
8AM7tNC+7bJZjUVbCxfCTJpPnonEwVYfFecbQJAyQqBT8bd1I23WNmQvGJ7syDi8
KbGcvVRMnPZ8e3GYnupUk5R6mtlfrzKTdWIkCOzfzR0Tmf+nreyd1zqp+HCl7ZM=
=up3Y
-----END PGP SIGNATURE-----


