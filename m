Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr8pS-0001nF-Jg for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 12:51:28 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr8mY-00040C-JT for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 12:48:26 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 12:48:26 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 12:48:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 12:48:15 +0100
Message-ID: <hnl6pv$p5g$1@dough.gmane.org>
References: <201003150605.03085.holger+oe@freyther.de>	<hnl2sg$ar6$1@dough.gmane.org>
	<201003151200.28221.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <201003151200.28221.holger+oe@freyther.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for help to address known security issues
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
X-List-Received-Date: Mon, 15 Mar 2010 11:51:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 12:00, Holger Hans Peter Freyther wrote:
> On Monday 15 March 2010 11:41:20 Koen Kooi wrote:
>> On 15-03-10 06:05, Holger Hans Peter Freyther wrote:
>>> Hi all,
>>>
>>> the following OE packages seem to be vulnerable to known security issues
>>> and I would like to get some help in updating these....
>>>
>>> wget 1.9.1: http://www.FreeBSD.org/ports/portaudit/06f142ff-4df3-11d9-
>>> a9e7-0001020eed82.html
>>
>> Wget 1.11.x is in OE already, should be schedule 1.9.x for deletion?
> 
> yes, but we default to 1.9.x. If you could make angstrom use 1.11 or remove 
> the default preference of -1 from the wget recipe that would be awesome.

angstrom is now using 1.11.4

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnh5/MkyGM64RGpERAkS8AJ9zn6S3sL5LnjGLqSU0yLNHM3+iigCgiZyN
UKecxxpsdA9XLRBa/U1CvkI=
=700W
-----END PGP SIGNATURE-----



