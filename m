Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwJVo-0002eR-Ev
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 22:57:52 +0200
Received: by eekb57 with SMTP id b57so1404755eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hPuMfbGuvMjCraj/7qNSLdMMlqSdsrKJW/xzanAu9m8=;
	b=mO+8Iww4GPVKT4Etw9bSO2Ult91LVjwhcVUcBjTo+0oG3C8GF1lj5fmY+tax79A/WR
	PNBEwMvj85vgYvN4DWVZabolna+Km00g2p1+dKGI5rc1Qq36xDkTfGcijqoCvKCcp4cB
	EVSUVYtxUdIheLddqJ79yl6LUavDryur/sadBYn5Ni+QMeMDVVIUxHQwj6Yo2WxJBv2m
	PrAYOsHVdzjDqWIQ/ejvxXMuacQwJPcCobRTNTohLb8AgKgzi4O0hEYs6J4T4PlFkgvK
	lF0ERuF/o1PWHkW8y8h8LFiGmqmm8AQm3rgKnuxnPu3OHxWBvAWR3Jf6VtZK9w7OAyeF
	QW0A==
MIME-Version: 1.0
Received: by 10.14.219.198 with SMTP id m46mr19509910eep.18.1343767575108;
	Tue, 31 Jul 2012 13:46:15 -0700 (PDT)
Received: by 10.14.97.141 with HTTP; Tue, 31 Jul 2012 13:46:15 -0700 (PDT)
In-Reply-To: <20120731194351.GX3261@jama.jama.net>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jv9acn$ckm$1@dough.gmane.org>
	<20120731194351.GX3261@jama.jama.net>
Date: Tue, 31 Jul 2012 13:46:15 -0700
Message-ID: <CAMKF1soMHdqC2FepKCftbjyACZTnwPEJsxJ68h5s7i4tYhUDZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Tue, 31 Jul 2012 20:57:52 -0000
Content-Type: text/plain; charset=UTF-8

yes I think SHR was one besides angstrom and it has removed that
dependency. We can keep it in meta-oe just rename it to something
else.

On 7/31/12, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jul 31, 2012 at 09:07:29PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 31-07-12 20:56, Khem Raj schreef:
>> > This class is angstrom specific so lets move it to more appropriate
>> > layer
>>
>> Ehm, it was put in meta-oe on request so other distros could use it.
>
> SHR is now compatible with oe-core copy too, so fine with me.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>


-- 
-Khem


