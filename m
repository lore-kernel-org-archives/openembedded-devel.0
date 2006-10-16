Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GZa21-0007b4-Dv
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 23:29:57 +0200
Received: by nf-out-0910.google.com with SMTP id l23so41233nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 14:23:09 -0700 (PDT)
Received: by 10.49.93.13 with SMTP id v13mr267041nfl;
	Mon, 16 Oct 2006 14:23:09 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id m16sm372322nfc.2006.10.16.14.23.08;
	Mon, 16 Oct 2006 14:23:08 -0700 (PDT)
Date: Tue, 17 Oct 2006 00:23:11 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <299122878.20061017002311@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <4533C686.8020600@dominion.kabel.utwente.nl>
References: <1810005940.20061016180005@gmail.com>
	<1161020143.1649.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<4533C686.8020600@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Annotate machines with amount of RAM
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
X-List-Received-Date: Mon, 16 Oct 2006 21:29:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, October 16, 2006, 8:51:02 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Michael 'Mickey' Lauer schreef:

>> Which features do we need to describe? At first glance, I could think
>> about
>> 
>> VOLATILE_STORAGE_SIZE (RAM)
>> NON_VOLATILE_STORAGE_SIZE (Flash, HD, etc.)
>> DISPLAY_TYPE (Touchscreen or not)
>> DISPLAY_RESOLUTION

> and please let us not fall in to the same trap over and over again by ignoring DPI. My
> a780 and h2200 are both qvga, but it's 100dpi versus 160dpi, which makes a huge difference.

  Still, exact pixel resolution is primary thing from the software
point fo view ;-). But I guess, current GUI_MACHINE_CLASS indeed may
survive some more time.

>> 
>> We shouldn't stop here. With several groups working on device daemon
>> standards towards interoperable platforms, it could make sense to
>> describe
>> 
>> INPUT_METHODS
>> 
>> as well (buttons, keyboard, touchscreen, microphone).

> MACHINE_FEATURES = "keyboard" exists :)

  touchscreen, too. But "buttons" and "microphone" would be nice
additions.

>> 
>> Last but not least GSM and (A)GPS should make its way into
>> MACHINE_FEATURES pretty soon as well...

> Right, I nuked smartphone-common.conf today and I was thinking how to funnel it into
> task-base :)

  Well, I'd say, the benefits of task-base are now pretty visible!

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



