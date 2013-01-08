Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TsVtE-0004wU-Bi
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 10:54:38 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so225389pad.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Rksp3N+ZgCJHHSLtc1+BPrvITjxhQlE32uezLHc5q+0=;
	b=08dif9iZAhuI5j53y3EhCxd8JSq7Ag3JTWIWjsXeYbXEwWQZ6QHFowFEfm6qWOcqBo
	H1GGpTtlf62eo3Spq55vECaluD6mAmaJr4ToUTlWbbesHtTybfc5bLP9tYrWJcToRYKZ
	8D142MKzc00UxbQFECo9WJJb6wzrfjKsu9QpGv064DOVXU46nKM7GmtIfcT0xusuiKcy
	BAn8Eo2J4IAZSrYpMUIiMcH5lkLUjeIA66aDevIUdohIqbhLD1+/hBbezu5adFOrAxRh
	kbBLybPMuITTqA8OcNvBRrytmLsm5aigkf8XczlpLbzfa7xh5M9YlI7GJ3HYf+9U9mOF
	9Jmw==
MIME-Version: 1.0
Received: by 10.69.0.74 with SMTP id aw10mr196238853pbd.87.1357637965162; Tue,
	08 Jan 2013 01:39:25 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Tue, 8 Jan 2013 01:39:24 -0800 (PST)
In-Reply-To: <CAJTo0LaMwJtHVdXyugtVPivvT8qNj1smq2fL5yzTw0wrSAv6TQ@mail.gmail.com>
References: <1357631895-9535-1-git-send-email-fransmeulenbroeks@gmail.com>
	<CAJTo0LaMwJtHVdXyugtVPivvT8qNj1smq2fL5yzTw0wrSAv6TQ@mail.gmail.com>
Date: Tue, 8 Jan 2013 10:39:24 +0100
Message-ID: <CACW_hTaH330bdp0Z1C8veF+a2oqJr=cauZGBKmvdttq8TQ=a5Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [OE-core] [PATCH] inotify-tools: new recipe
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
X-List-Received-Date: Tue, 08 Jan 2013 09:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

@Ross:
for me it is not really clear what should go in oe-core and what not (let
alone what should go in what dir)

@openembedded-devel:
feel free to take this and put it in meta-oe or any other layer where it is
felt to be appropriate.

Have fun!
Frans


2013/1/8 Burton, Ross <ross.burton@intel.com>

> On 8 January 2013 07:58, Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> wrote:
> > This patch is provided as is, in the hope that is it useful for someone.
> > I have no plans to become the maintainer of this recipe or so.
> >
> > I was not too sure if this is something for oe-core or better suited for
> meta-oe
> > The patch is against oe-core.
> > I've also decided to put it in recipes-extended.
> >
> > If there is a better layer than oe-core or a better dir than
> recipes-extended feel free
> > to put it in a more appropriate location.
> > (and if you do not like it, feel free to ignore)
>
> This should be in meta-oe, please re-submit a patch there.
>
> Ross
>

