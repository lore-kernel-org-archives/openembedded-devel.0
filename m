Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngn94-0003pS-TE for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 23:40:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngn6Z-0007TX-HC for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 23:38:19 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 23:38:19 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 23:38:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 14 Feb 2010 23:37:58 +0100
Message-ID: <hl9u05$48d$1@ger.gmane.org>
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
	<4B787A24.9010200@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <4B787A24.9010200@kernelconcepts.de>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc:
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
X-List-Received-Date: Sun, 14 Feb 2010 22:40:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-02-10 23:33, Florian Boor wrote:
> Hi,
> 
> Thomas Zimmermann schrieb:
>> * ldd has shebang #!/bin/bash: so add bash RDEPNDS
> 
> last time I checked it worked with the Busybox built-in shell as well. I wonder
> if it would be a good idea to verify this and patch ldd for our purposes.

like this:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/glibc/glibc-2.4/ldd-unbash.patch
?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLeHtGMkyGM64RGpERAh6qAKCWso8PlsudZmYBWHY5xR9KyWxYWQCfdHTf
5P8Zv9JKV8DLJzC29+nqh3E=
=uFhP
-----END PGP SIGNATURE-----



