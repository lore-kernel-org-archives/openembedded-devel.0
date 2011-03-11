Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyARD-00057m-67
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 23:04:12 +0100
Received: by fxm19 with SMTP id 19so1405489fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HaP1C0tRUn8bhM0GDxttgqNCU+K2Ym6AvV6+ZneGAyw=;
	b=GJ6d3HOJdTJe2j7NXgGTaEtMaLfvg0ZW/Z0CjAPIZ+qr0uAZ4h69Q875fM8Lt/abJD
	pOcnCMJoJWrCnywZvvRphN8yqUYEU8GMsSlK25HlgKzR06dY4dBMq4EeZzs4TZig5+WM
	dfCdfo2WBJkGPZRrjZikn9mBOxS/4+ORhQzsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=HNrpMcjDa7jIkzKssExeQFVZ4kdnoxf/pWmn0VcEstK/xdz4+4OGYHNXvji6FrbcBS
	VxzDHedweBWi6Kr4sEr9JbLpDMCHzLWK/1cUUAdo/n1KjpOftSG/ggNfn2oKSlr0JElk
	rIkFX3xYRrKsVwxRsgzHbrPVcPXHAOM8u0nts=
Received: by 10.223.143.86 with SMTP id t22mr639706fau.68.1299880938468; Fri,
	11 Mar 2011 14:02:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Fri, 11 Mar 2011 14:01:39 -0800 (PST)
In-Reply-To: <20110311081950.GG7353@excalibur.local>
References: <20110311081950.GG7353@excalibur.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Mar 2011 14:01:39 -0800
Message-ID: <AANLkTinnUAukJB_BwFPj_Eg9fpf1VNQPkFopUHeeNQuG@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Mar 2011 22:04:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2011 at 12:19 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> This topic has come up several times now and it did come up again during a TSC
> meeting yesterday.
>
> It feels like the current OE bugzilla is not in really good shape. The question
> is how we are going to handle this. On the one hand it might be good to remove
> as it holds a lot outdated informations and it seems developers are not using it
> at all.
>
> On the other hand this would cut off a service for atcual users of OE.
>
> If we can find a group of people that is willing to clean the current bugzilla
> up improve it and make sure that problems in it are actually worked on it still
> have a chance to stay. We need a clear maintainership for it and bugs need
> atcually be worked.
>

I have been keeping it alive but pretty much thats it. It needs additional time

> Comments? Volunteers?
>

I think that there still is something thats not captured in mailing
lists. Since many OE users
do not interact with lists for whatever reason. May be its known to
many to use some form
of bug tracking system or due to its webinterface its accessible I
dont know could be many reasons
Some integration from commits to bugz id# would be informative.
so if someone fixes a bug then it gets updated via a post push hook or some such

Basically we need people who look into bugzilla and act on bugs in
addition to mailing list
and patchwork which is additional work. I personally would be happy if
users could report issues
on the mailing lists since that unifies the workflow.

> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


