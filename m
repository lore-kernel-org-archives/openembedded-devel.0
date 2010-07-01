Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUFdn-0002yZ-7N for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 11:01:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUFZD-0006Fg-JS for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 10:56:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 10:56:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 10:56:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 01 Jul 2010 10:56:11 +0200
Message-ID: <i0hl7b$8uu$1@dough.gmane.org>
References: <4C0F9119.3000909@freyther.de>
	<4C2B1BC4.2030808@freyther.de>	<i0f8ct$acp$1@dough.gmane.org>
	<4C2B446A.5040301@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C2B446A.5040301@freyther.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Thu, 01 Jul 2010 09:01:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-06-10 15:19, Holger Freyther wrote:

> In regard to the TSC, what mode of operation do you propose? We freeze
> the tree until all items are implemented in the order they are proposed?
> We find people driving a topic?

In this specific case you (or the TSC) choose to work on a extremely
intrusive and controversial *cosmetic* change first instead of tackling
the some of the (IMO more important) items agreed on earlier:

* making QA checks be enabled by default
* promoting new style staging and converting existing recipes
* promoting bbclassextend and converting existing recipes
* fixing nativesdk

By skipping over those, without saying why and going for the cosmetic
change the TSC is sending out a signal that they do NOT care about
quality, only appearance. In the past I was proud about how OE handled
things by the things you yourself created, like insane.bbclass, the
first edition of tinderbox, etc. But recently only 2 groups of OE
developers seem to care about quality, the SHR and angstrom folk. Those
are the only 2 distros that have the QA checks enabled. Due to the
nature of OE other benefit from the awesome work Martin and Khem have
been doing, but it feels a bit one sided to me.

Since nearly all OE developers can't work fulltime on OE, I would
propose that the TSC sends out a few "call to action" mails, describing
the tasks that need doing and some guidance on how they want to see it
done. I will *gladly* help out, but I need to know what needs doing and
avoid duplicate work.

It would help to have a "completed action items", "in progress action
items" and "action items that noone is working on" list in the TSC
minutes (or wiki) to keep track of stuff.

And of course a big thank you to all the people working on QA that I
didn't mention.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMLFgrMkyGM64RGpERAtCVAJ4xp7Lxx91AwSUN7DgEwxasSjr4gACgi2/n
qbbTDqsfC2RlFjxhRglNtZ4=
=zIjM
-----END PGP SIGNATURE-----



