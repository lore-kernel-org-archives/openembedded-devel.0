Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbXPx-0006Bf-Lb
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 15:06:15 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so392514dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=uQFfUILdY83gWatVhHwPhdGgJMi32KTOqWg/eSX9QfM=;
	b=uP9FuIGhRQmHw8tsGY4TlIUXDRmDq5AUHVJ0laNcXWQoVTvWZtUk513BsjJ60qxyeW
	28/UOt8SpGdvEGfg+C2GlOfQ25dGG1hdtLc3CAgQrx97/+BhDIvI3DJ1Re1pZPma3T3+
	/u1bWmAxLOHZdQM6RvVJUM2LsXbeCBBBtuGhZ8CPAxw9rzq4EfLaqcvMvwN0rW+07zdw
	CjxUkUQ/RCDlh7VgASHeNk+opTHN2eQLBv9ZyI+2kleLpmp/Mm3wzKhA64NfGTG7Kq/O
	Xr+0n33fc9kKdAs3Zn1CX++FFq2M4FMpgNFIhj+qiEv8WlyxbYaH40M+yg8YnbsQJSne
	ZSZw==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr5173571pbc.33.1353592326501; Thu,
	22 Nov 2012 05:52:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 05:52:06 -0800 (PST)
In-Reply-To: <CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
	<20121122105331.GX12637@jama.jama.net>
	<CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
Date: Thu, 22 Nov 2012 11:52:06 -0200
X-Google-Sender-Auth: Bgz4uY05QuJPaJUiOX-lylUWAfc
Message-ID: <CAP9ODKrJMzmE3Ph4OGReB8B-pKiBEscBHxJCQh_Wqj0LLLEWmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Andreas M <C3@jama.jama.net>, BC@jama.jama.net, ller <schnitzeltony@gmx.de>
Subject: Re: [meta-efl] should epdfview really be under meta-efl?
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
X-List-Received-Date: Thu, 22 Nov 2012 14:06:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:41 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Nov 22, 2012 at 11:53 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
>>> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
>>> purpose or did epdfview end up there
>>> due to it's name similarity to epdf ?
>>
>> I think so, CCing Andreas for confirmation.
>>
>> Cheers,
>>
>> --
> 1. Where should be the new location?
> 2. I have no strong opinion on that - I asked here for the location
> before creating the recipe :)

I ended adding meta-efl just to use it in a demo. So I support the
idea to move it.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


