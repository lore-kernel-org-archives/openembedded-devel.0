Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I8KLj-0006ky-CU
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 20:22:30 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1411055ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 11:16:25 -0700 (PDT)
Received: by 10.86.71.1 with SMTP id t1mr633059fga.1184091385533;
	Tue, 10 Jul 2007 11:16:25 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id e9sm49675082muf.2007.07.10.11.16.23
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2007 11:16:24 -0700 (PDT)
Date: Tue, 10 Jul 2007 21:16:08 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <40479847.20070710211608@gmail.com>
To: "Sergey Lapin" <slapinid@gmail.com>
In-Reply-To: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
References: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 10 Jul 2007 18:22:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Tuesday, July 10, 2007, 6:45:11 PM, you wrote:

> Hi, all!

> I just had raging argument with Paul Sokolovsky about my commits,
> so I'd like to RFC them, and also I'd like to ask if all these changes
> should be passed through RFC.

> Please, see attachments. Sorry for post-factum.

> Briefly, these commits generalize palms support and make maintenance
> easier, also, update Zire 72 configuration.

  Well, I regret that even after discussion on IRC you still miss the
point. The talk was not about "palm commits" per se, but about
refactors to make machines more maintainable. OE obviously has
noticeable problems with that, and trying to solve them in local
machine corners won't benefit OE, but in the end just will become the
same mess but in the other plane.

  So, if you have bright ideas how to optimize maintenance, please
think how it fits with already existing machine support framework
(task-base), share them with wider audience, and call for feedback.
I'm sure there're parties interested in the same changes, and getting
together may lead to much better result for OE as a whole.

  Of course, you're free to treat those changes as Palm local, but
what I wrote still holds - machine configs in OE need refactoring and
elaboration. If you don't want to put a bit more effort into that and
make your changes useful universally, then someone else will need to
duplicate large part of your work, and possibly achieve incompatible
results with your current scheme. As that someone hopefully will
target it on global level, then palm config would need to be changed
too, so in the end it will appear turn out that you lost time too.

  Summing up, by investing 50% more effort into that, there can be 5
times more outcome. And as a "fresh blood" in OE, you're in good
position to lead this, as other developers are of course stuck with
other issues.


> Thanks a lot,
> S.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



