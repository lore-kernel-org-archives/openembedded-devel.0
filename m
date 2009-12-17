Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NLL5Y-0007ms-57
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 19:28:39 +0100
Received: (qmail 31261 invoked by uid 1003); 17 Dec 2009 18:26:46 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Dec 2009 18:26:46 -0000
Message-ID: <4B2A77E5.1040804@balister.org>
Date: Thu, 17 Dec 2009 13:26:45 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0912171137010.30166@localhost>
In-Reply-To: <alpine.LFD.2.00.0912171137010.30166@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: should i submit detailed bugs for e2fsprogs and gnome-games?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Dec 2009 18:28:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2009 11:39 AM, Robert P. J. Day wrote:
>
>    just trying a beagleboard-demo-image build on the dev branch, last
> attempt still produced failed builds for:
>
>    * e2fsprogs
>    * gnome-games
>
> i don't see that the latest pull would change any of that, but i'm
> trying it anyway.  if those two packages still fail, should i supply
> details?  (fully-updated fedora 12, as always).
>
>    philip?  are you seeing the same things?  i'll verify that i haven't
> done anything weird in my shell environment that might be causing
> this.

I saw the gnome-games problem. Steve says he has a later version in his 
repo, when he figure out some other things we hope that update solves 
the problem.

Philip

>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


