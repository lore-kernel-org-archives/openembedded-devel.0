Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QohHE-0007SS-Fj
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 21:38:48 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QohD0-0005R6-B9 from Tom_Rini@mentor.com ;
	Wed, 03 Aug 2011 12:34:26 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 3 Aug 2011 12:34:26 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 3 Aug 2011 12:34:25 -0700
Message-ID: <4E39A2AF.9010908@mentor.com>
Date: Wed, 3 Aug 2011 12:34:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4E37C922.9000205@dresearch-fe.de>
In-Reply-To: <4E37C922.9000205@dresearch-fe.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 03 Aug 2011 19:34:26.0158 (UTC)
	FILETIME=[5AB5A8E0:01CC5214]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [2011.03-maintenance] Pull request (net-snmp)
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
X-List-Received-Date: Wed, 03 Aug 2011 19:38:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/02/2011 02:53 AM, Steffen Sledz wrote:
> Tom,
> 
> Please pull the 2 commits from here:
> 
> URI: git://git.openembedded.org/openembedded
> Branch: sledz/maintenance
> 
> Khem Raj (1):
>       net-snmp: Fix build error ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
> 
> Steffen Sledz (1):
>       net-snmp: disable libnl use
> 
> Both are bugfixes and already in oe-dev master.

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOOaKuAAoJEI4NMjfc3nJxohYH/27MO7R0rutEQcH8xPkZt8i3
8/mH9RSCs/62VaossGF9Vyf8shyaTMGm07wY6yo06habP6QQsirbcqCOkPGSF0pu
3Lfin6nODnTHKF1dROGMUFHcv7cIoYmkt5csJTfndoPBlIp0zAuQlAJstu3UHGVe
0ZAqYkIndwF3o1xUSBN5ZaoPoGeDrM6G6Hb6EemJI00zXZr4Ui1V9NdoyzJP/j9j
aKymDRyWWncYxGM539BK12+4ppcgEklo0M1svlOIEpYTNzDKUlig3PBoCvWjMTxo
/oDw3qRFUDtfRKJQ0JeQZ3lk0Qr5HLGQSbYK2zfBpkiGFznF/Vwuz2PR9UiSyk8=
=iTrL
-----END PGP SIGNATURE-----


