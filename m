Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWmWm-0001XZ-CB for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 10:32:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWmRv-0001DO-Nw for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 10:27:15 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 10:27:15 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 10:27:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 Jul 2010 10:27:07 +0200
Message-ID: <i1424s$4s4$1@dough.gmane.org>
References: <1278509965-32664-1-git-send-email-heinold@inf.fu-berlin.de>	<AANLkTilK-hX_hPWqDp04sCTV3WiFTPL3ojHL3Jyc6CXX@mail.gmail.com>
	<20100708065736.GA5242@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100708065736.GA5242@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: add support for builtin gcc-atomics for gcc-4.3.x versions
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
X-List-Received-Date: Thu, 08 Jul 2010 08:32:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-07-10 08:57, Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2010-07-07 at 17:40, Khem Raj wrote:
>> On Wed, Jul 7, 2010 at 6:39 AM,  <heinold@inf.fu-berlin.de> wrote:
>>> From: Henning Heinold <heinold@inf.fu-berlin.de>
>>>
>>> * bump all INC_PR's
>>>
>>> this are the promised patches for gcc-4.3.x series, which fixes
>>> the atomic stuff and therefore make it able to build
>>> llvm multithreaded.
>>>
>>> Signed-off-by: Henning Heinold <h.heinold@tarent.de>
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Acked-by: Stefan Schmidt <stefan@buglabs.net>

A quick test shows no problems here, so:

Acked-by: Koen Kooi <k-kooi@ti.com>

Can we get this in today?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMNYvbMkyGM64RGpERAtdNAKCqsvfdM2cdXKMp7k2mnJDOGmmI3QCgqtC2
QJni0s/KZRPezgZCS1Jx+aM=
=aoSO
-----END PGP SIGNATURE-----



