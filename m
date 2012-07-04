Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SmSCO-0001CK-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jul 2012 18:13:04 +0200
Received: by yenl13 with SMTP id l13so6239769yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2012 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1uftSNC6iBil8m0qsMULNW0j5M14ImB4mlHzY/Dw5LQ=;
	b=uGOXhukoz/E3czzcBef8Ufrq0bYE1TAI9uCwUttRfLg8QEIQYEqwxmSY/ctTcNIXfK
	nSyGHSEcndlm/j4VNiOtvRv+cmuohlH5hLT3VBahXqnfZ8fIMWWo8GrJ0zEmUQHgqoJI
	JuWSSe7d1OIqjNIJsZJmQ4Z8Xdi2PVKbH+OZh7nNw4XBjjaK7Ih1x1Gff3jbqxPAE9id
	tSqlOIOrgdTmKL7uAR8Zq9pxMcnvYvuNCW+IU7CCh7nhagXMzPJRUyiyFbKQZxVukK01
	o9WhmvZb+TBLrR5//mmxWID7oVhilsPdLTpH6ocZN3pOQP2l4ou0A9Xj0ClktoR9rviU
	jyaw==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr14150648igc.36.1341417717289;
	Wed, 04 Jul 2012 09:01:57 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 4 Jul 2012 09:01:57 -0700 (PDT)
In-Reply-To: <4FF464DC.8000005@linaro.org>
References: <1341416451-20362-1-git-send-email-schnitzeltony@googlemail.com>
	<4FF464DC.8000005@linaro.org>
Date: Wed, 4 Jul 2012 18:01:57 +0200
Message-ID: <CALbNGRSeA05bJhQSWhYkyj1cpMY-gU70_TCEExVDUPyyXyk5MA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lighttpd: follow oe-core to 1.4.31
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
X-List-Received-Date: Wed, 04 Jul 2012 16:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 4, 2012 at 5:44 PM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 04.07.2012 17:40, Andreas M=FCller pisze:
>
>> a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
>> b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
>
>> inherit systemd
>
> Can we finally get version without systemd? With current state of
> meta-oe I can use lighttpd 1.4.31 without systemd but this change will
> make it impossible again ;(
Sorry but I cannot follow: the bbappend does nothing but adding
systemd - or are you working with the meta-systemd patches?

Andreas


