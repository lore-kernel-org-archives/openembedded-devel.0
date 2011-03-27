Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q3s0D-0002O8-Cn
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 17:35:58 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q3ry9-0004yW-TG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 08:33:33 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 27 Mar 2011 08:32:16 -0700
Received: from [172.30.80.83] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Mar 2011 08:33:33 -0700
Message-ID: <4D8F58C8.50306@mentor.com>
Date: Sun, 27 Mar 2011 08:33:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <imkra1$jiv$1@dough.gmane.org>
In-Reply-To: <imkra1$jiv$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Mar 2011 15:32:16.0584 (UTC)
	FILETIME=[271EDC80:01CBEC94]
Subject: Re: [2011.03-maintenance] Pull request #6 (replaces #5)
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
X-List-Received-Date: Sun, 27 Mar 2011 15:35:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/26/2011 06:56 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 16 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance-pr6
> 
> Kartik Mohta (1):
>        libarchive: Requires libxml2
> 
> Khem Raj (2):
>        cairo_1.10.0.bb: Fennec will now need tee support in cairo so
> enable it
>        fennec: Make it build on ARM eglibc/uclibc
> 
> Koen Kooi (2):
>        x-load git: update to 1.5.0
>        u-boot git: remove duplicate filesdir line
> 
> Martin Jansa (1):
>        mc: add RRECOMMENDed mc-skins package and more files to FILES_PN
> 
> Roger Monk (6):
>        u-boot-git: Add omap4430-panda to u-boot git recipe
>        omap4430-panda: Prefer u-boot-git and remove extra custom x-load
>        gst-plugins-good: update to 0.10.28
>        ti-gst-ducati: Update to latest SRCREV, package libs
>        ti-libdce: Update to latest SRCREV
>        omapfbplay: Add patch for dce codec error handling
> 
> Siddharth Heroor (4):
>        TI IPC: Fix License field.
>        TI IPC: Add missing dependencies
>        TI IPC: Add version 1.22.04.25
>        TI XDCTools: Add version 3.20.08.88
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance-pr6
> 
> This is pull request #5 minus the libnl changes, but with some omap4
> updates added.
> 
> The libnl changes will follow a bit later.
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

iQEcBAEBAgAGBQJNj1jIAAoJEI4NMjfc3nJx3+4H/jkWwWzSVphNzkugxq5fL1Tt
m3Qg9j9A0xkLMtjMJD/5tXLwA8UR+n6ZXIm5uFzQSmKm/rlf0ruiSLNd+GEUierG
IqOgH2CjpVSBjFGubLKh3VlT7mtv68LZrHNIHh8bLYh/QitBpO+r9qINbppJJEe+
v17G10DeX6ptDFMIoq0u+woQH+Y7yw4ab0NdCr0GpL1t8Ibo1Y0yICUgx7DKY7ag
TGCvQSTmDxmbkDPTtyC6d/Wl3headNKQY8rvMA1ZOISc/Jl3W5vMuAQ3gtz9k+f4
r/WhgNM8KoapVnlNqX9ZGsziWwqcFSjPFVoIw+cIKUHdRhUUPyup8k+b8B8MS4A=
=IiaH
-----END PGP SIGNATURE-----


