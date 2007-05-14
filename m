Received: from [66.249.90.176] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HnYhS-0008ET-6x
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2007 13:26:49 +0200
Received: by ik-out-1112.google.com with SMTP id c28so1160191ika
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 04:26:40 -0700 (PDT)
Received: by 10.64.84.3 with SMTP id h3mr3975252qbb.1179141998713;
	Mon, 14 May 2007 04:26:38 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 36sm12688418nza.2007.05.14.04.26.37;
	Mon, 14 May 2007 04:26:38 -0700 (PDT)
Date: Mon, 14 May 2007 14:26:44 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1848419262.20070514142644@gmail.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <f29cu8$lol$1@sea.gmane.org>
References: <1179059149.5404.3.camel@cimmeria.hyboria>
	<f277j3$i00$1@sea.gmane.org> <464818E3.7090203@gmail.com>
	<24757045.20070514112558@gmail.com>
	<46482288.2040904@gmail.com> <f29cu8$lol$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFD: Bugzilla in general & bug triaging
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
X-List-Received-Date: Mon, 14 May 2007 11:26:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rolf,

Monday, May 14, 2007, 1:16:37 PM, you wrote:

> Junqian Gordon Xu wrote:
>>>         As Rolf described in his mail, we do not reassign bugs in our
>>> workflow 

> Actually that is neither what I wrote nor what I'd propose ;-)

        Well, ok, what you wrote is that you once tried assign bugs,
but was suggested not to do that. If you want to propose that again,
then the same suggestion: please don't do that. The reasons were
given, and I reiterate over the matter below again.

> I have
> no issue with you assigning 2309 to yourself.  You seem to take good 
> care of it.

>> One benefit of reassigning the bug to myself is that I can click the "My 
>> Bug" button and list all my filed and self-assigned bugs, instead of 
>> remembering the bug number or relying on search.

> yes, very valid point.  It innocently illustrates the kind of workflow
> I'd be looking for (and that I use to a certain degree for myself).

        That's kind of bug workflow most projects use, be them
opensource or commercial, so no wonder. But such workflow works
especially well if as many as possible of the following are true:

1. Scope of project and functional areas are well defined.
2. There're dedicated developer for each area.
3. There's a manager who performs assignment.

        None of these are true for OE - the scope is too wide, areas
either to big (like, a distro), or too diversified (issues with
specific package or machine), there're no dedicated developers for
specific areas, and no manager who tells folks what to do.

        So, there's another workflow, of course not so organized, but
flexible and well fitting OE devel model, the reason why it was there
well before you or me came into active contribution.

> You
> have a link with a search function saved in bugzilla and when you click
> on it all the bugs that need your attention or that you are interested
> in are right there.

        Yes, you have saved searches, you have email preferences, you
have other cool things in Bugzilla, you learn to use them well in
framework on the existing workflow, before trying to revolutionize the
workflow itself.

> Gordon, maybe you want to save http://tinyurl.com/385p8b  You could also
> separate that out to only list cc bugs or whatever suits your needs. 
> Tweak it to your liking.

> Here are three searches that I use and deem useful for others

> http://tinyurl.com/2oypog (todays bugs: action: stay current)
> http://tinyurl.com/35l78g (bugs where compilation fails, action: verify)
> http://tinyurl.com/39gss8 (old with patches, action: inspect, commit)

        These links are nice, but won't help too much. Until people
start to make bug filters which *they* like and need, there always be
idea that something's lacking and that you need to put it upside down
trying to make it "work" for you.

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



