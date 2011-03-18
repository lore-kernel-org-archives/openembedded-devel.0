Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q0UaX-0001e3-26
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 08:59:13 +0100
Received: by iwn10 with SMTP id 10so3787485iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=X9qpp9VmxyXowgU2T21d9Yjn6TbxD13RP9lrMIS7yY4=;
	b=k8qShwk4ouzoL22T6S2aVUmHkTAtTUjtFCK9+7dakGeR9+8bA8mzp4XfYAlWXD2t9k
	N0eON6I/ApVGURLRTQ1TQkSjkM3T/l57fs8LaQbl7DHVK79D8IDEiH3truQgyjx36wzL
	TbJQagnU+KIIqZpJRv1kWeHwmagcH3ITcbRKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HifPEsdVkXylUmDtyT2nnjKE0mKwIMium4ykRGFs1mTO2zPFJa4YmFnm9upXnMiEok
	oip1222soy5mvTaLZ3pfciazz+Tr80mhZwC+zU9fAl2JyFefpd08BWutsBwrgDOEak/T
	TBcsJuFGFMUo5fog9kBxmoNYbBK0SNiwqzeDY=
MIME-Version: 1.0
Received: by 10.231.177.193 with SMTP id bj1mr653717ibb.145.1300435047041;
	Fri, 18 Mar 2011 00:57:27 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Fri, 18 Mar 2011 00:57:26 -0700 (PDT)
In-Reply-To: <1300396447.30423.2113.camel@rex>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
Date: Fri, 18 Mar 2011 08:57:26 +0100
Message-ID: <AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 18 Mar 2011 07:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/17 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
>> I'm in favor of keeping it, cleaning it up, and improve
>> the integration with patchwork / git. Throwing it away
>> would be a very bad sign to all those countless people
>> who've gone through the pains of actually working with
>> the bugtracker.
>
> The simple question is who is actually going to sort out the mess its
> in?
>
> Who is going to look after it on a continuing basis?
>
> If there isn't ownership, nothing is going to change.

Actually I feel the real problem is that:
- people did not want to get bugs assigned to them (at least that was
what someone told me in the past)
- we're lacking a good notion of package or recipe ownership, so even
if we had someone acting as a bug manager, (s)he would have a hard
time to find out who to assign an issue to.

and of course it takes discipline to look at regular intervals in the
bug tracker to see if there are issues that affect the recipes you
feel responsible for.
A discipline that few people have and that is also easy to forget if
there is only very rarely something for you.

So it is more of a process issue.
(btw this may be something that could be picked up by the TSC).

Frans.


