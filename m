Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 537AA73307
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:59:05 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ey11so5115696pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=akXJnpSMSDemb+C6NqgGj1UR5WlPTH9RB2CMcRRxyCE=;
	b=BTsrgtfzKsrPa8xwP6bpm38CHlay2S45UUPMTS0CC0Qgd+669GAHFlSXBK/1y26QuO
	p7wDwW167XIq0VHMyZJtlylyyUNcgpWfNOqW4XD7inZ6NtsGMReOvGIwJM1fRpCp/M/F
	g/uoe9GQ9HvTxHBk4iJyMs4NQDYSJyszu8eSkbdFqwpMuIU2+K61DUgsEatznbqE6eK0
	uS3r8CX3ScX9nHWgPiwSghmC2uTcrZHbnavkoJABwk5AGY9jW4GISSVfGwnBKb4gh3FU
	UgJdCopSyeaugeuNjce4WZWKhHBke9JBElcRW48ZiZh1+KPQlhDykRgjQggx4Ggj2VIy
	f8Lw==
MIME-Version: 1.0
X-Received: by 10.68.253.233 with SMTP id ad9mr48257181pbd.167.1423673946933; 
	Wed, 11 Feb 2015 08:59:06 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Wed, 11 Feb 2015 08:59:06 -0800 (PST)
In-Reply-To: <CAENGNhcaECYxdBDdYqBYj6Zu-2kz93SPa+HaAZo-xRzNuaUPvA@mail.gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
	<CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
	<CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
	<CALbNGRT0r612O8Yn+Vsn-3jCXk8i0yqhAc-Df9ukBiLRV5gRhQ@mail.gmail.com>
	<20150206002755.GA3594@gmail.com>
	<CAENGNhcaECYxdBDdYqBYj6Zu-2kz93SPa+HaAZo-xRzNuaUPvA@mail.gmail.com>
Date: Wed, 11 Feb 2015 17:59:06 +0100
Message-ID: <CALbNGRQ6S10MLWXD44e8g5fjrkHR7Mu32v5UV-4eX06zfPp59w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Wed, 11 Feb 2015 16:59:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 4:10 PM, Raphael Philipe <rapphil@gmail.com> wrote:
> Hi Andreas,
> Have you seen my log?
>
>
> Regards,
>
> On Thu, Feb 5, 2015 at 10:27 PM, Firstname Lastname <rapphil@gmail.com> w=
rote:
>> On Thu, Feb 05, 2015 at 09:34:02PM +0100, Andreas M=C3=BCller wrote:
>>> On Thu, Feb 5, 2015 at 6:22 PM, Raphael Philipe <rapphil@gmail.com> wro=
te:
>>> > In my local.conf I used:
>>> >
>>> >  PACKAGECONFIG_append_pn-qtbase =3D "accessibility"
>>> >
>>> > Attached you can find the log.do_compile for qt5-creator
>>> You attached log.do_configure :)
>> My mistake. Here it is:
>> https://www.dropbox.com/s/ekuys8g3ud9vet7/log.do_compile.1044.tar.gz?dl=
=3D
>>>
>>> Andreas
>>> --
I had no time yet - but target qt-creator (and your log) is definitely
on my todo list.

Andreas

