Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I8LDP-0002yk-Nc
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 21:17:47 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1422118ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 12:11:52 -0700 (PDT)
Received: by 10.82.183.19 with SMTP id g19mr10059259buf.1184094712311;
	Tue, 10 Jul 2007 12:11:52 -0700 (PDT)
Received: from ?10.0.0.102? ( [85.249.166.143])
	by mx.google.com with ESMTP id f7sm26183452nfh.2007.07.10.12.11.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Jul 2007 12:11:51 -0700 (PDT)
Message-ID: <4693D9F4.5030000@gmail.com>
Date: Tue, 10 Jul 2007 23:11:48 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
	<40479847.20070710211608@gmail.com>
In-Reply-To: <40479847.20070710211608@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Palms commits.
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
X-List-Received-Date: Tue, 10 Jul 2007 19:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello Sergey,
> 
> Tuesday, July 10, 2007, 6:45:11 PM, you wrote:
> 
>> Hi, all!
> 
>> I just had raging argument with Paul Sokolovsky about my commits,
>> so I'd like to RFC them, and also I'd like to ask if all these changes
>> should be passed through RFC.
> 
>> Please, see attachments. Sorry for post-factum.
> 
>> Briefly, these commits generalize palms support and make maintenance
>> easier, also, update Zire 72 configuration.
> 
>   Well, I regret that even after discussion on IRC you still miss the
> point. The talk was not about "palm commits" per se, but about
> refactors to make machines more maintainable. OE obviously has
> noticeable problems with that, and trying to solve them in local
> machine corners won't benefit OE, but in the end just will become the
> same mess but in the other plane.

And I was telling you that in my position, such big start is doubtful,
if not impossible by several reasons, among which I need to learn
infrastructure mechanics in OE, and I need to get more time and effort,
because of busy schedule. So it is not possible _immediately_.

Your argument still amazes me.


> 
>   So, if you have bright ideas how to optimize maintenance, please
> think how it fits with already existing machine support framework
> (task-base), share them with wider audience, and call for feedback.
> I'm sure there're parties interested in the same changes, and getting
> together may lead to much better result for OE as a whole.

I never disagreed on this thing, since it is generic enough as a concept.

> 
>   Of course, you're free to treat those changes as Palm local, but
> what I wrote still holds - machine configs in OE need refactoring and
> elaboration. If you don't want to put a bit more effort into that and
> make your changes useful universally, then someone else will need to
> duplicate large part of your work, and possibly achieve incompatible
> results with your current scheme. As that someone hopefully will
> target it on global level, then palm config would need to be changed
> too, so in the end it will appear turn out that you lost time too.

I understand your point here, but if I prefer only start doing
something when I can handle that thing, and when I can be
responsible for it. If at the moment I can finish 1 little thing,
then that's what I'm going to do. If I have resources to spend on
bigger problem, I go and solve one (or help somebody with even bigger issues).

I have a list of smaller thingies I can do just passing by, and bigger ones,
which I leave for bigger windows of time.

Do you understand my time management better now? That's probably would
clear our discussion?

> 
>   Summing up, by investing 50% more effort into that, there can be 5
> times more outcome. And as a "fresh blood" in OE, you're in good
> position to lead this, as other developers are of course stuck with
> other issues.

Do you count yourself in this 50%, btw?

Best regards,

S.



