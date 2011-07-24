Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qkni0-0007lB-Gc
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jul 2011 03:42:20 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qkndz-0007id-5f from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jul 2011 18:38:11 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 23 Jul 2011 18:35:40 -0700
Received: from [172.30.80.68] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 23 Jul 2011 18:38:08 -0700
Message-ID: <4E2B7772.7050505@mentor.com>
Date: Sat, 23 Jul 2011 18:37:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <j09u33$ovb$1@dough.gmane.org>
In-Reply-To: <j09u33$ovb$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 24 Jul 2011 01:35:40.0546 (UTC)
	FILETIME=[FF1B8E20:01CC49A1]
Subject: Re: [2011.03-maintenance] Pull request #22
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
X-List-Received-Date: Sun, 24 Jul 2011 01:42:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/21/2011 12:18 PM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 4 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Joel A Fernandes (2):
>       linux-omap-psp: Added patch to fix MMC timeout errors
>       beagleboard-test-scripts: BeagleBoard userbutton detection for flashing
> 
> Koen Kooi (1):
>       gst-plugins-good 0.10.28: bump PR for pulseaudio .15 -> .22 update
> 
> chase maupin (1):
>       nodejs: Add patch to compile with GCC 4.3.3
> 
> 2 cherry-pick, the nodejs is a backport since the version in .dev isn't in maintenance and gst-plugins-good is local to maintenance since the pulse update was local as well.
> 
> I'll do a seperate #23 with some more beagle kernel updates later this week.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOK3dfAAoJEI4NMjfc3nJxXfcH/0HjMfIstGEuZCkHCWIy/YrQ
2Q2TwpcjkueUgV+71qO3GzjzccRDz5Dk6FXRMEp0Pj/6NIDRwBpb7QQ3eLu5XvL1
12aVcbhdegHKcWDI0Gc9KPiP8+ObgrjCqlyIrWHAztJHj80Uob97++ONj49HXStu
MDbJVxaHO2RyI5zaHE0YbsBwaVSWGrOY9I45nqSB7d7hUbNC6eWnn4u0kVnMlQZ3
wesh5R9sUiWrqdztL+vnbPlK71+IFzjgQuzcIAg1Aqs/FVq3p2Rp9YpzORqry+4V
xAoTKBVokWCpTMP2+wBaEV0n6DUyXNDsB7FE/eeRFOI3AswUQ34nO39I9pTSS94=
=T25o
-----END PGP SIGNATURE-----


