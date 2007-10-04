Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IdWSW-0001x0-QO
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:34:08 +0200
Received: by an-out-0708.google.com with SMTP id b33so43827ana
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2007 12:28:48 -0700 (PDT)
Received: by 10.142.174.8 with SMTP id w8mr2060626wfe.1191526127809;
	Thu, 04 Oct 2007 12:28:47 -0700 (PDT)
Received: by 10.142.81.6 with HTTP; Thu, 4 Oct 2007 12:28:47 -0700 (PDT)
Message-ID: <b6ebd0a50710041228l2a87b76crb8e5dc303ebc27a1@mail.gmail.com>
Date: Thu, 4 Oct 2007 12:28:47 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47053A35.6040005@klever.net>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown> <4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
	<47053A35.6040005@klever.net>
X-Google-Sender-Auth: 3cfedeea1827ca55
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
X-List-Received-Date: Thu, 04 Oct 2007 19:34:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
> >
> > That's not correct.  You can push to a git repository over http/webdav
> > to an apache2 server.
> >
>
> That's right, but I guess you also know of drawbacks of this method. To
> mention one, having webdav *only* for push is somewhat strange, but
> since at push time no hooks will be executed (which sucks by itself),
> including update-server-info, the repository won't be quite
> dumb-protocol-ready.

I think you're a bit behind :)  post-update works just fine for this,
and I'm not the only one using it on a daily basis.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


