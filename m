Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9EgP-0003FT-0b for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 12:17:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9Efk-0000RK-NA for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 12:16:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 12:16:28 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 12:16:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 22 Oct 2010 12:16:19 +0200
Message-ID: <i9ro9j$jb2$1@dough.gmane.org>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>	<i9rbsq$tad$1@dough.gmane.org>
	<20101022065559.GC3527@jama>	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>	<20101022084301.GD3527@jama>
	<AANLkTin82vWmqN0r=-QZ_Y3m=tAkfd1+N3rVRfFMW9T0@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTin82vWmqN0r=-QZ_Y3m=tAkfd1+N3rVRfFMW9T0@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork cleanup call
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
X-List-Received-Date: Fri, 22 Oct 2010 10:17:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-10-10 11:15, Frans Meulenbroeks wrote:
> 2010/10/22 Martin Jansa <martin.jansa@gmail.com>:
>> On Fri, Oct 22, 2010 at 09:32:19AM +0200, Frans Meulenbroeks wrote:
>>> Nice ideas, but....
>>>
>>> As far as I see it there are two often occurring situations:
>>>
>>> - a patch is submitted for review and gets zero feedback. I have quite
>>> a few of these in patchwork. I once proposed that if a patch does not
>>> get neg feedback in two weeks or so it could be pushed anyway. While
>>> this got some positive response it was never really made a policy. But
>>> I must say I'm becoming more and more inclined to push them anyway.
>>
>> Maybe it's not written as policy but as koen said, send ping and if
>> still no reply then probably nobody cares it being pushed (so you can
>> push it).
>>
>>> - a patch is submitted by someone without commit access but no one
>>> picks up the patch.
>>
>> ping stating that author has not commit access would be nice
>>
>>> In either case if patches just get archived without being looked at,
>>> it'll probably have an adverse effects.
>>
>> Agreed
>>
>>> But we of course still have the problems that
>>> - people nak recipes but do not update patchwork
>>> - patches receive improvement suggestions and are not updated in patchwork
>>> - new versions are posted but patchwork is not updated.
>>
>> All 3 cases seems like author fault, sometimes I've contacted author for
>> patch update and never received reply :/.
>>
> 
> Guess we should make all these things more explict in the policy (I
> think there is a page how to submit patches or so).
> 
> BTW: wrt the ack suggestion from koen:
> 
> I feel it is silly to ack my own patch.

You ping your own patches
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwWRzMkyGM64RGpERArNnAJ9XB4aP938QOrinKBdvC8QTYwEc2ACgrNXR
0ssXMRYVQHUqRUJ+hKuwkyw=
=qj4R
-----END PGP SIGNATURE-----



