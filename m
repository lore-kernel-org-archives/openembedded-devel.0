Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QfZIj-0007dC-H3
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 17:18:37 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QfZEy-0005vb-6S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 08:14:44 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 9 Jul 2011 08:14:44 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 9 Jul 2011 08:14:43 -0700
Message-ID: <4E187052.9010402@mentor.com>
Date: Sat, 9 Jul 2011 08:14:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1310134621-25789-1-git-send-email-gchiii@mtiemail.com>
In-Reply-To: <1310134621-25789-1-git-send-email-gchiii@mtiemail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 09 Jul 2011 15:14:44.0039 (UTC)
	FILETIME=[EEB73D70:01CC3E4A]
Subject: Re: [2011.03-maintenance]
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
X-List-Received-Date: Sat, 09 Jul 2011 15:18:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/08/2011 07:17 AM, George C. Huntington III wrote:
> Cherry-pick: 0f0ee32d7045bc75ce9759805d04874499f1c958
> Tested-by: George C. Huntington III <gchiii@mtiemail.com>
> 
> please add this to the 2011.03-maintenance branch
> (sorry, i think i screwed up my last attempt to send this request)
> 
> 
> Robert Schuster (1):
>   cacao-native_hg: Fix cacao-shutdownguard.patch
> 
>  recipes/cacao/cacao-native_hg.bb              |    2 +-
>  recipes/cacao/files/cacao-shutdownguard.patch |   32 +++++++++++++-----------
>  2 files changed, 18 insertions(+), 16 deletions(-)

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOGHBNAAoJEI4NMjfc3nJxuOsH/1O/ZfgfQgeBC1LsPmlMFAIN
KZZORUK8fr1fTnkX6ANcCm3vSGWlxLG+1M3K0tr877aQ6Zi9FCqfHQHwVo328wlW
r/sU5sipDQksaIhRkbgjUSr2wojTDd2OLaHcn0SOGdQ30ZAOMffK+uh9p4SwUbDF
ccVX9SyOJzS/jZ2JlbVzKGsVh9TeL0XQuScx/+YZ2/s98bp7VFxNixktQSXBh9Vf
Rn6hD9lTInPQKZtX02JFCyyyNzcG+r6auV+GkBD5FPFjkY1oPar+mNPFoEBhKOFl
rxrWiDCiHz+y08WW1s17wRaHr9VunGhZH5qF1MwK59jUVIcYWmhmg4SbGZcXqg4=
=gHu5
-----END PGP SIGNATURE-----


