Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Ta4-0000Jj-Qo
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 09:10:58 +0200
Received: by iwn7 with SMTP id 7so518976iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TUt+F9VaHhWbWGRTnEKssbc5LgIkXZUmROBhSDfgn14=;
	b=odvB4DB/UeLHfwO3Rzz4KMSVtKCCay9qTvQCjEsNdU/EQ63cl0RkbqUjgOOT/bOR+b
	WsiTyvyDhgVF52myGRD+v3wUf76bkwNIzBrcSYaBKXwEQ2o/9kMefBhh+QOOOZjvAyEN
	V9+6L75Lfo6p+xELx3U9jC4VHicMp9wc/2jyM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Yj9v1aAHcVXe3M9mzaBfclDu8CQ2WaQtnlY8Z/3icTNOvrJqmHR1ldlsTd9UacgGKB
	S239FYXz8iBcDG20Cb5AAsaF8Jla2nXjHyRSVdL1ZmFMZ01l94sMLcyMEW/PwXvZg8XL
	nUbCuoY7c2AcqLUWyWk4bY+nJ6LsDbM3ncJC0=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr3098639ibk.36.1286608231169; Sat,
	09 Oct 2010 00:10:31 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 00:10:31 -0700 (PDT)
In-Reply-To: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
Date: Sat, 9 Oct 2010 09:10:31 +0200
Message-ID: <AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sat, 09 Oct 2010 07:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/8 Cliff Brake <cliff.brake@gmail.com>:
> master branch has been merged to testing-next and is ready for clean buil=
ds.
>
> Last week, we ran into quite a few problems, so I'm not tagging or
> moving the testing branch forward.
>
> Note, we have moved the testing cycle from Fri to Fri instead of Mon
> to Mon. =A0This is because people more likely have machines with spare
> cycles over the weekend.
>
> http://wiki.openembedded.net/index.php/Testing
>
> Thanks,
> Cliff
>

Thanks for doing this Cliff.
I've got my 6 builds already scheduled on our autobuilder.I will
report back on the wiki.

One small remark: timewise, I would prefer creation of the branch of
your friday morning. For us europeans the weekend is already started.
Doing it a little bit earlier allows people like Steffen and me to
kick it off before we go home.
Alternately it might help if we can define a time before which the
branch is made. That would allow a cron jub or so to kick things off.

Frans


