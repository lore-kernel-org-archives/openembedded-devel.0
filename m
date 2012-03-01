Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S37AW-000703-5I
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 15:39:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2012 06:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="116538972"
Received: from unknown (HELO helios.localnet) ([10.252.123.90])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2012 06:31:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Mar 2012 14:31:11 +0000
Message-ID: <13179298.lVtZb3KUcf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CALbNGRQBCeQj=0dHAwAddM5cvJZhKLzyk8J5+WLAh7QFQBx_rg@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
	<CALbNGRQBCeQj=0dHAwAddM5cvJZhKLzyk8J5+WLAh7QFQBx_rg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Buildhistory, was Re: [OE-core] do rootfs does not create log files
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
X-List-Received-Date: Thu, 01 Mar 2012 14:39:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 01 March 2012 13:38:04 Andreas M=FCller wrote:
> Would it be big effort to have the package scripts (pre-/postinst,
> postrm) handled by buildhistory?

Do you mean you would like the contents of the scripts recorded in=20
buildhistory? If so, I guess this is possible; if we just output each s=
cript=20
to a separate file I don't think it should be too difficult. Making it =
work=20
nicely if you switch back to the old (symlinked) mode would be an extra=
 trick,=20
though I'm starting to wonder if that's worth continuing to support.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


