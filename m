Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JZZ8M-0000Wx-R8
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 23:09:16 +0100
Received: by an-out-0708.google.com with SMTP id b33so705733ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 15:07:03 -0700 (PDT)
Received: by 10.100.37.20 with SMTP id k20mr17399480ank.57.1205359623545;
	Wed, 12 Mar 2008 15:07:03 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 12 Mar 2008 15:07:03 -0700 (PDT)
Message-ID: <c384c5ea0803121507j60b949dtc704c316b561a5ac@mail.gmail.com>
Date: Wed, 12 Mar 2008 23:07:03 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080312234054.6d91807d@widy.localdomain>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org> <1205356290.4530.7.camel@dax.rpnet.com>
	<fr9hg6$9us$2@ger.gmane.org>
	<20080312234054.6d91807d@widy.localdomain>
X-SA-Exim-Connect-IP: 209.85.132.246
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Wed, 12 Mar 2008 22:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Paul,

On Wed, Mar 12, 2008 at 10:40 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>  mirroring, but Monotone with its super-cool concept of unbelievably
>  cheap branches (so-called heads), make it just well robust - even if
>
Multiple heads and lightweight branches are two different things.

A branch has a name/tag that tells me what is happening in that branch
or who is making it happen.

In contrast, multiple heads does not help me in any way as a tool for
branching, nor can I easily track someone else's work in his "head".

Regards,
-- 
Leon


