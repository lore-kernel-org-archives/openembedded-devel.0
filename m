Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QpN5w-0004oK-Bq
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 18:17:56 +0200
Received: by yib18 with SMTP id 18so1841645yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lxHF0hMcebIKmrnDO4yDoEwXTrhnoaXmgQXKfwEkRLg=;
	b=h3xHfVc75sOebhbXSjnrsi5WV+c10rHLIZLAdpHarlwGVizU6hNlMov+C1Bw4u16+3
	THJ8DuE1iICoyLjz+HT8oLxGLh0/jlqD1vvgw0kizSX/MwIbxN5ca6PsnQwmjZCfPHKQ
	dOt+3t+0qiqaRzCSfaAMgmvmVPc8KIkXG3KhA=
MIME-Version: 1.0
Received: by 10.236.184.105 with SMTP id r69mr3223398yhm.179.1312560811287;
	Fri, 05 Aug 2011 09:13:31 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Fri, 5 Aug 2011 09:13:31 -0700 (PDT)
In-Reply-To: <20110805154357.GC15632@rhein.zuhause.netz>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
	<20110805154357.GC15632@rhein.zuhause.netz>
Date: Fri, 5 Aug 2011 12:13:31 -0400
Message-ID: <CAFu+nvG7igrBL7ap784Q3H_XKj8eVXqZLH9PvCBibFFu0qz2yg@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 16:17:56 -0000
Content-Type: text/plain; charset=UTF-8

only 2 times under 64 bit


On Fri, Aug 5, 2011 at 11:43 AM, Henning Heinold
<heinold@inf.fu-berlin.de>wrote:

> On Fri, Aug 05, 2011 at 11:38:22AM -0400, George C. Huntington, III wrote:
> > I posted a patch that makes the wrapper script return the error code if
> it
> > fails after 5 retries.  it is on patchwork.
> > http://patches.openembedded.org/patch/7249/
>
> Did you try to compile openjdk with it serval times under
> 32bit and 64bit?
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

