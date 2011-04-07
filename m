Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7s2E-0001me-BI
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 18:26:18 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q7s0B-0004w6-8d from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 09:24:11 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 7 Apr 2011 09:21:57 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 7 Apr 2011 09:24:10 -0700
Message-ID: <4D9DE521.2090606@mentor.com>
Date: Thu, 7 Apr 2011 09:24:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <inkeui$jpv$1@dough.gmane.org>
In-Reply-To: <inkeui$jpv$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 07 Apr 2011 16:21:57.0349 (UTC)
	FILETIME=[EA56C150:01CBF53F]
Subject: Re: [2011.03-maintenance] Pull request #13
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
X-List-Received-Date: Thu, 07 Apr 2011 16:26:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/07/2011 06:41 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 13 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> 
> Koen Kooi (1):
>       pixman: add 0.21.6 + fixes
> 
> Michael Jones (1):
>       base-files: write Angstrom as Ångström in the issue file.
> 
> Siddharth Heroor (6):
>       ti-sysbios: Add missing License field.
>       ti-sysbios: Copy installer unpack to recipe versions.
>       ti-sysbios: Update Installer unpack commands.
>       ti-sysbios: Add version 6.31.04.27.
>       linux-omap3: Add PSP recipe for ti816x devices.
>       u-boot: Add PSP version for ti816x devices.
> 
> chase maupin (5):
>       linux-omap4: Add support for am45x-evm machine
>       u-boot: Add support for am45x-evm machine
>       sort: Add support for am45x-evm machine type
>       alsa-state: Add support for am45x-evm machine type
>       am45x-evm: Add am45x-evm machine configuration
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
> These are all cherry-picks[1] from .dev. The AM4x and sysbios stuff was
> only build tested, no proper hw on my desk yet.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNneUaAAoJEI4NMjfc3nJxlSoIAIyB4XOwvjUwZLHZoXW5DIYV
SBQt0w+LCaP0q9Znkhs7Y7EbEGud7tVYiV3PhIATwXw7QvkbNfcr+VIuRl5oiIpr
pK7l0B6XXiTpzpW29k/tIIhz7m4rJHGNe78UpP0jC4Pv0/Lx9iHEdH5QRAx2NmF4
IR7CT+5fP7o3FzXjonQllL90q70EtdJzh6ipgm5Ujh+azNf1TXzM/qKpQVHRg2DA
gKSSRFR645N0bEMPSNCQPcvzGZ38SwEJZjgyyBgEWM37ZLlIgY04FCEDR9dBKYXk
BTgP/ukQ0OJP1fN+XDNGPZxfR1xHyKj8iKd7cb1m3QoO9kokoIk04zEcuisMnDw=
=V769
-----END PGP SIGNATURE-----


