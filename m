Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9JAJ-0006Ji-BW for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 17:04:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9J9g-0000zp-5E for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 17:03:40 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:03:40 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:03:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 22 Oct 2010 16:59:57 +0200
Message-ID: <i9s8td$e2$2@dough.gmane.org>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=pk+WvkmaAmGaauq=ArSs7KoCN+t3QFUYba_1f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTi=pk+WvkmaAmGaauq=ArSs7KoCN+t3QFUYba_1f@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] libtool: Rename --with-sysroot to --with-libtool-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 15:04:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-10-10 16:50, Chris Larson wrote:
> On Thu, Oct 21, 2010 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> * To avoid name conflict with binutils and gcc we rename the option
>> * We also stage the cross and native libtool in same relative path
>>  so it can be accessed equally well from recipes using BBCLASSEXTEND =
>> "native"
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
> 
> I'm going to assume you've got the code end of things down, and not bother
> reviewing it in depth, as I'm no libtool code expert, but you have my ack
> for the concept :)
> 
> Acked-by: Chris Larson <chris_larson@mentor.com>

What Chris said :)

For the complete series:

Acked-by: Koen Kooi <k-kooi@ti.com>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwabtMkyGM64RGpERAhBqAKCbjaVmSKnXQSnVWKhFPRsEr8H9UwCfUw0Y
dMBKvOtN/Mp/CxPcRODKMnU=
=E4vz
-----END PGP SIGNATURE-----



