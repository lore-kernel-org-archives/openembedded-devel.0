Received: from [66.249.82.238] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IQqwk-0005V5-AY
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2007 22:48:58 +0200
Received: by wx-out-0506.google.com with SMTP id h27so583161wxd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2007 13:47:03 -0700 (PDT)
Received: by 10.90.95.11 with SMTP id s11mr1215337agb.1188506822686;
	Thu, 30 Aug 2007 13:47:02 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Thu, 30 Aug 2007 13:47:02 -0700 (PDT)
Message-ID: <c384c5ea0708301347j29cbd93cu2cc1c27e012c09a0@mail.gmail.com>
Date: Thu, 30 Aug 2007 22:47:02 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1188425104.6238.51.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1187692103.6234.7.camel@localhost.localdomain>
	<46CC3773.8010707@dominion.kabel.utwente.nl>
	<109919.20070822152350@vanille-media.de>
	<c384c5ea0708291421p418dc698vdda76fa4deabcbbf@mail.gmail.com>
	<1188425104.6238.51.camel@localhost.localdomain>
Subject: Re: RFC: Upgrade OE.dev to bitbake 1.8.8
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
X-List-Received-Date: Thu, 30 Aug 2007 20:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard, all,

On 8/30/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2007-08-29 at 23:21 +0200, Leon Woestenberg wrote:
> > Are the OE->bitbake version-dependencies documented or tagged anywhere?
> >
> > If not yet, I would propose to tag the OE repository with a tag like
> > "PRE-BITBAKE-1_8_8" or whatever is supported/desired for mtn/oe.
>
> $ cat conf/sanity.conf | grep VER
> BB_MIN_VERSION = "1.8.5"
>
This describes that, given a OE checkout, which bitbake I need minimally.

Now, suppose I have a given bitbake version, how do I find out which
OE revision should work with it?

My proposal is to tag the OE tree on 2007-09-03.

Regards,
-- 
Leon


