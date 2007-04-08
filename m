Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HaauE-0003TV-HX
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Apr 2007 19:10:22 +0200
Received: by ug-out-1314.google.com with SMTP id e2so1357254ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2007 10:10:21 -0700 (PDT)
Received: by 10.67.10.18 with SMTP id n18mr4631129ugi.1176052221824;
	Sun, 08 Apr 2007 10:10:21 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Sun, 8 Apr 2007 10:10:21 -0700 (PDT)
Message-ID: <c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
Date: Sun, 8 Apr 2007 19:10:21 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org, cliff.brake@gmail.com
In-Reply-To: <f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
MIME-Version: 1.0
References: <4611582F.8010203@openhardware.net>
	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
Subject: Re: versioning madness
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
X-List-Received-Date: Sun, 08 Apr 2007 17:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Tom, Cliff,

On 4/5/07, Cliff Brake <cliff.brake@gmail.com> wrote:
> On 4/2/07, Tom Walsh <tom@openhardware.net> wrote:
> > I would like to know how others are handling this problem.   As you
> > ...
> The solution is bbcollections.  If you set up bbcollections properly,
> ...
>
I am using the same method as Cliff and this works very well for me. I
put my private tree in a CVS repository. (But I try to commit as much
generic stuff into mainline).

One remaining issue for me is that I now have two seperate version
controlled repositories and I need a way to keep them interoperable.
This is not hard to do for the HEADs, but I have people working with
older branches or snapshots so there is a pretty amount of overhead
involved in keeping track of breaking changes.

Regards,

Leon.


