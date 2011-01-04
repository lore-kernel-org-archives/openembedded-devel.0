Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pa6hD-0003bx-US for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 14:13:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pa6gt-00037r-9E for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 14:12:43 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 14:12:43 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 14:12:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 04 Jan 2011 14:12:32 +0100
Message-ID: <ifv6c0$pue$1@dough.gmane.org>
References: <20110103210038.GD25803@mx.loc>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110103210038.GD25803@mx.loc>
X-Enigmail-Version: 1.0.1
Subject: Re: .opk packages and rootfs?
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
X-List-Received-Date: Tue, 04 Jan 2011 13:13:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-01-11 22:00, Bernhard Reutner-Fischer wrote:
> Hi,
> 
> As ipkg-utils doesn't download for me anymore i was wondering
> about the status of packaged-staging and how to use it (must be
> documented somewhere, i must be blind or something as i can't seem to
> find it).
> 
> Are there any plans to move to opkg?

Not sure what you are doing, but over here (when using angstrom)
packaged-staging is already using opkg-cl
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNIxzAMkyGM64RGpERArKeAJ4gENfc8f/4c2dKLF+VYYxTK/XKUQCeLMid
XzEDIhxo/Sx0PLaKcRluGKc=
=TIt5
-----END PGP SIGNATURE-----



