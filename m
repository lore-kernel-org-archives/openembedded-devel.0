Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Obg3y-0001Y7-38
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 22:38:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id E2B732C7F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 20:34:06 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMBEzYsOVlzB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 20:34:02 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 221F72C7E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 20:34:01 +0000 (UTC)
Message-ID: <4C475AC4.6010302@gmail.com>
Date: Wed, 21 Jul 2010 22:38:28 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4704CB.2010204@gmail.com> <i275t3$65g$1@dough.gmane.org>
In-Reply-To: <i275t3$65g$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg : angstrom fails console-image build
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
X-List-Received-Date: Wed, 21 Jul 2010 20:38:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto, Il 21/07/2010 18:05:
> On 21-07-10 16:31, Marco Cavallini wrote:
>> Anybody could explain what's happening with opkg in OE recently please?
>> I saw a patch in ML and I wonder if it will be pushed in order to solve
>> this problem.
> 
>>  http://pastebin.com/NhtAP0Re
> 
> It looks like you have a local diff to install 'opkg' as well as
> 'opkg-nogpg-nocurl', which breaks. Solution: remove your local diff.

Thank you for answering.

I'm sorry but I dont' understand what do you mean with "local diff", I'm
using a clean OE org.openembedded.dev branch.

TIA

/marco



