Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JNaNk-0001sL-3b
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2008 22:03:36 +0100
Received: by fk-out-0910.google.com with SMTP id 18so4257289fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2008 13:03:49 -0800 (PST)
Received: by 10.82.182.1 with SMTP id e1mr23836741buf.27.1202504629115;
	Fri, 08 Feb 2008 13:03:49 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Fri, 8 Feb 2008 13:03:49 -0800 (PST)
Message-ID: <74d0deb30802081303m60fafee3t6b6ca4aacce894ca@mail.gmail.com>
Date: Fri, 8 Feb 2008 22:03:49 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <foic69$d7f$1@ger.gmane.org>
MIME-Version: 1.0
References: <E1JNHzO-0001Y7-HO@linuxtogo.org>
	<74d0deb30802080425s7c69bf95y4725bb48bc9088f6@mail.gmail.com>
	<foic69$d7f$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] org.oe.dev mkbold-mkitalic-native: initial commit. partly closes 1362 (incorporate stuff from openzaurus-ja project)
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
X-List-Received-Date: Fri, 08 Feb 2008 21:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/8/08, Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:
> pHilipp Zabel schrieb:
> > Hi,
> >
> > I think this should not live in xorg-app but in its own directory.
>
> Well, something as minimal as this native tool does not warrant its own
> directory, I think.  I think the right thing to do is to group together
> with other bdf fonts and their tools (I will try to integrate the bdf
> fonts into the font-update-common framework when I have the time).  That
> is also the reason it has so far landed in xorg-app: other bdf-related
> stuff is there.

Yes, it might make sense to group those tools together.
I only objected because in the xorg-* case, the recipes are already
grouped by another criterion, their source.
As this so far appears to make maintenance a lot easier, I'd like not
to mix that up.

> Would you object to move them out into something like packages/bdf-fonts/?

No, not at all.

regards
Philipp


