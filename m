Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5via-0002Ng-LY for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:25:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5vi9-00085q-Q3 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:25:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 09:25:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 09:25:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Oct 2010 09:25:09 +0200
Message-ID: <i93msl$hc9$1@dough.gmane.org>
References: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>	<AANLkTinMcWBJG3WprZVTw038rMfO4pjNcyre-Bg3ZhMi@mail.gmail.com>
	<20101013071227.GD3549@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <20101013071227.GD3549@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 13 Oct 2010 07:25:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-10-10 09:12, Martin Jansa wrote:
> On Wed, Oct 13, 2010 at 08:59:40AM +0200, Frans Meulenbroeks wrote:
>> 2010/10/13 Khem Raj <raj.khem@gmail.com>:
>>> * This was done generically in bitbake.conf this should be done on
>>>  demand and distutils based recipes seem to need it. So we define it
>>>  here.
>>
>> Based on your commit message I expected a change in bitbake.conf too.
>> Am I mssing something here?
> 
> That changes was already commited and it's used only for
> LIBTOOL_HAS_SYSROOT.
> 
> This is fixing build of all python recipes using distutils.

Like python-pycairo :)

> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtV7VMkyGM64RGpERAskFAJsGk14QZJ3gKvF31B/RGuj+m+mfmwCgkwXv
XIgRylC4P5QyccgD+SdY/Do=
=vkru
-----END PGP SIGNATURE-----



