Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYF9v-0007MB-UF
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:32:21 +0200
Received: by mail-vc0-f172.google.com with SMTP id hx10so1344456vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=Ljnm360F886vQhOEsRHJyF6wNPhX/NFQkjLbUiQ49JM=;
	b=iOuuTO1N92Pzfjp3hiGNLfTonwNVlZHHIOQ7+zopApkGLNKBeWGzt3FaDjkgaVFG4M
	SYbWN9mw6q52Y+xHxWAqwqfs+CBjBPBjicim4svrkCWXF78pkJ/fNUlZI9M71gzjCD5H
	6uQ2W4HaXcFdyKCNsC38ZHXRcls0XXphf5HM3Awk6PmYV36lw/tXvAbiaUWTQ3KV/aSm
	BEbK75h+0lwN9gHC14Nd4AS/9PPMMKpsM77LxSlW3n4/aDGHW3HyZTn2OECKRQIGyMaQ
	xVlzWIOLEJ/nBFC+N8oL8xQollVRmCRz1DpJoKNVsvcohW6ygM6U4631+RvDpVB4xIkQ
	USGw==
MIME-Version: 1.0
X-Received: by 10.220.77.2 with SMTP id e2mr3529840vck.63.1367583264580; Fri,
	03 May 2013 05:14:24 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 3 May 2013 05:14:24 -0700 (PDT)
In-Reply-To: <CAP9ODKpdxj3rcu3ABA7XZWEJgZZwe9oEyhb21Bvk7e8U=1r=yQ@mail.gmail.com>
References: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
	<1367578619-19890-3-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpdxj3rcu3ABA7XZWEJgZZwe9oEyhb21Bvk7e8U=1r=yQ@mail.gmail.com>
Date: Fri, 3 May 2013 14:14:24 +0200
Message-ID: <CALbNGRS+hOR9m+DFs4Ww4Vz+LhUMq94Ox9AE431zcSBg9yVDrQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/master 2/3] orbit2: update to latest stable / fix build with glib 2.36
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
X-List-Received-Date: Fri, 03 May 2013 12:32:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 2:07 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Fri, May 3, 2013 at 7:56 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> license change of FSF address only
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Your commit log is not accurate when comparing with the code.
>
Needs V2 anyway for minor fix of gnome-disk-utilty

Andreas


