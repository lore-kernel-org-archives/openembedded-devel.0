Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUh64-0007Ms-NW
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 18:29:09 +0200
Received: by eekd49 with SMTP id d49so267750eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=e0gdNc1VBZe9r+QnFEcwjL/dcYxso17cBbhlVLaobkQ=;
	b=U44+XUr/+u6nD/6pprnmblXZ4tEIhBamW8krmnqnP1exl8Gyi8aoweY8GfVSqLGzb9
	z+9+TVDbLvZrfH1dK8ZkIiPv22ZTP9GkpsBOfu5zVxRmb/hyO/5FccatLMezsYWUa/ai
	1BYcEh6ZCHUjDK2/+WfE24ejechdxuNWENQY09lnC01m3D5v3MgshG5EKsmjAhcbfZsT
	ziucDvsFTlossV7gGVXlrgFJh3iqD35wfQTX3Krv5uGhygjpGO33ZGascomm4jZ9atPQ
	jjJJQzS8jT+aFM92YUibeu8L8xyjLUETL2Pky0qFg2yNc9XxC2kFvJ/JzSAEMBti729+
	lqSA==
Received: by 10.14.127.198 with SMTP id d46mr800019eei.101.1337185147402; Wed,
	16 May 2012 09:19:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 09:18:37 -0700 (PDT)
In-Reply-To: <CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
	<4FB3A136.8020607@mlbassoc.com>
	<CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 09:18:37 -0700
Message-ID: <CAMKF1sp4c4bvh32evDREWKQr92A4q=xFGzBdqQn1ecZYBt1kQw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 16:29:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 8:03 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>
> Thanks, looks like I'll need it :) =C2=A0By the way, we successfully pull=
ed
> gcc-4.5 in our layer and are building with gcc-4.5 on angstrom-v2012.x
> right now. Since you're on 8148 as well, and in case you would like to
> stay up-to-date on what we're doing, just check
> https://github.com/DFE/HidaV from time to time.

btw. angstrom/master will be using gcc 4.7 so you are on your own if you us=
e
4.5 with angstrom/master and it can be a long battle. Best course for you i=
s to
use 2012.05 angstrom stable where you will get gcc 4.5 from toolchain-layer
and it will be maintained there if any issues found. So you dont need
to duplicate
the efforts.


