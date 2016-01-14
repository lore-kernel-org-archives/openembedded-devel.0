Return-Path: <brunovern.a@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1996FF4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 17:23:10 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id h129so72225485lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 09:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=ecqXAM+xS2Cqb8Ky7sM2IFfx8Ge1Mqi8drYIBNYtwo0=;
	b=UOGANaMyPa02RuXqfVEZ2bK/H8IWSyhgHMwqBbYuOlzi3qVVaAWIp5KMPXJ+Yki8HX
	LHuyrZTn3VKXjgGqBZmJeYu3QSjA99OXyHM5fUqJeOVlg26A4EkAjwXmC+rl1pvrOu+c
	kufEhze5F7gNgSBcX6WMJoKCk6GDBD35CPjdFRt4Z+kav8WB9M0XY5M5cahKSYRLEJC8
	PRx1Cja2GLtKg8OJBMD32Tj3wIHx4SEVm8TyhO9PY5ERod9eyGv+oZU+DIYV5Fz98Q6/
	5RjbOj3NtWRddtyZQdNX4MpA/+YbdiaH/HtrOVTuUAqg/wc1ScNBpZpXhkPbkfZxvWuy
	6qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=ecqXAM+xS2Cqb8Ky7sM2IFfx8Ge1Mqi8drYIBNYtwo0=;
	b=f3vGW8/g+KuIL1VxxnX7YEko0TfoOBlhL5RnmWoHcLBLWV0ZxQW5yTDA/iemUtD5WD
	eHYtkhLlW5l0yHjEzv4GCQEFEvr81TvKnONtwjzdEIb/FsdndBL4T51auZVICmNbI5eD
	6JhxgLj7/Ytap38czv32DellxmUpjb4gJTyCpCkg4xFjV3CE3nuEE9jBwiYT8ux/dwE4
	5tNQQTT8POdtonBEFlWE0vLOLqFWE5myFphTG0trujhOZ0u3Ot9JIKAkSqNQxYySGCeh
	T5UB+SVYp7PPNgzD4rtC+QsImg4ntFOrChIOAyIz+7n28pWCsAa8JAJcktiGLbhQttIe
	nZUQ==
X-Gm-Message-State: ALoCoQmGn3m4FqSDYrWcGJRqipUChMUxOb5R6ytqYZm8suR5ePzOkhn88MA2XZpA/zplxA1yK0CkZ4t4cZnOGzXr3AT5s7bG6g==
X-Received: by 10.25.22.167 with SMTP id 39mr1392710lfw.153.1452792189654;
	Thu, 14 Jan 2016 09:23:09 -0800 (PST)
MIME-Version: 1.0
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
	<CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
	<DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
In-Reply-To: <DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Thu, 14 Jan 2016 17:22:59 +0000
Message-ID: <CAF3KAoTy2xZ6a2KC3ci95fQ1QnH9-KSAuD2jpZ4vLeoqAc_ZQw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] OpenLDAP modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2016 17:23:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks it works also.

The second issue, that I still cannot resolve is that OpenLDAP requires a
.la or .so to load its modules.
The openldap config specify a file name like "back_mdb" and expect either a
back_mdb.la or back_mdb.so

but both la or so are limited to -dev in Yocto, I don't see how to overcome
this rule???

Regards


On Wed, Jan 13, 2016 at 7:36 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 13, 2016, at 8:46 AM, Bruno Vernay <brunovern.a@gmail.com> wrote=
:
> >
> > Adding this to my bbappend did the trick ...
> >
> > TARGET_CC_ARCH +=3D "-lpthread=E2=80=9D
>
> make it -pthread and add it to LDFLAGS
>
> >
> > I may submit a patch
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

