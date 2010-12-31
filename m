Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1PYcBo-0001vZ-E2
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 11:26:29 +0100
Received: by wwi17 with SMTP id 17so11675261wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rV+oqHOtNPqBeB9J8nZqTQv7jM+/nIpb9mhZziIAfKM=;
	b=UqRDk+t31PyClwzikY7XQezehFOz9y+G3dAGMjEU5koYi9uSNPNILcmGb6CXjsSjLQ
	hQngj4FMVGPmrwYgvND2cian0qyOVGh81LaStBJIWFzrR0DF8NLQXhMsyAeFfKUEtfU5
	I8E0RgnbH6Ao/OnRcQH8ZWCCOvqW1hasgJv+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JO9BpaI1LguBhAENglfz7G8HMDxBma3Hnau5N0USoonMZtiJTuvEept9svUszNwggf
	PqA01fvIjKbOczzcbOeW8KzojkP4SOgVSHA9ZC6EIBQ7JW8LQ0uv+HBpN4NVVVL1nJmD
	uZgbsHZ6WaNtTcaY0ojLN5rdyHe0E73JtRkOM=
MIME-Version: 1.0
Received: by 10.227.134.206 with SMTP id k14mr3655518wbt.5.1293791170705; Fri,
	31 Dec 2010 02:26:10 -0800 (PST)
Received: by 10.227.10.205 with HTTP; Fri, 31 Dec 2010 02:26:10 -0800 (PST)
In-Reply-To: <1293763348.17519.11220.camel@rex>
References: <1293763348.17519.11220.camel@rex>
Date: Fri, 31 Dec 2010 11:26:10 +0100
Message-ID: <AANLkTimKHkwjhcf_txFk9WPmdk1Njjpi_iny6p7H0WDq@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Fri, 31 Dec 2010 10:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 31, 2010 at 3:42 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> There is a little friction around bitbake at the moment. I think after a
> discussion I had with Chris earlier on some things are clearer and its
> probably good to summarise how things stand.
...

If I'm not wrong, Chris just finished the Poky-Sync on a personal branch:

https://github.com/kergoth/bitbake/tree/poky-sync

AFAIK he's trying to stabilize master before merging Poky's changes.
Just ask him :)

Regards

Andrea


