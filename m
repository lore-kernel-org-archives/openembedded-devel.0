Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC9MX-0004ur-36 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:44:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC9KD-0003Lv-5n for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:42:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:42:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:42:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 13:42:20 +0200
Message-ID: <iojses$p5q$1@dough.gmane.org>
References: <cover.1303154850.git.michael.lippautz@gmail.com>	<iojkcv$aka$1@dough.gmane.org>
	<BANLkTi=Qxc2p2FMrTuA_UcRbGEm0rkUSbA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTi=Qxc2p2FMrTuA_UcRbGEm0rkUSbA@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [oe-meta 0/2] pull request: vim, wget
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
X-List-Received-Date: Tue, 19 Apr 2011 11:44:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 11:42, Michael Lippautz wrote:
> 2011/4/19 Koen Kooi <koen@dominion.thruhere.net>:
> On 18-04-11 21:32, Michael Lippautz wrote:
>>>> Re-import of vim/gvim/vim-tiny and wget.
>>>>
>>>> * Clean vim recipe and update to 7.2.446 (446=patchset)
>>>> * Clean wget (ssl check using staging_dir)
>>>>
>>>> Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
>>>>   Branch: master
>>>>   Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/master
> 
> merged, thanks
> 
>> Thanks for correcting the space escape ...
> 
>> I also didn't know that meta-oe doesn't care about distro overrides anymore.

All distro overrides should be done in their respective layer (e.g.
meta-angstrom, meta-shr). Just like machine overrides should be done in
their respective layers.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrXUcMkyGM64RGpERAgwzAJ4yuuPnc2hhGLDYYdsxFdDs4tlpfQCffBj+
Ly1EwHhJQovVAvb0yIiG9a0=
=PE5X
-----END PGP SIGNATURE-----



