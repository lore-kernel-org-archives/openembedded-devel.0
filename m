Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np35T-0008DE-7v for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:19:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np2xO-0003mO-R1 for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:10:58 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:10:58 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:10:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Mar 2010 14:58:56 +0100
Message-ID: <hn5k70$3vc$1@dough.gmane.org>
References: <201003082201.30147.roman@khimov.ru>	<1268081324.16526.82.camel@trini-m4400>	<201003090129.19439.roman@khimov.ru>
	<1268091612.16526.110.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268091612.16526.110.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Tue, 09 Mar 2010 17:19:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-03-10 00:40, Tom Rini wrote:
> On Tue, 2010-03-09 at 01:29 +0300, Roman I Khimov wrote:
>> В сообщении от Понедельник 08 марта 2010 23:48:44 автор Tom Rini написал:
>>> On Mon, 2010-03-08 at 22:01 +0300, Roman I Khimov wrote:
>>>> Hello all.
>>>>
>>>> Please take a look at "rik/qemu-0.12" branch on OE git repo. 0.9.x
>>>> removal patch is 0.5 Mb, so I think it's not appropriate for mailing
>>>> list. In general, 0.12.3 addition was easy, but then I've discovered that
>>>> 0.10.3 version is not working on openSUSE 11.2, so there is also a change
>>>> in sanity and proposal to remove 0.10.3 from repository.
>>>>
>>>> Comments are welcome.
>>>
>>> Looks good except maybe we should move to BBCLASSEXTENDS while we're in
>>> here?
>>
>> Sure, an updated version is pushed.
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>
> 

Acked-by: Koen Kooi <koen@openembedded.org>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLllQfMkyGM64RGpERAgR+AJ0YfwJixjPpjNV909BSvDu2xh14mACeNWfM
nuNR9tzrIJGirT87XWO5WxI=
=vL2V
-----END PGP SIGNATURE-----



