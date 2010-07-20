Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObHly-0006Wr-3K for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:42:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObHlm-0000WA-Mk for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:42:22 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 20:42:22 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 20:42:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 20:42:10 +0200
Message-ID: <i24qm2$qc6$1@dough.gmane.org>
References: <20100709204055.GA12163@excalibur.local>	<20100720070108.GE1512@excalibur.local>	<i23lkm$ftn$1@dough.gmane.org>	<20100720084026.GI1512@excalibur.local>	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100720173425.GL1512@excalibur.local>
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
X-List-Received-Date: Tue, 20 Jul 2010 18:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-07-10 19:34, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
>> On 20-07-10 10:40, Stefan Schmidt wrote:
>>>
>>> So your suggestion is to wait until all three are done?
>>
>> 'Wait' is maybe the wrong word. I would try to do a call to arms to get
>> more people interested into getting this done.
> 
> Wasn't there a list produced with all recipes that used legacy staging? I swear
> I have seen something like this but I can't find it in my recent builds.

In your TMPDIR:

koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq | wc -l
53

It includes beasts like perl and python.

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRe4CMkyGM64RGpERAv89AJ9jHvcsxzDIQAYNIHbJR1IWV3PlDACeNYn2
qVizRtaDD5OWWKuSSRb5RcY=
=Q4uM
-----END PGP SIGNATURE-----



