Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObJtS-0008EN-Vp for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 22:58:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObJtK-0005kG-Ex for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 22:58:18 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 22:58:18 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 22:58:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 22:58:09 +0200
Message-ID: <i252l1$npj$1@dough.gmane.org>
References: <20100709204055.GA12163@excalibur.local>	<20100720070108.GE1512@excalibur.local>	<i23lkm$ftn$1@dough.gmane.org>	<20100720084026.GI1512@excalibur.local>	<i24kf7$3d3$1@dough.gmane.org>	<20100720173425.GL1512@excalibur.local>	<i24qm2$qc6$1@dough.gmane.org>
	<4C45F5FF.3010106@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C45F5FF.3010106@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 20:58:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-07-10 21:16, Tom Rini wrote:
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 20-07-10 19:34, Stefan Schmidt wrote:
>>> Hello.
>>>
>>> On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
>>>> On 20-07-10 10:40, Stefan Schmidt wrote:
>>>>> So your suggestion is to wait until all three are done?
>>>> 'Wait' is maybe the wrong word. I would try to do a call to arms to get
>>>> more people interested into getting this done.
>>> Wasn't there a list produced with all recipes that used legacy
>>> staging? I swear
>>> I have seen something like this but I can't find it in my recent builds.
>>
>> In your TMPDIR:
>>
>> koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq |
>> wc -l
>> 53
>>
>> It includes beasts like perl and python.
> 
> perl yes, python no.  Overall point, yes.
> 

Mine lists:

/OE/org.openembedded.dev/recipes/perl/perl_5.8.8.bb
/OE/org.openembedded.dev/recipes/python/python_2.6.4.bb

And that's from a rebuild from scratch last week.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRg3hMkyGM64RGpERAu2OAKCsIiUFeNEVUZkqBKLP9TKO9yW3eACfQ2rx
ZTxsG0zc2k5hnjkwwDVwiAo=
=Yjad
-----END PGP SIGNATURE-----



