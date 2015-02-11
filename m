Return-Path: <rapphil@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD69732EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:10:45 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id n4so3016587qaq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 07:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=8byjz/0Njpqye2jRfPhydjlMzy56Up3xoXntBfEmIJU=;
	b=Zx/7VUIpO4YQ7zWXsxALdJUSz7T8Kz5r7xoTP9yfVsJ3VcEAoxPJY7CxAgtxKI9VZ/
	lkUXFMS1B7N9W5kKKN40brrUZu/fUJjEplcmycwdX5KqLBWM0anXHSS9wyadKvPYpIIm
	ykHBpog8ixhUxMIUjnSh1Q8HhqasUuJInWBO9/whCfAX/NBccmeIvGnFX5rwGLHbQWp3
	o6uK/Ush5dmoYwzZ+6LiQTGj0/+UApei4eC7M9WEeZRKR0uxG+zS3KIvsCz6uEBKqmhX
	DZ46lToPpmSzsVMgTBQcPaOJnB8+eTkGwgW3YoTJp2fImMDvsvC4mdXU+CNCkr7escPL
	i62A==
MIME-Version: 1.0
X-Received: by 10.224.60.193 with SMTP id q1mr64016720qah.86.1423667446230;
	Wed, 11 Feb 2015 07:10:46 -0800 (PST)
Received: by 10.140.142.147 with HTTP; Wed, 11 Feb 2015 07:10:46 -0800 (PST)
In-Reply-To: <20150206002755.GA3594@gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
	<CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
	<CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
	<CALbNGRT0r612O8Yn+Vsn-3jCXk8i0yqhAc-Df9ukBiLRV5gRhQ@mail.gmail.com>
	<20150206002755.GA3594@gmail.com>
Date: Wed, 11 Feb 2015 13:10:46 -0200
Message-ID: <CAENGNhcaECYxdBDdYqBYj6Zu-2kz93SPa+HaAZo-xRzNuaUPvA@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 11 Feb 2015 15:10:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,
Have you seen my log?


Regards,

On Thu, Feb 5, 2015 at 10:27 PM, Firstname Lastname <rapphil@gmail.com> wro=
te:
> On Thu, Feb 05, 2015 at 09:34:02PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Feb 5, 2015 at 6:22 PM, Raphael Philipe <rapphil@gmail.com> wrot=
e:
>> > In my local.conf I used:
>> >
>> >  PACKAGECONFIG_append_pn-qtbase =3D "accessibility"
>> >
>> > Attached you can find the log.do_compile for qt5-creator
>> You attached log.do_configure :)
> My mistake. Here it is:
> https://www.dropbox.com/s/ekuys8g3ud9vet7/log.do_compile.1044.tar.gz?dl=
=3D
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

