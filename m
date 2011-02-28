Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu6ZE-0005I9-Jn
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:07:28 +0100
Received: by bwz10 with SMTP id 10so3838582bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=wcUbvuScE7SxgqKvt4WiUSY70xehhL2jdfdT2Eb+kOY=;
	b=C8GhNhdFn170aClSH4VnLrWkmEp9cDHiIdnd/RyIk2/u1bLiysNPQxT9nY+A6v292X
	GXEuoJXky02FjKxSfQt76oCsF2iUOj0EuSaKoBkY8rOKeRfjAZjN1+MEz0ySyxSX9Vm9
	9j9BzE3mfeOppalbsOp7dzHgwnR5eBk9LFA5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=YnZ8J8egp0yqpTLknW8jOMnSdzIVzxv9twASCSXHfygW/ZEGwxYzUQNh0eDIaK8DY3
	Wti0FVfLbJHU+ShwG0TD/H27ysxh9YYYz6EFLWwz2Y0iiJFm8z/18eR54lNHAoqn/pPF
	E1ybFZfpmJ/1lV5thgKrNOWKgZPX5s4F70pno=
MIME-Version: 1.0
Received: by 10.204.33.72 with SMTP id g8mr2544237bkd.16.1298912760431; Mon,
	28 Feb 2011 09:06:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 09:06:00 -0800 (PST)
In-Reply-To: <1298912130.23547.8.camel@phil-desktop>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298912130.23547.8.camel@phil-desktop>
Date: Mon, 28 Feb 2011 17:06:00 +0000
X-Google-Sender-Auth: i-EvBqGecz5XkQBv5zb1NES0z_0
Message-ID: <AANLkTikgZ7sTSN2N_a4RaGnJm9G-iyDwSmUQcZfwMnSs@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] freerdp: rdpepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:07:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 16:55, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 13:26 +0000, Otavio Salvador wrote:
>> +RDEPENDS +=3D "xprop"
>
> I'm surprised that recipe_sanity didn't object to that. =A0Is this really
> what you want?

Why? I failed to see why it is wrong. Mind to clarify?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


