Received: from [209.85.134.184] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4bF4-000563-0X
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 13:08:10 +0100
Received: by mu-out-0910.google.com with SMTP id w8so3702207mue.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 04:03:15 -0800 (PST)
Received: by 10.86.70.8 with SMTP id s8mr7560690fga.29.1197979395368;
	Tue, 18 Dec 2007 04:03:15 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id f31sm19188715fkf.2007.12.18.04.03.11
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2007 04:03:14 -0800 (PST)
Date: Tue, 18 Dec 2007 13:35:00 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <978793792.20071218133500@gmail.com>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
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
X-List-Received-Date: Tue, 18 Dec 2007 12:08:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello pHilipp,

Tuesday, December 18, 2007, 12:17:27 PM, you wrote:

> On Dec 18, 2007 3:47 AM, pfalcon commit
> <openembedded-commits@lists.openembedded.org> wrote:
>> PDA-like machines with card slots: Enable "vfat" feature.
>> * FAT-formatted cards are commodity, it's expectable them to be supported OOB.

> A machine feature "vfat" sounds strange. I think machine features
> should be about the hardware capabilities.

  Yep, with this common sense in mind I quickly replied to Rod that
introducing it wouldn't help with "bloating" issue. Well, it instead
COMBINED feature.

>  Unfortunately I don't have
> a proposal for a good name, but I'd prefer something like "cardslot"
> or some better generic term for SD/CF/MemoryStick/etc. capability.
> Then the distro can decide whether that means to add vfat support or
> ext2 or gnome-volume-manager or some fancy card formatting GUI app.

  It's of course not about just name, but about feature processing
logic. Current COMBINED_FEATURES mechanism is at least very easy to
understand and provides great deal of detailed flexibility.

> regards
> Philipp

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



