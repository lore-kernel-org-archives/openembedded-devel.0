Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpNHM-0004rc-12 for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 17:25:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpNGs-0004Op-LR for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 17:24:42 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 17:24:42 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 17:24:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 28 Aug 2010 17:24:34 +0200
Message-ID: <i5b9ni$qra$1@dough.gmane.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>	<i5b7mm$iso$1@dough.gmane.org>
	<AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 28 Aug 2010 15:25:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-08-10 16:55, Chris Larson wrote:
> On Sat, Aug 28, 2010 at 7:49 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> 
>> As usual you're completely ignoring the impact of this when using
>> package management, which is probably why you still are clueless why
>> your openssl fiasco is so much work to fix for distro maintainers.
> 
> 
> If someone is missing something, then explain it to them.  Whining and
> calling people clueless does absolutely nothing for the project but alienate
> developers.  If you need to take out your frustration, buy a punching bag,
> don't do it on the mailing list, please.

And Chris, you don't have much right to say anything about this, since I
raised my frustration with all this to the TSC almost two weeks ago, and
I have only heard from Holger something and like "I haven't followed OE
the past months".
I haven't heard anything else, so keep getting more and more frustrated
by frans moving goal posts ("ack or nak", "nak with explanation" "only
naks from flawless maintainers") with the TSC doing seemingly nothing.

I do *not* have the time to read oe-devel daily, nor to do proper test
builds within a day. Especially not with the current mega patches posted
for review. I must admit that them being posted for review is an
improvement, but by the looks of it the respective maintainers don't get
a say since they aren't doing a perfect job.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMeSoyMkyGM64RGpERAoVtAKCL+pF8wx34pS6hSi/+HtA3vXwNSQCeMhgi
dR0qTSGHVO3iokRIYAd1FnU=
=YA8h
-----END PGP SIGNATURE-----



