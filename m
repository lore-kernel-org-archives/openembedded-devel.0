Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IdVdY-0005ML-Cm
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 20:41:31 +0200
Received: by wr-out-0506.google.com with SMTP id c46so220436wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2007 11:36:08 -0700 (PDT)
Received: by 10.142.222.21 with SMTP id u21mr994993wfg.1191522967152;
	Thu, 04 Oct 2007 11:36:07 -0700 (PDT)
Received: by 10.142.81.6 with HTTP; Thu, 4 Oct 2007 11:36:07 -0700 (PDT)
Message-ID: <b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
Date: Thu, 4 Oct 2007 11:36:07 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4704EAE3.8050702@klever.net>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown> <4704EAE3.8050702@klever.net>
X-Google-Sender-Auth: 91a7f270977a7c8f
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 18:41:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
> > Well luckily I am not an ignorant git-fanboy :) Could you shortly point
> > out to me the reasons why you think monotone is favorable over git for
> > use with openembedded ? I will admit right away that my limitation with
> > SCMs in large projects is more than limited. So i can only speak of
> > my user experience with git vs my experience with monotone and i prefer
> > the first.
>
> Well, 1st - OE folks are used to monotone now. That's primary reason.
> The second primary reason is that I know of some developers who seem to
> dislike git. And if we're talking about technical reason, one I can
> think of is that there's no non-ssh transport allowing push, which
> complicates administration of our "central" repository.

That's not correct.  You can push to a git repository over http/webdav
to an apache2 server.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


