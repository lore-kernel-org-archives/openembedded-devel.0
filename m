Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TVegQ-0006u9-BO
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 09:38:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA68P9PP012214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Nov 2012 00:25:09 -0800 (PST)
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 6 Nov 2012 00:25:07 -0800
Message-ID: <5098C962.8000504@windriver.com>
Date: Tue, 6 Nov 2012 16:25:06 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
	<k708l4$3tt$2@ger.gmane.org>
In-Reply-To: <k708l4$3tt$2@ger.gmane.org>
X-TagToolbar-Keys: D20121106162506353
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qA68P9PP012214
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH][meta-networking 1/2] netperf: import recipe
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
X-List-Received-Date: Tue, 06 Nov 2012 08:38:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2012=E5=B9=B411=E6=9C=8802=E6=97=A5 18:52, Koen Kooi =E5=86=99=E9=
=81=93:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-11-12 02:42, Xin Ouyang schreef:
>> Git-Url: -
>> http://git.openembedded.org/openembedded/tree/recipes/netperf/
>>
>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com> ---
>> .../recipes-support/netperf/files/cpu_set.patch    |   24 +++++++++
>> meta-networking/recipes-support/netperf/files/init |   51
>> ++++++++++++++++++++
>
> The initscript is missing LSB headers and hardcodes $sbindir to /usr/sb=
in.

The hardcodes would be fixed in V2.

But I think we do not need lsb headers, since no lsb init function used=20
in the initscript.

Thanks.

- Pascal

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQk6XuMkyGM64RGpERApMQAJ0f0YMb53j54pjbXUpl7b6RCjWm7gCgrbd/
> 8Ainle5y7zDc8tFdcr9gCsQ=3D
> =3DK3FI
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
- Pascal


