Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Tukfd-0007o8-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 15:06:16 +0100
Received: by mail-oa0-f46.google.com with SMTP id h16so3988943oag.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Josn3ZG71knTN6WAxddL7CvODYZ0YYC0bVOhNzMpv9s=;
	b=F3mujqfBMoxoa5k97hvWM7NBnffHDB31+3m33VYDAuOg+ghJKceAAoV872jgcK4p6K
	6B6gkgRfnJ2FxT4odrbYV8BMMi7YsvUcIafwS/ly3u9gZ9DD40WurFUjwzH1U9SmXixf
	W4NyvYqMjyTXofTkrEKLXh0nhbjCWAEtAyOgoLaSfuDy0o/v46qKRhAoXsqbL4j2itjL
	0L7TZrL2sKxwHGw4tNKH3Fce8a3S91mf/4LggVvme1MdU5uS/AutvEJlqcuglNC/yd/6
	kJBALYcdXis2s3lUdiNhyswWok2D4CHokPntgY7Ewvm43KkEW06xg2971PAzAZFBn7uC
	kr7A==
MIME-Version: 1.0
Received: by 10.182.207.70 with SMTP id lu6mr60008752obc.78.1358171430039;
	Mon, 14 Jan 2013 05:50:30 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Mon, 14 Jan 2013 05:50:29 -0800 (PST)
In-Reply-To: <CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
	<CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
Date: Mon, 14 Jan 2013 14:50:29 +0100
Message-ID: <CAGiJk9fbMO7T0FDp--XRraQy6A7y=bmY4U7xNjpA8GiEYDQ1cw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 14:06:16 -0000
X-List-Received-Date: Mon, 14 Jan 2013 14:06:16 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/14 Burton, Ross <ross.burton@intel.com>:
> On 14 January 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> There is a meta-games FYI, I think this is possibly where these recipes ought
>> to have gone.
>
> Agreed, these are gaming-specific and not generically "multimedia".

Is this a suggestion that other similar recipes already in meta-oe and
oe-core should be moved there as well?
To be specific SDL comes to my mind...


--
Regards
Samuel


