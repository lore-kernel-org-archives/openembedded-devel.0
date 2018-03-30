Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B377D7476F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 22:41:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 15:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,383,1517904000"; d="scan'208";a="29850517"
Received: from ttorling-mac01.jf.intel.com ([10.24.14.201])
	by orsmga008.jf.intel.com with ESMTP; 30 Mar 2018 15:41:09 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20180330223954.55841-1-timothy.t.orling@linux.intel.com>
Date: Fri, 30 Mar 2018 15:41:08 -0700
Message-Id: <FE2EDAF2-9A3B-4E57-AAC4-B3D64520A405@linux.intel.com>
References: <20180330223954.55841-1-timothy.t.orling@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python3-pytest: fix broken fetch (3.4.1 -> 3.4.2)
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
X-List-Received-Date: Fri, 30 Mar 2018 22:41:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

wrong subject line, disregard, resending.
> On Mar 30, 2018, at 3:39 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> Fixes: 99d18a6bc1a915ef5f07116e0fe684f56825a165
>=20
> In above commit, only the python2 recipe was updated, but
> python3 recipe also uses the SRC_URI from python-pytest.inc
> and is currently broken (do_fetch).
>=20
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
> .../python/{python3-pytest_3.4.1.bb =3D> python3-pytest_3.4.2.bb}      =
     | 0
> 1 file changed, 0 insertions(+), 0 deletions(-)
> rename meta-python/recipes-devtools/python/{python3-pytest_3.4.1.bb =3D>=
 python3-pytest_3.4.2.bb} (100%)
>=20
> diff --git =
a/meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb =
b/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> similarity index 100%
> rename from =
meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> --=20
> 2.14.3
>=20


