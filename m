Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas@gstaedtner.net>) id 1LMmUP-0001K2-Do
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 17:51:41 +0100
Received: by fg-out-1718.google.com with SMTP id l26so68609fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 08:45:10 -0800 (PST)
Received: by 10.86.4.14 with SMTP id 14mr22964fgd.27.1231865110235;
	Tue, 13 Jan 2009 08:45:10 -0800 (PST)
Received: by 10.86.26.6 with HTTP; Tue, 13 Jan 2009 08:45:10 -0800 (PST)
Message-ID: <c16a574a0901130845r672a1065u6779b76f74565241@mail.gmail.com>
Date: Tue, 13 Jan 2009 17:45:10 +0100
From: thomasg <thomas@gstaedtner.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1231864150.2952.162.camel@mill.internal.reciva.com>
MIME-Version: 1.0
References: <c16a574a0901130824w742cc8bera0f17d66d12c0e1@mail.gmail.com>
	<1231864150.2952.162.camel@mill.internal.reciva.com>
Subject: Re: Request for inclusion of euphony_0.1.1.bb to the tree
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
X-List-Received-Date: Tue, 13 Jan 2009 16:51:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 13, 2009 at 5:29 PM, Phil Blundell <pb@reciva.com> wrote:
> On Tue, 2009-01-13 at 17:24 +0100, thomasg wrote:
>> I've written a small application I'd like to have added to OE.
>> It has no influence on other packages, so there shouldn't be any problems.
>
> Can you explain a bit more about the background to this program and why
> it would be a useful thing to have in OE?  Our general policy, although
> this is no means official, is that we will only add software to the tree
> if someone other than the author has requested it.

Ok, I didn't know that, there's really little information about adding
.bbs without own git access.
So, ok.

Euphony is a application that can load interfaces and soundfonts to
create virtual music-instruments.
It's desinged for mobile touchscreendevices (although it of course
runs on every linux system) such as openmoko phones.
You can see it as a kind of game or creative tool to have fun. :)
It's basically the sucessor of "epiano" which already lies in OE in
openmoko-3rdparty (it's not really openmoko specific, so euphony does
not have to be in there), only it is far more advanced and supports
multiple instruments.

I'd like to have it added to OE to give others the chance to build it
without messing around with 3rd-party .bbs, specifically the OM
community, but also all others with (even more suitable) embedded
platforms that use openembedded (beagleboard, gumstix, ...).

Btw. - if you like you can replace the epiano.bb (which was written by
me and included by mickeyl) with this.


