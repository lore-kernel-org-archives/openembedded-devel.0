Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LmCpt-0005Hp-4D
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 21:02:58 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1886872yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HKkvyS9oQMG8+YGQ1J8S+urZ3ugbe3r43qvVkMeZs6g=;
	b=e9I0jpb7R+CWJwgb1dy4LDcK0+VkmYIhI/1MRb7ORw13QDJhs5/tqPrV4sCOwyUscR
	ahW0IgJvQ70CiQ4yjApTSebxQ4SB7gXx4laSFHZ1x7qIFSgWwHdcd00JWGy/T5mYIs0E
	JHW9Z+dWEQtMp6YJgGZ6UCutwXDOP8KJ3gaR0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=GklYDcPIuDkHw0P5KYebsBVLw3EOnG6syS9IHqkZu5BO6KYazGAng2F92N+SQ73FxZ
	LxXnQezwPbM1RxU26HbzdHef4ZHCz7YbWcordKWJaQn/0POKrkwCXhtdG5IvLi2pHLCk
	T7OjJcTdt5eIOfw+Bvt9iDL9kVJl/W48Q+SYU=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.140.6 with SMTP id n6mr15527891ybd.248.1237924886288; Tue, 
	24 Mar 2009 13:01:26 -0700 (PDT)
In-Reply-To: <FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<49C92CC7.2080801@gmail.com>
	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
	<49C93237.7010205@gmail.com> <49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
Date: Tue, 24 Mar 2009 13:01:26 -0700
X-Google-Sender-Auth: 56c9c930460c3e2c
Message-ID: <b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 20:03:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 24, 2009 at 12:51 PM, Tim Ellis <tim@ngndg.com> wrote:
> I am happy with whatever the outcome of this is as long as my packages as
> specified in the MAINTAINERS file end up being maintained by me - we should
> start whatever changes by transferring the information there to wherever it
> is destined to go and then assessing the logs of individual packages imho.
> Once a decision has been made getting devs that are listed there to transfer
> the information would be a good way to see who is active and actually wants
> to maintain their packages.
>
> I don't really have a problem with the way it is at the moment to be honest
> and try to contact people using git log on packages and the MAINTAINERS file
> if I have a need to touch other packages, which isn't really that hard!
>

I don't think the current method is difficult, persay, but rather I'd
like to see:
- More individual responsibility in the project in general,
particularly in class and recipe maintenance.
- Clearer delineation between what gets the most attention and what does not.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


