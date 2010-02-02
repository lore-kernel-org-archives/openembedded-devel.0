Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcKGZ-0003Kj-MB for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 16:02:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcKCh-0004yD-9N for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 15:58:11 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2010 15:58:11 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2010 15:58:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Feb 2010 15:50:31 +0100
Message-ID: <hk9e3m$3t2$1@ger.gmane.org>
References: <1265103507.19185.8.camel@balakrishnan-desktop>	<201002021059.52148.holger+oe@freyther.de>
	<4B682AEC.7000607@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100114 Shredder/3.0.2pre
In-Reply-To: <4B682AEC.7000607@balister.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] regulus: Adding pxa270 based machine
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
X-List-Received-Date: Tue, 02 Feb 2010 15:02:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-02-10 14:38, Philip Balister wrote:
> On 02/02/2010 04:59 AM, Holger Hans Peter Freyther wrote:
>> On Tuesday 02 February 2010 10:38:27 balakrishnan wrote:
>>> Dear OE,
>>>         I have mailed four patches to OE dev list on last month
>>> regarding
>>> "pxa270 based machine" inclusion in OE(stable/2009). Can I have status
>>> of my patches?
>>
>> Two things,
>> I think one of the stable/2009 rules is that it needs to be in dev
>> first and
>> will be backported then. So you would have to prepare your changes to
>> .dev and
>> then ask for stable review.
> 
> I don't thinnk that is a hard rule,

It still is, about people keep mistakingly interpreting it as "the exact
commit needs to be in .dev". Having fixes in stable/2009 that are not in
.dev is madness, we learned that lesson the hard way with the old ozfam
branches.

> especially since you can now commit
> stuff to dev that will not work in stable.

See above.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLaDu3MkyGM64RGpERApTdAJ9X5VBt5itg/OqX52F9fvZ50lflgACgq1as
4Zl6xCsFp1nl1keXPylUG/c=
=a8Yj
-----END PGP SIGNATURE-----



