Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MbJhA-00043H-Th
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 21:41:13 +0200
Received: by qw-out-1920.google.com with SMTP id 4so91160qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+OiHP01lYIVaswnejBjYl5gUouBFzphJ2h22szv51QA=;
	b=NY0Z9Ta+mDgjESMmxlVGLP53bersUZCXh9mJNTRL/vKWCKIktoh+1s01zyiFQ0esLV
	YFLokykCK1XFOR8QljSLPxH5OhJysySYGbKK0KL/a1C28OFDeHtwlgqX1zZj+VZ7DVSq
	5Dc+fUK37xwLQpjhb4/bXNGpOXjnAcyqRV5UE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=swxPORsXx8lW30LZnJcEmNMhORBYP2eHftRT/neeDrXFmSJ/cQvIqUALRzyQJ32GwV
	0lPfBaHMxyw0v7evs9lEekoq9WPbqTjFCwAeEKg/1h03VOChdwt6UtIEydpjN0HFogrZ
	XgPWzlFCrAW68SqDzjApWiBpO+GWRrG2oUYfE=
MIME-Version: 1.0
Received: by 10.229.2.23 with SMTP id 23mr575920qch.87.1250105085887; Wed, 12 
	Aug 2009 12:24:45 -0700 (PDT)
In-Reply-To: <h5um2o$ioq$1@ger.gmane.org>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
Date: Wed, 12 Aug 2009 21:24:45 +0200
Message-ID: <5f2b60908121224k50e975e5xe710a94ff0c94871@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Wed, 12 Aug 2009 19:41:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/8/12 Koen Kooi <k.kooi@student.utwente.nl>:
> On 12-08-09 14:49, Bj=C3=B8rn Forsman wrote:
>
>> Any suggestions for a fix?
>
> I'm cleaning up the arago updates and plan to push them into OE this week=
:
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3Dkoen/dvsd=
k

That sounds great!

> When that's in it should give you something that at least builds for
> dm6446-evm.

What are the chances that it will _run_ on the dm6446-evm?

Regards,
Bj=C3=B8rn Forsman


