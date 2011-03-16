Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Pzoao-0003v4-Np
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 12:08:42 +0100
Received: by vxd7 with SMTP id 7so1472891vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 04:06:58 -0700 (PDT)
Received: by 10.220.67.219 with SMTP id s27mr158141vci.41.1300273618083; Wed,
	16 Mar 2011 04:06:58 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.220.180.141 with HTTP; Wed, 16 Mar 2011 04:06:38 -0700 (PDT)
X-Originating-IP: [78.106.51.57]
In-Reply-To: <1300185619.3759.155.camel@mattotaupa>
References: <1300185619.3759.155.camel@mattotaupa>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Wed, 16 Mar 2011 14:06:38 +0300
X-Google-Sender-Auth: cx5_qlKvzgabDUzYJl0fe9U0tpc
Message-ID: <AANLkTinBEW6OAdkaU-zK03s+=M+zMYjd0PPguUTR5shA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: removal of `angstrom-2008.1` in dev and needed updates
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
X-List-Received-Date: Wed, 16 Mar 2011 11:08:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/15 Paul Menzel <paulepanter@users.sourceforge.net>:

> It looks like some other configurations files and comments still refer
> to `angstrom-2008.1` though and probably need an update.
>
> =A0 =A0 =A0 =A0contrib/testing/testbuilder/README:bitbake (e.g. angstrom-=
2008.1/qemuarm/console-image).
> =A0 =A0 =A0 =A0contrib/testing/testbuilder/README: =A0 =A0./testbuilder -=
D angstrom-2008.1 -M qemuarm console-image
> =A0 =A0 =A0 =A0contrib/testing/testbuilder/README: =A0 =A0./testbuilder -=
D angstrom-2008.1 -M qemuarm -S
> =A0 =A0 =A0 =A0contrib/testing/testbuilder/testbuilder.d/testing.conf.sam=
ple:DISTROS=3D"angstrom-2008.1 angstrom-2010.x"

I've fixed testbuilder entries yesterday.

--=20
Yury Bushmelev


