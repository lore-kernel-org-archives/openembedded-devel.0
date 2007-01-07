Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H3fOu-0004wJ-RG
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 22:17:56 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8453575nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 13:16:22 -0800 (PST)
Received: by 10.49.57.1 with SMTP id j1mr27280527nfk.1168204581892;
	Sun, 07 Jan 2007 13:16:21 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id i1sm23964009nfe.2007.01.07.13.16.21;
	Sun, 07 Jan 2007 13:16:21 -0800 (PST)
Date: Sun, 7 Jan 2007 23:16:32 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1662139633.20070107231632@gmail.com>
To: Patrick Ohly <Patrick.Ohly@gmx.de>
In-Reply-To: <1168200264.15021.54.camel@ip6-localhost>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jan 2007 21:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Patrick,

Sunday, January 7, 2007, 10:04:24 PM, you wrote:

> On So, 2006-12-31 at 10:45 +0100, Koen Kooi wrote:
>> > This is simply because we have no established way of receiving data
>> > through the SCM for merging into trunk without direct write access.
>> As
>> > my other email says, I'd like to find a way of supporting that but
>> its
>> > probably an education issue on both sides.
>> 
>> And the fact that we usually have to tweak 80% if the patches we
>> receive.

> If you do that, can you commit the patch from the original author
> literally on a branch, then apply your own changes which fix it on top
> of the original patch and then merge back into the main trunk? I did an
> experiment and found that this considerably eases the pain for external
> contributors.

[]

> What do you think? Did I miss something?

  Well, why would OE core developers (err, what about non-core
developers - we also care for contributed patches - after all, to get
commit access to OE, you first contribute bunch of patches) - well, why
would they do that? OE is open-source project, there's no position of
"patch processor", and people do what they find useful, leaving some
share of their for patch processing. Any complex and artificial rules
won't work. Just in case, there's always another alternative - contributors
just should submit patches in the perfect form, suitable for merging w/o
tweaks. Obviously, it's just the same not attainable, nor it's really
*that* important - we want people contribute more than either us or them
to follow strict rules.

  Just my IMHO - I'm not a core developer ;-).




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



