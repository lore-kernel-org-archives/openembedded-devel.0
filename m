Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QghBa-0008JZ-LJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 19:55:54 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qggq8-00030V-7y from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 10:33:44 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 12 Jul 2011 10:33:44 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 12 Jul 2011 10:33:43 -0700
Message-ID: <4E1C8576.5030700@mentor.com>
Date: Tue, 12 Jul 2011 10:33:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <ive9aj$16a$2@dough.gmane.org>
In-Reply-To: <ive9aj$16a$2@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 12 Jul 2011 17:33:44.0091 (UTC)
	FILETIME=[D9036EB0:01CC40B9]
Subject: Re: [2011.03-maintenance] Pull request #21
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
X-List-Received-Date: Tue, 12 Jul 2011 17:55:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/11/2011 12:38 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 6 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Joel A Fernandes (4):
>       linux-omap: Disable UART sleep timeout to avoid serial port probs
>       angstrom: Use pulseaudio version 0.9.22 for armv7a architecture
>       beagleboard-test-scripts: Add a script flash-fs.sh for flashing
>       linux-omap-psp: Fix the user button GPIO to the correct value for
> 
> Koen Kooi (2):
>       x-load git: 1.5.0 sorts lower than 1.44ss, so bump PE
>       linux-omap-psp 2.6.32: bump PR
> 
> These are all cherry-picks from .dev, except for the pulseaudio one
> since it's an angstrom 2008 only change.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOHIVvAAoJEI4NMjfc3nJxIPoIAKtAli/apah1ZJKfkZ2jqewz
Mt+oApuqXwQM2rxy5FU9XqYBRRYMOV8JRiElNZlh/xK+XadcfdE4wC6uczS9n/e/
4hIlU0fIQkBMLwCpNM9tOBHaNjapsvr+6/wJs7WlW0ZpSHpjJLxSOmJiXPLVsfgQ
Cs1eSxatBPW3RQJiUHHi97IrrPGcrFmBF+9v8PAEHJhtd04wyzlk9U7XX0HgQe7A
QrcADX1QGjSV6C5TomhNcwRCoaZeJsmh/Lxyx8CR3k8TICjsYFpnQuTVw2d82Vdk
a/HjYxz3u/a6JnVHbrJRXwxi1Ljos1HNa91gOIUlS6i5im+nVfYua2m32zcRULc=
=MXn2
-----END PGP SIGNATURE-----


