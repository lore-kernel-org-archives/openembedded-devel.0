Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSWYT-0007Xu-MA for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 17:17:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSWSC-0006VB-KR for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 17:10:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:10:44 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:10:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 Nov 2011 17:10:30 +0100
Message-ID: <jadt5n$67m$1@dough.gmane.org>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
	<CAFU7RzMM=ur61PsQdBwbG2m9XT4ubCcD8Be4LiiUtFX=js_EhQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CAFU7RzMM=ur61PsQdBwbG2m9XT4ubCcD8Be4LiiUtFX=js_EhQ@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: dm3730
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
X-List-Received-Date: Mon, 21 Nov 2011 16:17:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-11-11 16:38, Raffaele Recalcati schreef:
> Hi,
> 
> On Sat, Nov 19, 2011 at 12:51 PM, Kridner, Jason <jdk@ti.com> wrote:
>> On Nov 19, 2011, at 3:07 AM, "Raffaele Recalcati"
>> <lamiaposta71@gmail.com> wrote:
>> 
>>> I'm sorry for so easy question! It seems that if I compiling for
>>> beagleboard I get a 2.6.39 running also on dm3730 cpu.
>> 
>> I recommend moving on to OE-core and meta-ti if you are doing new
>> development. That is 3.0 > today, but I expect we will bring it in-line
>> with the BeagleBone kernel.
> 
> It's ok. I have the new monster to compile. I have followed
> https://wiki.yoctoproject.org/wiki/OpenEmbedded-Core setup and started,
> without changing anything, a compilation of 'bitbake core-image-minimal',
> to test my setup.
> 
> Waiting it ends can I go on preparing the setup for beagle-xm with GLES
> and gstreamer-ti running?

No, that has no beagleboard support at all, only qemu machines. Worse, if
you follow the offical yocto instructions you'll get only broken and/or
incomplete beagleboard support.

> Is maybe the right starting point 
> https://github.com/koenkooi/Angstrom-integration-layer.git?

How about just going to the angstrom website, clicking on 'developers' and
following those instructions? That's what the README in the meta-ti layers
says you should do.






-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7Kd/QACgkQMkyGM64RGpFMnACfQf8/o4rvpqSN4d775u17wuT0
1R8AnRSZwWTeNCuI3ZdxpAZMnkOL+bO0
=BzrX
-----END PGP SIGNATURE-----



