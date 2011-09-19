Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5ehK-0007kL-AU for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 16:19:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5ecD-0005B6-IY for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 16:14:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 16:14:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 16:14:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 16:14:15 +0200
Message-ID: <j57inn$mme$1@dough.gmane.org>
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
	<j56n5t$s0d$2@dough.gmane.org> <j57i4p$i51$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <j57i4p$i51$1@dough.gmane.org>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Mon, 19 Sep 2011 14:19:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-09-11 16:03, Dmitry Eremin-Solenikov schreef:
> On 09/19/2011 10:23 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 19-09-11 00:13, Dmitry Eremin-Solenikov schreef:
>>> Include more dependencies into openssl-fix-link.patch patch.
>>> 
>>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>  --- 
>>> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22 
>>> +++++++++++-------- 
>>> .../recipes-connectivity/openssl/openssl_1.0.0e.bb | 2 +- 2 files 
>>> changed, 14 insertions(+), 10 deletions(-)
>> 
>> 
>> I still get: NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: 
>> Failed
> 
> Strange. Please check: md5sum 
> sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
>
> 
03c99586e59ea5a25e0598c7419d8aff
> sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
>
> 
koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ md5sum
recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
03c99586e59ea5a25e0598c7419d8aff
recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOd043MkyGM64RGpERAnKnAJwJMqWQhqhqLYRycKAmkAwzOvMHoACeP2Xm
F2AqsDz4e8AzU6FRz5po5Fk=
=Snrw
-----END PGP SIGNATURE-----



