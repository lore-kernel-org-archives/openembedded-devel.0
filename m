Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JGIKJ-0001K2-Px
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2008 19:21:55 +0100
Received: by ug-out-1314.google.com with SMTP id i24so668329ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2008 10:21:56 -0800 (PST)
Received: by 10.67.116.11 with SMTP id t11mr2382152ugm.61.1200766915620;
	Sat, 19 Jan 2008 10:21:55 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id o30sm14515823ugd.84.2008.01.19.10.21.54
	(version=SSLv3 cipher=OTHER); Sat, 19 Jan 2008 10:21:54 -0800 (PST)
Date: Sat, 19 Jan 2008 20:29:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <404027028.20080119202939@gmail.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <fmqnta$9lc$1@ger.gmane.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
	<478F4876.9030405@student.utwente.nl>
	<1012527691.20080117145250@gmail.com> <fmnp24$rob$1@ger.gmane.org>
	<1179311965.20080117172327@gmail.com> <fmqnta$9lc$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Sat, 19 Jan 2008 18:21:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rolf,

Friday, January 18, 2008, 7:33:30 PM, you wrote:

> Paul Sokolovsky schrieb:
>>> Mickey's comment
>> 
>>> # I agree. The issue to fix is worthwile, but I would prefer seperate
>>> # packaging as well.
>> 
>>> sounds quite different, don't you agree?
>> 
>>   Nope, I don't ;-).

> OK, everyone is entitled to their opinion, fair enough.

> I am sure you will then afford me the liberty to completely ignore any
> and all comments you make which I deem to be in inappropriate style, no
> matter how technically valid.  I have seen enough of it, I don't want it
> anymore, I will block it out from my perception.

  I recommend you to stop declaring attitudes of ignore and alienation
towards OE community (re: http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/003753.html)
and its individual members (which you do almost every time somebody
don't agree with what you do).

  If you have something with the tone of my messages, ignoring it is
what I myself recommend you to do, especially if you tend to perceive
it on the negative side. But I don't recommend you to ignore technical
content of anybody's comments - you had your commits reverted multiple
times, and it's time to learn what's wrong.

> IOW, next time it will be *you* doing
> http://oz.leggewie.org/wip/wifi-suspend.patch  Fair enough, I'd say.

  And I'm glad you're now getting idea on that. Except that there
shouldn't be "you" or "me". Instead, anytime you're not sure if some
change is done the best way and if it doesn't regress something (and
please always give anyone - including yourself - power of doubt),
please consult with wider community. As was told many times already,
IRC is a bad place for RFCs. It's oftentimes not easy to decide if
some change requires RFC or not, so being conservative and posting an
RFC still is a good plan. Otherwise, be prepared that your change may
break something you couldn't even think (OE is a complex system), so
you may be asked to re-do your solution, or have it reverted until you
come up with better plan. Finally, don't haste with either applying
patches without RFCing them wide enough, or with applying them without
letting people some time to review RFC.

  Those were suggestions I myself used to get, and now hopefully trying
to follow. I'm sorry if you hear them not the first time - I would
think that is the case actually. I'm even more sorry if you didn't
have chance to see them before - then it for sure was mistake to start
commenting on your commit with technical matters, I should have
started with that instead.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



