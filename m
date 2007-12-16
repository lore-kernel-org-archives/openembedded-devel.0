Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3qMA-0000t7-Ms
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 11:04:22 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1077108fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 01:59:40 -0800 (PST)
Received: by 10.86.50.8 with SMTP id x8mr5151464fgx.25.1197799180426;
	Sun, 16 Dec 2007 01:59:40 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id v23sm15528736fkd.2007.12.16.01.59.38
	(version=SSLv3 cipher=OTHER); Sun, 16 Dec 2007 01:59:39 -0800 (PST)
Date: Sun, 16 Dec 2007 12:04:59 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1323505412.20071216120459@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4764EDFB.9000801@whitby.id.au>
References: <4764EDFB.9000801@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [ANN] New 'base-image' created (Was: [RFC] Add ipkg to minimal image)
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
X-List-Received-Date: Sun, 16 Dec 2007 10:04:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Sunday, December 16, 2007, 11:20:59 AM, you wrote:

> Based on the good discussion and constructive feedback related to my RFC
> about adding ipkg to minimal image, I have decided to create a new
> image, whose name truly reflects it's intention.

> I hereby name 'base-image' as the smallest possible image which allows
> you to ssh into a device via it's native network interface, and install
> packages from feeds across the network into internal flash or onto an
> attached storage device.

  Great news!

[]

> It is required to always be small enough to fit in the internal flash of
> an NSLU2 (as an example of the smaller end of flash sizes that OE
> supports).

  So, how little size did you achieve? I wonder, if we'd finally be able
to put kiddy distros like this: http://midge.vlad.org.ua/wiki/ (didn't
merge even with OpenWRT AFAIK) to rest ;-).

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



