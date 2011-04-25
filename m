Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEOzz-0002nM-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 18:51:00 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QEOxb-0003vD-Tc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 09:48:31 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 09:48:03 -0700
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 25 Apr 2011 09:48:31 -0700
Message-ID: <4DB5A5DC.5040701@mentor.com>
Date: Mon, 25 Apr 2011 09:48:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <ioru67$bfr$1@dough.gmane.org>
In-Reply-To: <ioru67$bfr$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Apr 2011 16:48:03.0282 (UTC)
	FILETIME=[8B24AB20:01CC0368]
Subject: Re: [2011.03-maintenance] Pull request #15
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
X-List-Received-Date: Mon, 25 Apr 2011 16:51:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/22/2011 06:00 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 18 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Eyal Reizer (3):
>       ti-wifi-utils: update to a newer git commit
>       hostap-daemon: build from git sources
>       wpa-supplicant: Build from git sources
> 
> Koen Kooi (1):
>       libgles-omap3: abstract ES handling and share it across all
> 
> Tom Rini (14):
>       db: Rework arm-thumb-mutex_db5.patch
>       db: Switch to patchdir rather than applying in do_configure
>       ftpd-topfield: Rework usb-header-name-2-6-23.patch
>       opie-sh 1.2.4: Rework opie-sh-fsmounter-name.patch
>       qscintilla 1.65-gpl-1.6: Rework no-external-lexers.patch
>       poboxserver: Rework unicode.patch
>       xqt2: Rework the patches for xqt2 (vs the core part).
>       In a large number of patches, remove unneeded '..' in paths.
>       opie-sh: Switch to patchdir rather than applying in do_configure
>       poboxserver: Switch to patchdir rather than applying in
>       qscintilla: Switch to patchdir rather than applying in
>       xqt2: Switch to patchdir rather than applying in do_configure
>       samba: Switch to patchdir rather than applying in do_configure
>       vim: Switch to patchdir rather than applying in do_configure
> 
> These are all cherry-picks from .dev.
> 
> regards,
> 
> Koen

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNtaXWAAoJEI4NMjfc3nJx+XIIAJD7wJuTToZ4ixXPhubEFG0z
v4E8PsL6GqP2B7XDwSae54CZnEGFWjwrjg1TbTT481BkofE8xyE0ifoP7n9VIqJi
qcl1eaIVyN7p76RDy3LJgHOG6K0DhNHlRtEEK52fU73EorGYGiJApN/2eiSxLw2q
nMvIxWvMUXGjEMJ6k7EZNII8iudNENGM5eAdcv9loeua32i/pDmAjGhlmm4JUMwb
PvV+ZSByNvCRjppCH/nlsCPorSKgX1JQmUty33Jt76LiRIsrIykCpqoHvoXYQUOG
kCGRZEBeQ+K6a8OMYSJopEuk3c0qGd0si0yPdHacTdzeSbLr3tAUTm+QFWls9YI=
=cMaR
-----END PGP SIGNATURE-----


