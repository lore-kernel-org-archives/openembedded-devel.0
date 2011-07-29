Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmvyG-00060Z-Md
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 00:55:56 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QmuTk-00027S-It from Tom_Rini@mentor.com ;
	Fri, 29 Jul 2011 14:20:20 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 29 Jul 2011 14:20:17 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 29 Jul 2011 14:20:16 -0700
Message-ID: <4E332407.6080902@mentor.com>
Date: Fri, 29 Jul 2011 14:20:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4E316894.1020100@dresearch-fe.de>
In-Reply-To: <4E316894.1020100@dresearch-fe.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Jul 2011 21:20:17.0881 (UTC)
	FILETIME=[5090EC90:01CC4E35]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Fri, 29 Jul 2011 22:55:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/28/2011 06:48 AM, Steffen Sledz wrote:
> Tom,
> 
> Please pull the 10 commits from here:
> 
> URI: git://git.openembedded.org/openembedded
> Branch: sledz/maintenance
> 
> Eric Bénard (1):
>       apr-util: add 1.3.10
> 
> Mario Schuknecht (3):
>       udev: avoid udev stopping persistent pppd connections
>       linux-2.6.24: enable tun device support (hipox machine only)
>       linux-2.6.24: fix deadlock situation in gmac driver (hipox machine only)
> 
> Steffen Sledz (6):
>       linux-2.6.24: fix diff pathes in hipox machine specific patch file
>       linux-2.6.24: fix a buggy patch file for hipox machine
>       ppp-2.4.5: own package for PPPoL2TP plugin
>       ppp-2.4.5: remove `DP = "-1"`
>       iotop: add missing runtime dependency
>       apr-util: disable odbc support to avoid QA error
> 
> All of them are in oe master. The linux commits are specific to our hipox machine. All others are bugfixes only.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOMyQGAAoJEI4NMjfc3nJxtOAH/A7+3x6k5UYP3jA5gWogeM4k
GiqpNdhBko7wHHxr0nncMTGEdi1XtEYmYJdDMqETISCP9RB+/h3VHN+yZ//5BDw2
C+qdx3OXlDXHPEcyaJYWnurL7tNHbHimfKTaCb71/FmFWUgTOmyfXlQADZq6vz1L
2akczxembTpRugzrjzoVAs9kEozi7JNypNv/97+4jrHXI0IAjU3Mf4k+mvKGEUaD
9WYE/4MobrpUFZP9CLrecq0/OW3+qgB/Hf+T+PsOEoDBnNKspmdGUiaJsSvyX8Rx
xuDrKhcbdnGEadstr6z2dNj11IjhbNmTUi0Ic9SWzkFmDms7gZXssLTJeE4+pKg=
=jgX6
-----END PGP SIGNATURE-----


