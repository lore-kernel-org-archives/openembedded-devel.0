Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4b9H-0001Un-6n for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 17:15:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4b8v-0001JX-VS for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 17:15:25 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 17:15:25 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 17:15:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 09 Oct 2010 17:15:17 +0200
Message-ID: <i8q0u5$2t8$1@dough.gmane.org>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>	<i8jufe$299$1@dough.gmane.org>	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>	<AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>	<20101009113707.GP3163@jama>
	<AANLkTim_=Bg0mP+QjTWfvkdQ-+Xrp86fjg8sq8=bZ4=v@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTim_=Bg0mP+QjTWfvkdQ-+Xrp86fjg8sq8=bZ4=v@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Sat, 09 Oct 2010 15:15:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

You can add:

Acked-by: Koen Kooi <k-kooi@ti.com>

to all the patches in this series

On 09-10-10 16:31, Khem Raj wrote:
> On Sat, Oct 9, 2010 at 4:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Fri, Oct 08, 2010 at 03:21:03PM -0700, Chris Larson wrote:
>>>> Personally I'm in favour of merging into head. That way it gets
>>>> accepted easier and faster.
>>>>
>>>
>>> Agreed, I am as well.  As the new libtool is opt-in, I don't see the harm,
>>> and it'll ensure that any issues which crop up with the compatibility get
>>> fixed asap.
>>
>> Khem: feel free to add
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
> 
> Thanks. Do I have other pseudo acks too in this thread. ?
> btw libtool folks are excited that OE is using the sysroot
> functionality my patch to libtool is being merged
> 
> http://lists.gnu.org/archive/html/libtool-patches/2010-10/msg00022.html
> 
> I am confident that any roadblocks we run into the libtool community
> will help us
> so we are in good spot.
> 
> Thanks
> -Khem
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMsIcFMkyGM64RGpERAmluAKCODuUg1xYz6+6PMJ8FFrmFGB7seQCgvcJZ
byUjDfN8DmnMkcPi8EisuQM=
=i0Hp
-----END PGP SIGNATURE-----



