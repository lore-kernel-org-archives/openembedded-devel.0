Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JFWT4-0003PA-CT
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 16:15:46 +0100
Received: by ug-out-1314.google.com with SMTP id i24so369495ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 07:15:44 -0800 (PST)
Received: by 10.66.242.5 with SMTP id p5mr3489397ugh.4.1200582942852;
	Thu, 17 Jan 2008 07:15:42 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id j33sm2896437ugc.63.2008.01.17.07.15.41
	(version=SSLv3 cipher=OTHER); Thu, 17 Jan 2008 07:15:42 -0800 (PST)
Date: Thu, 17 Jan 2008 17:23:27 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1179311965.20080117172327@gmail.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <fmnp24$rob$1@ger.gmane.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
	<478F4876.9030405@student.utwente.nl>
	<1012527691.20080117145250@gmail.com> <fmnp24$rob$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 17 Jan 2008 15:15:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rolf,

Thursday, January 17, 2008, 4:34:41 PM, you wrote:

> Paul,

> thank you for pointing out the problem and a template solution towards
> the end of your initial rant as well.  In fact I am already working on

  Thanks for acting on that.

> moving the mid-term fix into a separate package to provide an even less
> intrusive mid-term fix ->
> http://oz.leggewie.org/wip/wifi-suspend.patch



> But...

> Paul Sokolovsky schrieb:
>> and of course they need to be supported still, and right now. The question
>> is how that is done - if it comes mixed into one big mess
>                                                        ^^^^
>> I don't appreciate someone moving in the opposite direction just to solve on-spot problem. OE is
>     ^^^^^^^^^^^^^^^^
>> powerful environment allowing to solve make focused, maintainable and
>> reusable changes - even if they're workarounds, and people should
>> learn to use them.

> And I don't appreciate after I have

> * fixed a real usability issue which likely strongly influences the
>   perception of OE-derived distros
> * consulted with a *LOT* of people on IRC and in the bug tracker over
>   several days
> * have put quite some time into finding an acceptable solution for
>   everyone

> that someone comes around who had previously been quiet on this and then
> calls my work a "mess" and generally finds very unappreciative words for
> what I've done and the time I've spent.

  Oh, do we need a bit of affirmative action here again? ;-) Ok, so
"mess" is not your work, it's what core layer of OE runtime is, to the large
extent. Being with OE for quite some time, I know such
problem areas, and try to work towards resolving them. That's hard to
do on one's own, so I humbly expects that other experienced OE
developers to share such approach, instead of trying to apply pain-of-day
patches, just increasing existing mess.

 As for IRC, unfortunately, I don't have much time to be on it
lately, but I try to be on MLs. So, don't get too hot about receiving
*one more* comment if you already received them a lot. OE is big system,
and noone can know and be up to date with all its areas.

> Mickey's comment

> # I agree. The issue to fix is worthwile, but I would prefer seperate
> # packaging as well.

> sounds quite different, don't you agree?

  Nope, I don't ;-). I don't see anything special about communication
which goes your way, no matter who's the other side, sorry ;-).

> FOSS is an incremental process.

> I am willing to get this not only right for me, but to everyone's
> satisfaction.

  Great, so I just provide my comments on the matter. You may wonder
how it gets often that you and I get into communication (though I of
course give comments to other people too). But even that should be
rather clear - because we both care about almost the same area
regarding OE, albeit with different approaches and plans. In this
regard, I appreciate your review, suggestions, and comments!

> But I kindly want to ask you to consider that it is not
> only what you say but also how you say it.

> PS: I don't intend to and hope I did not start another flame war, but
> this is important to me.


  Just in case, there's still personal mail around...


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



