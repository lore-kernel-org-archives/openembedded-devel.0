Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1G01-0000FB-6F for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 14:13:29 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1FoW-0004F4-EA for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 14:01:36 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 14:01:36 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 14:01:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Aug 2012 14:01:20 +0200
Message-ID: <k0deme$loo$1@dough.gmane.org>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
	<k0d7ai$odu$1@dough.gmane.org>
	<11ACFBF2-567C-4A7C-85B8-620806B8DF07@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <11ACFBF2-567C-4A7C-85B8-620806B8DF07@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 12:13:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-08-12 12:08, Elvis Dowson schreef:
> Hi,
> 
> On Aug 14, 2012, at 1:55 PM, Koen Kooi wrote:
> 
>> Op 13-08-12 22:28, Elvis Dowson schreef:
>>> Hi, I've created a set of patches to add retired toolchain support
>>> for gcc-4.5.1, to the meta-openembedded/toolchain-layer.
>> 
>> Given that  4.5.x was deleted from meta-toolchain 3 months ago[1],
>> what's the rationale for adding it back? It's still available in the
>> denzil branch, so unless someone steps up to maintain it I'm inclined
>> to say "no" to patches bringing it back in the master branch.
> 
> The gcc-4.5 recipe was adapted from the gcc-4.5.1 recipe from the denzil
> branch.

The meta-toolchain denzil branch had 4.5.4

> 
> The structure of the newer gcc-4.7 recipes in the current poky/master
> branch are

What is 'poky'?

> a bit different from the older recipes in the denzil branch. So, while
> developing the gcc-4.5 recipes, I started with the existing gcc-4.7
> templates, and looked at the gcc-4.6 recipes in the current
> meta-openembedded/toolchain-layer and incorporated all the patches for
> gcc-4.5.1 from the denzil branch.

Again, the meta-toolchain denzil branch had 4.5.4

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQKj4QMkyGM64RGpERAvqiAKCD6f2RTmgqcDepvcAxrjR9ZjTX5gCgnYqC
uEfmHg6ygdu5WcN7BRbou+U=
=R3nT
-----END PGP SIGNATURE-----



