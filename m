Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgX6Z-0005da-Ga
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 08:05:32 +0200
Received: by bwz10 with SMTP id 10so2646862bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BO2lhOQdZFJm4tzliwhWNjjs9htHDBxQXMMZaLgb0xA=;
	b=R3pk8w9XPzCQFWAWzb7v88ZoVWQL6SSTKAZrwCVo7sbMksySzCqmumy6EwbYgAhQiU
	mrYbWfx/AFE63P7syko82Luhixz1bdSK15612KLEOCS0GNkqYc7FjoORHu7oRL8I0d8u
	KNaNF2dm6OjyJPHRbfMjwI0dLXU1ZbRzihw/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KpmsYXL9AhP6AYDru0Tt0WxtqchkX3L8Wr1VVq9nP7eU039UF7auuvkE9uV0dpD9ia
	XwWIvUYzzzDEzZJRMC9PK80Sugcrd6W7g8AWN+093xR4RPocOGm46ip3DKy9fadtkEw2
	/iBHDl8NyaQhRgHsY3kGdnx7jCI+81L+aMPvE=
MIME-Version: 1.0
Received: by 10.204.0.83 with SMTP id 19mr5974901bka.67.1280901929492; Tue, 03 
	Aug 2010 23:05:29 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 23:05:29 -0700 (PDT)
In-Reply-To: <AANLkTinxkRqnaxxRWGv8Cqudx2t6YYXfFfK2r4LqOch_@mail.gmail.com>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=EvHvOcpqYp1rZx-C0hBnQbZneJW2L5og6eBZ4@mail.gmail.com>
	<20100804021340.GA6206@gmail.com>
	<AANLkTinxkRqnaxxRWGv8Cqudx2t6YYXfFfK2r4LqOch_@mail.gmail.com>
Date: Wed, 4 Aug 2010 08:05:29 +0200
Message-ID: <AANLkTikgD4AVCJRjL4rFsXPV5ZBLsp6giors59OVM4mn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 06:05:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

>
>
> 2010/8/4 Khem Raj <raj.khem@gmail.com>
>
>
>> > I dont think this has been pushed yet. I have it staged in my tree
>> though
>> > I am building from scratch lets see.
>>
>> oh indeed it is pushed. Well well. We should have got rid of inherit
>> autotools_stage in mass as well but I have a patch for that.
>>
>> After gettting two acks and in view of the PR thing, Koen pushed it
> yesterday afternoon (his and my TZ).
>
> Wrt your remark about getting rid of autotools_stage in mass and having a
> patch:
> Can you submit the patch for review so we do not duplicate work
>

Nevermind, saw the patch after I submitted my reply.

Frans.

