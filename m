Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HBc8l-0002u5-Qn
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jan 2007 20:26:07 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1243758ugf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2007 11:26:07 -0800 (PST)
Received: by 10.82.139.17 with SMTP id m17mr3862139bud.1170098766505;
	Mon, 29 Jan 2007 11:26:06 -0800 (PST)
Received: by 10.78.167.3 with HTTP; Mon, 29 Jan 2007 11:26:06 -0800 (PST)
Message-ID: <f96d234e0701291126n4ae5f840m49d29e7185b3fc3a@mail.gmail.com>
Date: Mon, 29 Jan 2007 14:26:06 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
MIME-Version: 1.0
References: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
Cc: Stefano Parusso <stefano@ir3arp.net>
Subject: Re: Stable versions of OE
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
X-List-Received-Date: Mon, 29 Jan 2007 19:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/29/07, Nelson Castillo <nelson@emqbit.com> wrote:
> Hi.
>
> I've been following this document (http://wiki.emqbit.com//openembedded)
> by Stefano Parusso that explains how to build OE for a ARM board[1].
>
> It works for the snapshot for November the 7th and not for the most recent
> one. I read in the Getting Started wiki page[3]:
>
>   Once you have a "known good" version that works well on your
>   system, keep it! To update, clone a new copy; don't overwrite
>   that working version until it's known to be safe.
>
> So, I guess it means I should stay with the old metadata.

Current versions of OE are quite stable for ARM.  Chances are you have
something configured incorrectly.  Hop on the IRC channel and post the
error and it will probably be easy to fix.

> My questions are:
>
>   * Does OE ever do "stable" releases?

Not that I know of.

>   * If not, how do you make "stable" releases for yur plataforms?

I generally follow the tip of dev early in the development.  At some
point once things are working pretty well, I record the version of the
OE meta data and bitbake I am using and then stick with it.  I can
still update the database, but I always make sure I check out that
revision.  This brings up a good question -- are the revision hashs in
OE valid forever?

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


