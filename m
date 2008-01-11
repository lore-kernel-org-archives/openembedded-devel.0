Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JDLxi-0001sD-LN
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 16:38:26 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0BFc50k031829 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 16:38:05 +0100
Message-ID: <47878D5C.8060902@student.utwente.nl>
Date: Fri, 11 Jan 2008 16:38:04 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1JD6S8-0007NF-85@linuxtogo.org>	<183939929.20080111135328@gmail.com>
	<47878BD4.8040501@spesonline.com>
In-Reply-To: <47878BD4.8040501@spesonline.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Problem with xorg download server
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
X-List-Received-Date: Fri, 11 Jan 2008 15:38:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ohviey1 schreef:
| failed: Connection timed out.
| Retrying.
|
| --16:29:44--
| http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.0.3.tar.bz2
|   (try: 3) => `/home/stefano/poky/sources/xtrans-1.0.3.tar.bz2'
| Connecting to xorg.freedesktop.org|131.252.210.176|:80...
|
|
| All the day i have this problem how can resolve?

Last login: Fri Jan 11 16:36:34 on ttys001
Powerbook-2:~ koen$ date
vr 11 jan 2008 16:36:42 CET
Powerbook-2:~ koen$ wget
http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.0.3.tar.bz2
- --16:36:44--
http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.0.3.tar.bz2
~           => `xtrans-1.0.3.tar.bz2'
Resolving xorg.freedesktop.org... gereed.
Connecting to xorg.freedesktop.org[131.252.210.176]:80... connected.
HTTP verzoek verzonden, wacht op antwoord... 200 OK
Lengte: 102,657 [application/x-bzip2]

100%[==================================================>] 102,657
67.15K/s    ETA 00:00

16:36:46 (67.15 KB/s) - `xtrans-1.0.3.tar.bz2' bewaard [102657/102657]

Powerbook-2:~ koen$ md5sum xtrans-1.0.3.tar.bz2
bb196907ea1e182dcb396eb22f7d2c1a  xtrans-1.0.3.tar.bz2
Powerbook-2:~ koen$


The problems really is at your end, please contact your ISP.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHh41cMkyGM64RGpERAqz9AJsH9DpEoJqg7L/LAO9QmEsofSll0QCeOATo
/gitfIMAk8yHU1z0skSwAPc=
=fYRF
-----END PGP SIGNATURE-----


