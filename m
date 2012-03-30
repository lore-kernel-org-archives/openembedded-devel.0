Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SDjtD-0007gv-CR
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Mar 2012 00:01:47 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Mar 2012 14:51:35 -0700
Received: by lahi5 with SMTP id i5so1111786lah.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=6XVT1pNYJgimJUMF4lPI+Kd6/esDdcd7jl5oUsrV8Jw=;
	b=BBRJgR2PpPI/Sse5Wa+vQ5P1N6hkxGboBTASlub4yaAvumDQnBoDOdPQZXqvQMw1hV
	I9VuHsrvX6L3f8XdDFqJiqdjT8AD5j+Ae4ay6ddJ3+zUi8Z9lCJ4Vp5TqQ6iVdO4GDac
	2miQjfadW0afeik9jX+w+VQzvv98mGLIydGPfF//yLAV8qmEpqKyo9l7HyeaC0nN56zh
	jm2SOO2LvKpetEozcyh95BNLSPVBQt0Qb4g5XrL2RIHfsa3vjx2XBJ1OR2KCFr3CSynN
	wSTY1Rnubg191qssLplD6P3o3WFGRpDE/o8OaFK/KlV3jbIbH5jJZKffBMxU3YsT90ct
	1bDA==
MIME-Version: 1.0
Received: by 10.152.106.9 with SMTP id gq9mr109504lab.14.1333144293835; Fri,
	30 Mar 2012 14:51:33 -0700 (PDT)
Received: by 10.112.18.166 with HTTP; Fri, 30 Mar 2012 14:51:33 -0700 (PDT)
In-Reply-To: <jl53jb$bbv$1@dough.gmane.org>
References: <jk7ah9$ct6$1@dough.gmane.org> <jl4ui1$5d2$1@dough.gmane.org>
	<20120330210411.0e514243@eb-e6520> <jl53jb$bbv$1@dough.gmane.org>
Date: Fri, 30 Mar 2012 14:51:33 -0700
Message-ID: <CAPhnLPAPL9cx__EVqFqAd6nkLUxnZqWnEdzkpiQVaxNp2HUT+g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmll9XO2vTa/Dz7PtZzQqJe8aFhAjuOB7PMXfmSeVU+C9CaX4A7E9OFYyRLP+c8ION/jD7H
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] matching release branch for upcoming oe-core release
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
X-List-Received-Date: Fri, 30 Mar 2012 22:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 1:04 PM, Koen Kooi <koen@dominion.thruhere.net>wrot=
e:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 30-03-12 12:04, Eric B=E9nard schreef:
> > Le Fri, 30 Mar 2012 11:38:07 -0700, Koen Kooi
> > <koen@dominion.thruhere.net> a =E9crit :
> >
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >>
> >> Op 19-03-12 05:58, Koen Kooi schreef:
> >>> Hi,
> >>>
> >>> Any volunteers for maintaining a releasebranch that matches the
> >>> upcoming oe-core release in ~4 weeks?
> >>
> >> No one?
> >
> > when is planned the release ?
>
> Not entirely sure, the yocto folks never publish the schedule to OE lists
> :(
>

I'm sorry Koen (et al). I haven't communicated the release date as well as
I should. FWIW, it hasn't been widely communicated to anyone.

The planned release date is April 18th with the buildout occuring on the
4th of April. 2 weeks worth of QA. We have some alternative dates,
generally occurring weekly until April 27th should we need them

As it stands now, I'm estimating April 18th. So a little over 2 weeks at
this point

-b


> - From what I have been able to piece together: in ~2 weeks.
>
> regards,
>
> Koen
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPdhG1AAoJEHZqAkdh1vT6Z0AP/i88rD6YVNf+g0yEcTXTpsM3
> BnaOfHVz223k2q6N/LMVHwxYgYLYIlf36VUkwhZq8S2n85V+YC1cV4+n06xSRZTU
> YRV2wKMHNwKTRGoqdyGX38mo308/YshwNb6f0GBhjRabXDN6jycX8JT9hrdlD07W
> HOV5QNBaX9C3C47+YlUaiUyhgOxiJN1NSI8sk0jS0O990YlwCrw01nHo0v/Lr3sh
> +pRYP+l5ZNwAZXZMDuMV3qjUN6mdF5CdCiz3XAPeMDpeus7P0KAy/CqJ3LyHlIdK
> xBiwruEKUhPKOgjRXUstEIJie4F+dZvHO/YXWzZj7hzwRIV8EGPuDyKB72dyGveu
> P6KGzVea4NLqUCloKVNme8W+68pdB4uuVrxYet3I/BQfhUf9nS9T0/U5H2FQmJ2g
> O3nHJxIC3TV34NWqHR6DSHt8ybm7QAVQUNb1SAcyw8Zydz54fAorAbE2P8DmQSvk
> opCFjPdccY0DsZJ2858DwRH9y6x5+tEdHIBZzSThPT6G2/aSg4lZjuR7CoyJ4FJi
> TB+BZtmVICYrpCIMnIl1qU4UXU/YMSXfZFGB5UASzb3ZR9gLtkOE8n/cm3BdkTPt
> bXbEjMoQ3b0C1xaLgSWJYi/8qwQE11gq88qc6W0IfNbHPh+GnPp9uFuIG6E/p9Is
> h/0G2NvdB54QAZSR9PMd
> =3DuVoS
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

