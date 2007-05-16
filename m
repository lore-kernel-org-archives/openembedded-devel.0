Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1HoAEK-0006cL-74
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 05:31:13 +0200
Received: by py-out-1112.google.com with SMTP id n39so354178pyh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 20:30:56 -0700 (PDT)
Received: by 10.35.106.15 with SMTP id i15mr14218008pym.1179286256271;
	Tue, 15 May 2007 20:30:56 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id m2sm975315nzf.2007.05.15.20.30.54;
	Tue, 15 May 2007 20:30:54 -0700 (PDT)
Message-ID: <464A7A3E.9050905@gmail.com>
Date: Tue, 15 May 2007 22:27:58 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1179059149.5404.3.camel@cimmeria.hyboria>	<f277j3$i00$1@sea.gmane.org>
	<f29dkh$o3v$1@sea.gmane.org>
In-Reply-To: <f29dkh$o3v$1@sea.gmane.org>
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
X-List-Received-Date: Wed, 16 May 2007 03:31:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> I have asked and been granted greater powers on bugzilla.  There are 
> features which we don't use yet but which could aid in establishing a 
> sane workflow while rendering unnecessary the current clutches and 
> ad-hoc fixes.
>
> Bugzilla will be upgraded soon and no structural changes will be made 
> until that is completed.  But that leaves us some good time to think 
> about how this should be enhanced.
>   
two quibbles about the recent change in bugtracker
1) aligning left wastes lot of space on the right of the screen. I think 
the old "centered" scheme looks better.
2) "the Words field cannot be empty. You have to enter at lease on word 
in your search criteria". This is inconvenient for me to just browser 
the bugs.

> Things I'd like to see
> * confirmation flags
> * better documentation of workflow status (need to define it first)
> * assigning bugs (or if you prefer "Hey, please take a look")
> * link to some bug searches like the ones I send about 5 minutes ago
>    on the entry page
> * entry page clean-up (why two search fields?)
>   

> * removal of dead stuff (ZaurusKernel, Familiar)
>   
better hide them (sort of a archive in case some people want to dig into 
those) than remove
> Please add to the list.  The most important point is the second.  That 
> is what we should discuss.
>   
I agree on the necessity of the second point. Please have a list of 
best-practice/workflow rules (whatever they are) and hide the additional 
irrelevant features. A clean and uncluttered interface is also desirable.

Gordon


