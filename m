Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObG7F-0002qu-6F for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 18:56:26 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObG77-000129-5d for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 18:56:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 18:56:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 18:56:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 18:56:06 +0200
Message-ID: <i24kf7$3d3$1@dough.gmane.org>
References: <20100709204055.GA12163@excalibur.local>	<20100720070108.GE1512@excalibur.local>	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100720084026.GI1512@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 20 Jul 2010 16:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-07-10 10:40, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-07-20 at 10:09, Koen Kooi wrote:
>> On 20-07-10 09:01, Stefan Schmidt wrote:
>>>
>>> From the silence on this topic I gather that the interest to create a new branch
>>> or change the process is quite low.
>>
>> I have an interest in a new stable branch, but no interest in changing
>> the process.
> 
> Fair enough. Lets handle the issues seperately for now.
> 
>> The biggest problem is the .dev is halfway into big changes, e.g.
>> halfway into new-style staging,
> 
> Agreed. While I think we are more then halfway through with this. Recipes are
> left but most of the active maintained are already done. NO numbers but my
> feeling here.
> 
>> halfway into packaged-staging rework, halfway into nativesdk, etc.
> 
> These both are ongoing for quite some time already. I have to admit that I lost
> track where they stand and what is still outstanding.
> 
> So your suggestion is to wait until all three are done?

'Wait' is maybe the wrong word. I would try to do a call to arms to get
more people interested into getting this done. I had hoped that the TSC
would be more vocal about this, but we must do with the cards dealt.

And of course the number of people screaming for a stable branch is an
order of magnitude larger than the number of people that end up actually
supporting it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRdUmMkyGM64RGpERAmlcAJ0TbmzdYV6Z8p+FdtCP1jwXWOdIowCfbEJ9
8Zyd7nsYgEZZfj2daMq+EdI=
=gEzx
-----END PGP SIGNATURE-----



