Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 633D66010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jan 2018 00:31:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jan 2018 16:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,323,1511856000"; d="scan'208";a="24998286"
Received: from seunghee-mobl5.amr.corp.intel.com ([10.255.231.96])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2018 16:31:42 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <0B2EBCD48D33654381E736352034C70C01B450F4@dor-sms-xch01.digi.com>
Date: Sat, 6 Jan 2018 16:31:43 -0800
Message-Id: <7A6DAFB9-A42F-4240-A70A-0EE078804D29@linux.intel.com>
References: <0B2EBCD48D33654381E736352034C70C01B450F4@dor-sms-xch01.digi.com>
To: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
X-Mailer: Apple Mail (2.3273)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] morty branch not compiling with GCC6
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
X-List-Received-Date: Sun, 07 Jan 2018 00:31:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Older releases are entirely community maintained, so since you need it, =
I suggest you send a patch with =E2=80=9C[meta-java][morty]=E2=80=9D in =
the subject line and go from there.

> On Jan 4, 2018, at 8:44 AM, Diaz de Grenu, Jose =
<Jose.DiazdeGrenu@digi.com> wrote:
>=20
> Hi,
>=20
> Currently the compilation of openjdk7 in the morty branch with GCC 6 =
is failing. I noticed that the following commit in master fixes the =
problem:
>=20
> Commit 65041a6c:  "openjdk-7: fix compile errors with current poky =
master (gcc6)"
>=20
> Is there a reason why this has not be cherry-picked to the morty =
branch? Could we do that?=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


