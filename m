Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id AA9D265F41
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 15:09:44 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so2688721wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2014 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=RA9XKDuN8W2khJPZ1rmCVCZ9BM7OLe3sU+T7+hS5hZQ=;
	b=ixHqrvXc45J2nT6B1OvU2KETAg6s8oedgPbSBPe8pXNC/9uyOQaYyCLuInpPAIbVdR
	pU8HwyBlBWUHszSDIpYlh6Ln9e9853HM49moNWjNd6WguIKpaNZBLQeW/DGGKIjCXzb0
	wuqokItGzD8kN//pNLy2XJTFpTLkuOm5fM00hfKlWzKTXu9Sgr6vxaGJwM8aUKK9djGe
	2l4OuyM4vUMrSNnG6hGjDO9zXQEDFZ5Xztr8nDia7/V+p+bvA29FD9jT133tTGUXaTqu
	OJaNzlJpW3nX6iErDiPIAHcvQ1K7VyQCAMD9m0p7SXKzCNOXrJiWQDu0pnvyBpK6apjK
	yT9Q==
X-Gm-Message-State: ALoCoQl/lxQFpNvoDzK0wVV0WDZAXrLi9nV+6gcxcZl767I9Z3nxrlKegsMtLy0P+p/a/GAeJZuP
X-Received: by 10.194.171.167 with SMTP id av7mr3706464wjc.32.1399561357569;
	Thu, 08 May 2014 08:02:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d57a:d7dd:850d:82ea?
	([2001:610:612:0:d57a:d7dd:850d:82ea])
	by mx.google.com with ESMTPSA id km2sm1626372wjb.13.2014.05.08.08.02.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 May 2014 08:02:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
Date: Thu, 8 May 2014 17:02:33 +0200
Message-Id: <A31D944B-B8FC-4ABC-A4EF-1450A2E9D117@dominion.thruhere.net>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:09:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mei 2014, om 16:48 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> Hi all,
>=20
> Sorry for the cross-post but I want this to have a wide audience.
>=20
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.
>=20
> Everyone in agreement? =20

A plus one from me.

> Should I expect any hate mail over this?

This is the internet, of course you'll get hate mail :/=

