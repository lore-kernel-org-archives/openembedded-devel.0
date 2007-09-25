Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IaCc4-0004MU-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2007 17:46:16 +0200
Received: by ug-out-1314.google.com with SMTP id m3so1153385ugc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 08:41:50 -0700 (PDT)
Received: by 10.67.103.20 with SMTP id f20mr954369ugm.1190734909917;
	Tue, 25 Sep 2007 08:41:49 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.11])
	by mx.google.com with ESMTPS id a1sm1806578ugf.2007.09.25.08.41.47
	(version=SSLv3 cipher=OTHER); Tue, 25 Sep 2007 08:41:48 -0700 (PDT)
Date: Tue, 25 Sep 2007 18:41:45 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1577324081.20070925184145@gmail.com>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <200709251620.52994.u.luckas@road.de>
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<a7f8874a0709241217o1fbd6060ka53b75837e07be78@mail.gmail.com>
	<200709251620.52994.u.luckas@road.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Kexec Cmdline Support
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
X-List-Received-Date: Tue, 25 Sep 2007 15:46:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Uli,

Tuesday, September 25, 2007, 5:20:52 PM, you wrote:

> On Monday, 24. September 2007, Hans Henry von Tresckow wrote:
>> (sorry for crossposting this,but I think more of the interested parties
>> read oe-devel then angstrom-devel)
>>
>> A while back, mwester made some patches to add the ability to modify the
>> cmdline when using kexec to load a kernel. I did some testing on poodle and
>> posted the results on the bug tracker
>> (http://bugs.openembedded.org/show_bug.cgi?id=2969)
>> I was wondering what the rest of the developers think of these. 
> Hi Henry,
> A while back I posted a different approach [1] to this mailing list for
> review. To bad, there have not been any comments.

> The differences of my approach in contrast to mwester's approach have been
> discussed on the arm kernel mailing list. If there is any interest in this
> (userspace) approach at all, I will improve on the known problems (like hard
> coded ATAG base address).

> I'd really appreciate feedback from the developers.

  Full commandline, etc. support for kexec is much, much needed
feature. Unfortunately, most developers are likely busy with more
mundane stuff and give good review/testing to it. But those who're
interested in this area for sure should apply such patches to the
device kernel they can test, to facilitate wider testing, and the
authors of the patches for sure should post the for review to general
Linux list, and hopefully communicate to find the best solution.

> Best regerds
> Uli

> 1) 
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-August/002840.html



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



