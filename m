Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 837DE71ADD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:16:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 22:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,443,1500966000"; d="scan'208";a="132712433"
Received: from tirizk-mobl2.amr.corp.intel.com ([10.252.199.51])
	by orsmga004.jf.intel.com with ESMTP; 26 Sep 2017 22:16:08 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <6d06fafc-14cc-f8b1-1d73-f83b6f6436f7@guy-morand.ch>
Date: Tue, 26 Sep 2017 22:16:07 -0700
Message-Id: <48605F2E-2616-4585-9503-3C953AE0A518@linux.intel.com>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
	<CADNbA1rjSSNANYovFMQEAW3bWHbc3Ey4JtuCUPWMrZa9--MR8w@mail.gmail.com>
	<6d06fafc-14cc-f8b1-1d73-f83b6f6436f7@guy-morand.ch>
To: Guy Morand <guy@guy-morand.ch>
X-Mailer: Apple Mail (2.3273)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Wed, 27 Sep 2017 05:16:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

FYI, I have a related series in progress, but I can and will happily =
rebase on top of yours. My series is much more complicated for reasons =
that I will send to the ML when I get a couple more dependent packages =
being picked up by matplotlib properly. It will be worth the wait :)

=E2=80=94Tim

> On Sep 25, 2017, at 11:31 PM, Guy Morand <guy@guy-morand.ch> wrote:
>=20
> Derek,
>=20
> Arrgg I just copied the recipe from my meta-layer that has a different =
structure! Sorry for wasting your time with my worthless patches, I'll =
try better!
>=20
> Thanks anyway for your feedbacks!
>=20
> Best regards,
>=20
> Guy
>=20
> On 09/26/2017 12:40 AM, Derek Straka wrote:
>> Also, could you incorporate the changes into the existing python-* =
recipes so they both use the .inc files.  It makes my automated updates =
easier.  Thanks!
>>=20


