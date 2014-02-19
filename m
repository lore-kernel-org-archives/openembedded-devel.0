Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 540A96E7D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 12:02:17 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i57so247432yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 04:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tfFy8gRR4Yk/C8WYgR1RNGXIC8EM/a7OkYVyrDWgjpE=;
	b=QdI7PbFXOKyJQh9QsmL3I/bkoTaM2FCqPQ7ZgkXJJwNUH6LmJ/OKuG+zUBEQQ2GF2m
	0YsO1vPKEDmWGnvqfazdYMiEhIx+iWl9n68FybTznYA94MdS8d+Uflk5EXSyPz6zH6/S
	WEDv1PXQyU9P033KL50VC36saCD9pKFw053rmTtfqoq4G7qwpvqf3TwdueOcUkQpcNDA
	6WYikdhARFevAVhOX+mE9E6RqvXqisfR16VzDobWBx1+uGxR1g+EPPPuOlnRnTKiaa1o
	ZIe32sLgwUPFa/XTC0S/C8VtKHJ0o0xFUDiuSOWMyaiTeBtJ+cfU7INiBQM5edbK6QIk
	dmmw==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr32417783yhh.78.1392811338017; 
	Wed, 19 Feb 2014 04:02:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Wed, 19 Feb 2014 04:02:17 -0800 (PST)
In-Reply-To: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 19 Feb 2014 09:02:17 -0300
X-Google-Sender-Auth: yRgzBTkuXGSuKffYy6M_DASOiak
Message-ID: <CAP9ODKphyAUC2T6Nq4SvEG9Lic_2w85k-q9kB95A-4m8cVKMYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] nspr: Rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2014 12:02:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 1:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Applied, thanks.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

