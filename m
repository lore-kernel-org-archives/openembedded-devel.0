Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 553BC6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:51:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a136so8712901pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=GtcDhuGzIgM89fkIutIfJ54ahDc3Up0MXwQxuKlsets=;
	b=wY1kxfvocgVXY+jyeio8CpIg2TB6GhqKMe8lF85YLp1wLkqn1ontKrWOET5jy9wvTS
	4vGNYnd2O7CWj1bqO0s4G0fXVNS/LAxbt6r+QHiJx3UUAx2t4sKhRD1NYFrXcGndmgnz
	WGZJOzUgseZSaHWXOGZOhSzQOOzkZ4pngLiGBkY1ibp576a0ubTsGGTZm+KJ/JcYcDB+
	Ns4G/kEdVz3wBSxkkVh0BeFimmGvgUt8/xH69zkp9SBDP0PlD8uIpCTtdHwzVZyF90ym
	rV/K0PIlpMcbMR0kL36jrQJO2zg7Vbz3Lu+e86WfZVzR5+L0gFP88pzrVatr4k3OU8ZQ
	R5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=GtcDhuGzIgM89fkIutIfJ54ahDc3Up0MXwQxuKlsets=;
	b=d7hKk+blPhvZnOSsS+bc8+5F8xEZFwJau58waNRKBjAOjSEm6PzwgccOglWkgy9T5i
	jgNzv/TXSYnhwOmCuSec+bHeZs3ix/rliFBgbhH2v+I+tHZULaKih9na8u7DAacRJL1a
	zhVYpgGrVAavIUUgPMv6WZngi0679flzhhT9gOJU9sj9DFK3FqitqXx36ayxdMSqAXpl
	8EKwkwB8t9bGQVQDkb+js/0+bj1vp2e0mMIjqDK9Xn1jqlzwoLdq1nC+Cf7hcVZ7bUzW
	LEuy3Eoc0tUhtrMK0YlLpPZFc9Xo5i5/ivZ5ot6kBJr3rKlU9LOkojoyywJi8A7dd7re
	El4g==
X-Gm-Message-State: ABUngveC0v7IUD0XmJc1o1nPrLNNS44xdfFHlc43phv3KRRq2wA/COJfe27JHGxjiSrH3Q==
X-Received: by 10.99.112.65 with SMTP id a1mr51121925pgn.31.1478019064823;
	Tue, 01 Nov 2016 09:51:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bd37:fcaa:669f:4910?
	([2601:646:8882:b8c:bd37:fcaa:669f:4910])
	by smtp.gmail.com with ESMTPSA id 4sm43373355pfg.66.2016.11.01.09.51.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 09:51:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYLT0bL4bgvkL_zJ1OGfOyvdxCooJ5V45ngtgW_pJFx0g@mail.gmail.com>
Date: Tue, 1 Nov 2016 09:51:03 -0700
Message-Id: <5F5E2368-C835-42C4-875F-B88DDB4EFF2D@gmail.com>
References: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
	<CAJTo0LYLT0bL4bgvkL_zJ1OGfOyvdxCooJ5V45ngtgW_pJFx0g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe] packagegroup-core-eclipse-debug
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
X-List-Received-Date: Tue, 01 Nov 2016 16:51:03 -0000
X-Groupsio-MsgNum: 63679
Content-Type: multipart/signed;
	boundary="Apple-Mail=_55719505-BF0A-4A56-90A3-91EE1943840D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_55719505-BF0A-4A56-90A3-91EE1943840D
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Nov 1, 2016, at 5:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
> 
> On 31 October 2016 at 19:51, Visser Sander (2) (Consultant) <
> sander.visser.2@consultant.volvo.com> wrote:
> 
>> meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
>> RDEPENDS on gdbserver but that is no longer provided. Should RDEPENDS on
>> gdb instead?
>> 
> 
> The gdb recipe builds a gdbserver package.  There is a very rare bug that I
> can't seem to find where sometimes gdb won't build gdbserver, but I've
> never been able to figure out how and why this happens and you can fix it
> by rebuilding gdb (bitbake -C unpack gdb).

it can be excluded if someone excludes GPLv3 from accepted packages
perhaps thats are case here ?

> 
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_55719505-BF0A-4A56-90A3-91EE1943840D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgYx/cACgkQuwUzVZGdMxSEdwCdH44Xggm2CDBB18MdZloMERv2
M2AAnib+2LhGGRxWDBW2T6McnDBPyU4x
=eTaa
-----END PGP SIGNATURE-----

--Apple-Mail=_55719505-BF0A-4A56-90A3-91EE1943840D--
