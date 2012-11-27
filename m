Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdJ6O-00040A-GR
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 12:13:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2012 02:58:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="247748701"
Received: from unknown (HELO helios.localnet) ([10.252.122.231])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2012 02:58:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Tue, 27 Nov 2012 10:58:36 +0000
Message-ID: <2370020.Bhc3yRJSZT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1353864310-20097-7-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
	<1353864310-20097-7-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 7/7] hiawatha: add CONFFILES and a php example
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
X-List-Received-Date: Tue, 27 Nov 2012 11:13:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Sunday 25 November 2012 18:25:10 Eric B=E9nard wrote:
> - add CONFFILES so that configuration files don't get overwritten
> during upgrade
> - add an example on how to launch php-cgi using php-fcgi
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---

I've tested building and running phpMyAdmin with these changes and it a=
ll=20
works perfectly, thanks.

I've merged this, 2/7, 3/7 and 4/7. The rest are against meta-oe (altho=
ugh I=20
acknowledge php ought to be moved to meta-webserver and eventually merg=
ed to a=20
common .inc with modphp).

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


