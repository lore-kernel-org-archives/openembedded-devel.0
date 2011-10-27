Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RJZth-0005Hr-DM
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Oct 2011 02:02:09 +0200
Received: by qyg14 with SMTP id 14so4292801qyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 16:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cqttSUavFyKfi5j3MzAE1t2qsVrvCB5FD9WyY0NaGRI=;
	b=Y0Nh3dlvQqxwAPa8fWONeCIQgHcqIVC5Eq0JOR8DReDnSQN6a++TpdssW+mcbDu2RY
	ztpeC/shuLnC5qpT3F9ENcMSU4vpmUuh+j1ILkKdSWGU0eGNW6119UEIPM3xaiaFoLGe
	TfdwBaNHBqvwchnQt3PSEvFbRXqQ+prrLi/pA=
MIME-Version: 1.0
Received: by 10.229.64.144 with SMTP id e16mr76061qci.112.1319759767844; Thu,
	27 Oct 2011 16:56:07 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Thu, 27 Oct 2011 16:56:07 -0700 (PDT)
In-Reply-To: <20111027174442.GG15391@denix.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<20111027115643.GA13369@mi.fu-berlin.de>
	<20111027174442.GG15391@denix.org>
Date: Thu, 27 Oct 2011 16:56:07 -0700
Message-ID: <CA+M6bX=bdAbBPoNbnRU3nfFCnR8prk5XAnh9o1VCcZtD5arW+g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Fri, 28 Oct 2011 00:02:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 27, 2011 at 10:44 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 27, 2011 at 01:56:43PM +0200, Henning Heinold wrote:
>> On Thu, Oct 27, 2011 at 10:53:13AM +0000, Mats K?rrman wrote:
>> > Hi,
>> >
>> > Are there any plans for new releases and/or maintenance branches of OE classic?
>
>> http://cgit.openembedded.org/openembedded/log/?h=org.openembedded.dev
>>
>> and)
>>
>> http://cgit.openembedded.org/openembedded/log/?h=2011.03-maintenance
>
> Huh? Are those links to the plans?

No, but putting my TSC hat on, we had talked (and this is reflected in
the minutes somewhere or another) and we aren't actively having
another maintenance release happen (if people step up to do one of
course, that's another matter).

Taking my TSC hat off, 2011.03-maintenance will continue so long as
people have a use for it and my policy was clarified at some point a
little while back that backporting from oe-core/etc directly is fine
(which is another plus of asking people to put what they want into a
branch for me to pull from rather than "cherry-pick $hash from $tree"
as the request).

-- 
Tom


