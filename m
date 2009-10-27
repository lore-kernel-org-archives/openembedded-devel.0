Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2kBQ-0003Ql-Hr for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 12:25:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2kAN-0004Yp-Km
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 12:24:43 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 12:24:43 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 12:24:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Oct 2009 12:24:21 +0100
Message-ID: <hc6l95$fm8$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<hc6f2q$qum$2@ger.gmane.org>
	<200910271150.12530.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910271150.12530.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Tue, 27 Oct 2009 11:25:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-10-09 11:50, Holger Hans Peter Freyther wrote:
> On Tuesday 27 October 2009 10:38:34 Koen Kooi wrote:
>
>> No real discussion on this the past few days, so I pushed my branch into
>> .dev that basically boils down to a revert and fixes the issues raised
>> by Phil.
>
> Thanks a lot. What do you think is still missing?

A check of all output packages for all recipes in OE :)

> I will revert my binutils-
> cross-sdk commit. Is your storage problem with the .a files resolved too?

It largely is now, for the remaining bits changes can be done incrementally.

regards,

Koen



