Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxQkq-00085t-Mz
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 22:17:12 +0100
Received: by eye27 with SMTP id 27so248234eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 13:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=PU7ob3vcgEWvBBBgT7KjYRsg5gtx+PHxbCzwoQZV62g=;
	b=TE4/dPc1zBxwhdtbwLi0KcMX5M1q7D8zOSurX55OJ8B6dDNYI5ZJD9hvLltAbVxhBA
	ULaYOE5fbSEyH6w0i0w8L1iTkAZkcKRmvcA2ZzxT1ngKoTlnMS/xHijwq585B38OQCxa
	TeKowx3Ze2mR16p68prQWQ+f7jJ6PipASNdIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=inpPlk90h2OBxqwK1+zjdC4u8PYV2jo2AfyV7up1W1ByrrXcDrlRikVjXMHcaolbAr
	tAYjDcDyRz7u7YBZlTAUoUAOOu2SWmCxFDzugkH4cNeFObOVOSo5X9EK8qE+N9r8ral4
	lSmhuB7o6PHGCMR0aoItyQXPLfneiK7iXcltk=
MIME-Version: 1.0
Received: by 10.216.46.135 with SMTP id r7mr5081306web.21.1299705336254; Wed,
	09 Mar 2011 13:15:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.216.35.81 with HTTP; Wed, 9 Mar 2011 13:15:36 -0800 (PST)
In-Reply-To: <4D70D51C.5000608@balister.org>
References: <4D70D51C.5000608@balister.org>
Date: Wed, 9 Mar 2011 21:15:36 +0000
X-Google-Sender-Auth: VOXsU3emlv0L7NdGx5WjLZiz5Cc
Message-ID: <AANLkTikVxyov6x+HZwJ=XygmWEWau1Xk5LTo=C5ubby8@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: cmake build failure
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
X-List-Received-Date: Wed, 09 Mar 2011 21:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2011 at 12:03, Philip Balister <philip@balister.org> wrote:
> I tried building cmake (not cmake-native) last night and it failed becaus=
e
> it couldn't find LibArchive. This used to work. The build failure was
> confirmed in #oe.

I'll take a look on that since most probably it is my fault ;-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


