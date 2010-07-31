Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Of8hD-00007f-EZ for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 11:49:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Of8go-0004si-Gc for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 11:49:10 +0200
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 11:49:10 +0200
Received: from k.kooi by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 11:49:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 31 Jul 2010 11:48:59 +0200
Message-ID: <i30rie$8aq$1@dough.gmane.org>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Sat, 31 Jul 2010 09:49:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-07-10 07:34, Khem Raj wrote:
> Hi
> 
> Following series of patches are for making multi-machine toolchains co-exist with
> new cross staging for toolchain.
> 
> It installs the toolchain in <native sysroot>/usr/${BASE_PACKAGE_ARCH}
> this way we can have multiple toolchains co-existing for different sub-arches and major arches too.
> 
> I have booted a native-sdk-image on qemuarm successfully. The build for 
> beagleboard minimal image using different versions of toolchain went all fine too.
> 
> Please test these patches and if seem ok provide some ACKS/NACKS

Khem, thanks for working on this!

Firing of a build now :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMU/GLMkyGM64RGpERAgsUAJ9pEYviFZX/DHvDnn5wYGPIpo45NACfZyYx
ieovJk3ReBYIiOcjRfJwy3g=
=YCE/
-----END PGP SIGNATURE-----



