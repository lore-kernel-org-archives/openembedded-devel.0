Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdodL-0004O6-S9
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 21:53:29 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7510686pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 12:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3FmnS7z8ojnoya3EFAYL75SXawcsuDW4uiVB3xfCpHw=;
	b=xpGPIQfpOh7hIkYPkT2IZtS7Kaj8jzbecqs0b8YMjxECUO7KBZjikOvLZM7MoHRT/c
	J5vLcbBRNUnHLXHQ/naaFxjGHmuEu9e7f9neyghBP8Myi8tb4dkYnGRdfeRrxmvkcBX1
	0Qyxl/fkcDmBwONG8Xqn10gBGDNLEHt3knCjM1Ej7tEYAbE4KYKfEqSlAfApyLolb124
	9aIllJThfSEw33NJszS8Tuk38m6jLMhLNA6j7twcQntf4x3aZNkvEiMKICxGMjKoRiwS
	qkFeDDJyfk9RMw2gQOHTNg4vlxeJWqt2VpG1IBPe1GMbQUxLlX08yAeorAWRYpHbjDmV
	FhYA==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr62117487pbc.33.1354135152222;
	Wed, 28 Nov 2012 12:39:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 28 Nov 2012 12:39:12 -0800 (PST)
In-Reply-To: <1354134260-19880-1-git-send-email-cazfi74@gmail.com>
References: <1354134260-19880-1-git-send-email-cazfi74@gmail.com>
Date: Wed, 28 Nov 2012 18:39:12 -0200
X-Google-Sender-Auth: 8cza2d5mPLsp8qFpxpOHe1ignJI
Message-ID: <CAP9ODKo-DdJFiWJttKiC=n8wfja2mYEnr8UPznrBG-yhFZgM5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lua: update to upstream version 5.1.5
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
X-List-Received-Date: Wed, 28 Nov 2012 20:53:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 6:24 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> COPYRI=C7=B4HT: (C) years now up to 2012
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>

Just clarify that this is the reason of md5 has been change, in the
license check.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


