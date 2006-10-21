Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gb5Td-0006wv-2o
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Oct 2006 03:16:41 +0200
Received: by nf-out-0910.google.com with SMTP id l23so1618955nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 18:09:29 -0700 (PDT)
Received: by 10.49.36.6 with SMTP id o6mr1491513nfj;
	Fri, 20 Oct 2006 18:09:28 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id y23sm3057265nfb.2006.10.20.18.09.28;
	Fri, 20 Oct 2006 18:09:28 -0700 (PDT)
Date: Sat, 21 Oct 2006 04:09:28 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <279597185.20061021040928@gmail.com>
To: Justin Patrin <openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0610201741t6bb6120dr7e7fabd23e56b432@mail.gmail.com>
References: <595433076.20061021003331@gmail.com>
	<432beae0610201458l1bde9ca8v7877a6964e94e710@mail.gmail.com>
	<1161383956.6639.84.camel@localhost.localdomain>
	<432beae0610201741t6bb6120dr7e7fabd23e56b432@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 01:16:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Justin,

Saturday, October 21, 2006, 3:41:23 AM, you wrote:

> On 10/20/06, Richard Purdie <rpurdie@rpsys.net> wrote:
>> On Fri, 2006-10-20 at 14:58 -0700, Justin Patrin wrote:
>> > What exactly are you referring to? Which distributed files? OE doesn't
>> > really distribute anything but an OE db and that's one-time downloaded
>> > when starting.
>> >
>> > If you mean the images distributed from OE, that's a distribution
>> > choice and OZ in particular can't just make the choice to switch
>> > without adding a static binary of bzip2 (for flashing) and changing
>> > its flashing script.
>>
>> I think Paul means things other people distribute i.e. packages
>> referenced in SRC_URIs. He's suggesting we prefer bz2 over gz given a
>> choice which seems like a good idea.
>>

> Oh, is *that* what he meant... Yeah, that's a good idea. ;-)

  Sorry, my English skills might deteriorate towards midnight ;-)
Actually, jsut wanted to commit, asked Koen, he suggested post RFC to
list, hence the rambling... ;-)




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



