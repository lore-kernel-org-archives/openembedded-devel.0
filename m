Received: from [66.249.82.231] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <debasreeat@gmail.com>) id 1H2jZ9-0006fK-Ut
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 08:32:40 +0100
Received: by wx-out-0506.google.com with SMTP id t14so6908831wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 23:31:20 -0800 (PST)
Received: by 10.90.78.1 with SMTP id a1mr573615agb.1167982280106;
	Thu, 04 Jan 2007 23:31:20 -0800 (PST)
Received: by 10.90.95.17 with HTTP; Thu, 4 Jan 2007 23:31:20 -0800 (PST)
Message-ID: <193b6ba30701042331p6ca582e9qcdec83caa9445dba@mail.gmail.com>
Date: Fri, 5 Jan 2007 16:31:20 +0900
From: "Debasree Mallick" <debasreeat@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070104082632.GA11300@hezmatt.org>
MIME-Version: 1.0
References: <193b6ba30701032221u5d680767q8bc3db738ba89b47@mail.gmail.com>
	<20070104082632.GA11300@hezmatt.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Help me
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
X-List-Received-Date: Fri, 05 Jan 2007 07:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
monotone has installed..
But when i try to run bitbake nano command
it shows some error at the end..
Errors r
ERROR: TaskFailed event exception, aborting
NOTE: package fakeroot-native-1.2.13: failed
ERROR: Build of nano failed

If u can then please help me out...
Thanks
Debasree

On 1/4/07, Matthew Palmer <mpalmer@hezmatt.org> wrote:
>
> [For your own benefit, I'd suggest a better choice of subject line in
> future]
>
> On Thu, Jan 04, 2007 at 03:21:57PM +0900, Debasree Mallick wrote:
> > Hi,
> > When i try to run this command
> > mtn --db=OE.mtn co -b org.openembedded.dev
> > It givs a error..Error is
> >
> > mtn: misuse: layout of database /stuff/OE.mtn doesn't match this version
> > of monotone
>
> You're running a newer version of monotone than the version which was used
> to create the database.  If you just want to get the source, and don't
> have
> commit access, I've found that:
>
> > mtn: misuse: try 'mtn db migrate' to upgrade
>
> Does a nice job of making everything work again (I'm using mtn 0.32).
>
> I've got no idea if things will still work properly if you're pushing
> changes back to trunk, since I'm not So Blessed.
>
> - Matt
>
> --
> I don't do veggies if I can help it.                    -- stevo
> If you could see your colon, you'd be horrified.        -- Iain Broadfoot
> If he could see his colon, he'd be management.          -- David Scheidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

