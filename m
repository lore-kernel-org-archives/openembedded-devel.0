Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 92B4C6EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:33:40 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so1315605ykb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=0Hrs1JgKJ3Qw8xPygLJx7vUPWZdrLkWTlsr2ktyadE4=;
	b=UOJZj/DXV02O9GRZeah3fgKHdUVcYRqzo/4TjVWU9QfMFnCwFbdhBSsSdUca5v/Nqi
	DZYpEOUsjnbEklxSe8iuXxol926DUEKfTjnRQrW4/1wkHxR3wYqJQPmMWaJ0Jo94vx9Y
	SSyq5i+xWEBMgKST5QppSIu01HgPGSUxev1H0kOYLptzNDiZ3mMLsqFy7j/wy2Ny8JxQ
	l0KWJ6j0jhZn5/2rfb1C2yiFshKf6HYFUwYUJvQLCpGPjCxnjpAbwEBjWP2wT/EJBNEg
	QHqUmY9B72/zrZIGlaU/3HsUfcECtmLe4lXSli/vTKCFb5v8hG4u3SJevc+fRxRV7T0/
	U1Ow==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr16289240yhc.47.1393522421830;
	Thu, 27 Feb 2014 09:33:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 27 Feb 2014 09:33:41 -0800 (PST)
In-Reply-To: <7167B982-98BA-4A58-8FD2-C8BA54D56F25@gmail.com>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
	<90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
	<CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
	<7167B982-98BA-4A58-8FD2-C8BA54D56F25@gmail.com>
Date: Thu, 27 Feb 2014 14:33:41 -0300
X-Google-Sender-Auth: 2Qb1NQsWrbHZkTh17Y1pdAdhHBw
Message-ID: <CAP9ODKog_2cBFMehH5rWfh6HgA7oseWrdR02LUp8u6p4=Fn3Qg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 17:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 2:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 27, 2014, at 9:28 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> As explained in v1, Dropbear does not work.
>
> it does work. you just have to use non-empty password.

and how you think we can allow user to override it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

