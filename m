Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZZVP-0005ur-Eq
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 23:33:05 +0100
Received: by fg-out-1718.google.com with SMTP id 13so2379630fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 15:30:57 -0700 (PDT)
Received: by 10.82.149.8 with SMTP id w8mr21033028bud.29.1205361057498;
	Wed, 12 Mar 2008 15:30:57 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id c28sm20409716fka.0.2008.03.12.15.30.54
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 15:30:55 -0700 (PDT)
Date: Thu, 13 Mar 2008 00:32:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313003228.6a4c8ad4@widy.localdomain>
In-Reply-To: <c384c5ea0803121507j60b949dtc704c316b561a5ac@mail.gmail.com>
References: <200803110807.11368.zecke@selfish.org>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<1205356290.4530.7.camel@dax.rpnet.com>
	<fr9hg6$9us$2@ger.gmane.org>
	<20080312234054.6d91807d@widy.localdomain>
	<c384c5ea0803121507j60b949dtc704c316b561a5ac@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 22:33:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 23:07:03 +0100
"Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:

> Hello Paul,
> 
> On Wed, Mar 12, 2008 at 10:40 PM, Paul Sokolovsky <pmiscml@gmail.com>
> wrote:
> >  mirroring, but Monotone with its super-cool concept of unbelievably
> >  cheap branches (so-called heads), make it just well robust - even
> > if
> >
> Multiple heads and lightweight branches are two different things.

Probably also because of different numbers of hexadecimal digits?

> 
> A branch has a name/tag that tells me what is happening in that branch
> or who is making it happen.

And heads have head revision and change logs too!

> 
> In contrast, multiple heads does not help me in any way as a tool for
> branching, nor can I easily track someone else's work in his "head".

That's because you've stuck with that old and boring concept of
"lightweight branches". People who grasped heads novelty enjoy it very
much. Well, the same can be said about the people who didn't drop
everything to endeavor into those "lightweight branches" - they enjoy
classy branches with not the lesser passion than the other two groups.


Well, but the talk was about mirroring and syncing potentially
incompatible changes. Do lightweight branches help with this?

> 
> Regards,
> -- 
> Leon

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


