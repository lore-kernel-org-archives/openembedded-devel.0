Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mattjreimer@gmail.com>) id 1GGNSN-0001o0-Cz
	for openembedded-devel@openembedded.org; Fri, 25 Aug 2006 00:13:47 +0200
Received: by wx-out-0506.google.com with SMTP id s19so624632wxc
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Aug 2006 15:12:10 -0700 (PDT)
Received: by 10.90.79.6 with SMTP id c6mr489313agb;
	Thu, 24 Aug 2006 15:12:10 -0700 (PDT)
Received: by 10.90.25.19 with HTTP; Thu, 24 Aug 2006 15:12:10 -0700 (PDT)
Message-ID: <f383264b0608241512n6c151903q9ce027ce2db18f7f@mail.gmail.com>
Date: Thu, 24 Aug 2006 15:12:10 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1156267818.5920.21.camel@localhost.localdomain>
MIME-Version: 1.0
References: <E1GEBoO-0004rL-CK@linuxtogo.org>
	<1156267818.5920.21.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org, oe@handhelds.org
Subject: Re: [Oe-commits] org.oe.dev swig-native: add a bb file for 1.3.29.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Aug 2006 22:13:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/22/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2006-08-18 at 23:23 +0200, mreimer commit wrote:
> > swig-native: add a bb file for 1.3.29.
> >
> > Author: mreimer@openembedded.org
>
> > ============================================================
> > --- packages/swig/swig-native_1.3.29.bb       89569bd5aec701a45a7c326cb76e3cc22761dd61
> > +++ packages/swig/swig-native_1.3.29.bb       89569bd5aec701a45a7c326cb76e3cc22761dd61
> > @@ -0,0 +1,7 @@
> > +require swig_${PV}.bb
>
> Could you add swig_1.3.29.bb please? :)
>
> Richard

Looks like pH5 beat me to it. Thanks pH5!

Matt


