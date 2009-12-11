Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NJ3zy-0007ZZ-9X
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 12:49:29 +0100
Received: by pxi13 with SMTP id 13so616032pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 03:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=EeFmoPiOKWzQbZsZkYsiOuejGMogYwhTlUOJSJ97iHA=;
	b=YbnSscvvhHNQmbOsngIPEl1Fua04Vlkw6BUlyXwGJHoFh+BG8t2DJsVuKwYWMT8HRa
	DIi6/PsIujw1ZcOhNRtaciurLpBfqOxD8LTT16IlHAJ3d117A5J3tEZJOHsoylKQJLqt
	orK0Bs+Op+xDDwjy6z7gUgHfBK0ps8LSEXspI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j8vQcNUWmz0cxb7UueFqTY4rPmWJaJjNpZZLOR3HmfyrDhwcHHTq+LfoDL6awCsoUM
	4huJ0yapMDqwe2PE0oU9Jm6kYRHWV3RmlpP8jvy2ML2OM+FKihX4r05jsU6+Ue3Etask
	sWLz3OxKUPt2tXBbtA/pJ1mHlkc1ysZJfEue4=
MIME-Version: 1.0
Received: by 10.141.90.12 with SMTP id s12mr770169rvl.259.1260532062346; Fri, 
	11 Dec 2009 03:47:42 -0800 (PST)
In-Reply-To: <19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
Date: Fri, 11 Dec 2009 17:17:42 +0530
Message-ID: <ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Fri, 11 Dec 2009 11:49:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

  As I see you are targetting cortex-a9 I would suggest that you use
> later version of
> glibc or even better use eglibc 2.10 or 2.11
>

one silly question ... how do i make my build skip the glibc package and
pick the eglibc 2.11 instead ?

--RK

