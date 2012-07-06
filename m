Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Smyxa-0003sP-4V
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 05:11:58 +0200
Received: by pbbrq2 with SMTP id rq2so13343886pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=xlZkVIcqQL6dLlB9uCLU2CbAOmeXbxypbQHZxGSGoqs=;
	b=jSCvfalruro3b7cWANr7e4ss3SN1l2Shqr+/d0/TBR5p0/MBhQAPtV9gxBYtRIiEF1
	4Yje/WYxsJarKZdA4xNZUDc4d0bDg0G/1l2Z9/a4a3YTwdCeVyesK6rBrJ3gPBDWTiG6
	XZTn+DeSialYCFAH41pkIu1Ncvc2ZGkkYdh9XivE1CvC1uR0WoqC1yJOfXfeyLBxzntM
	EXJ82foOPDNop1j4r7R30o06HMAmGH1Pmi7kWAZEtKC/xeI95f+/IuyNhUih8szsWyA5
	F1E/Y05lvQmwfPWGBxjkchg9/3+P4KB/iyUaUoWnssTBSh37ww4PkjZoA/E0s9P8eC98
	8IHw==
Received: by 10.68.232.201 with SMTP id tq9mr32476294pbc.70.1341543651911;
	Thu, 05 Jul 2012 20:00:51 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id
	qd10sm20922152pbb.38.2012.07.05.20.00.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 20:00:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20120705201635.GC3708@jama.jama.net>
Date: Fri, 6 Jul 2012 07:00:46 +0400
Message-Id: <80F4FA6C-14E4-4392-9796-D4D5D7090C3C@gmail.com>
References: <1341518383-20990-1-git-send-email-elvis.dowson@gmail.com>
	<20120705201635.GC3708@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded] lighttpd: Rename to lighttpd_1.4.31.bbappend.
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
X-List-Received-Date: Fri, 06 Jul 2012 03:11:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jul 6, 2012, at 12:16 AM, Martin Jansa wrote:

> On Thu, Jul 05, 2012 at 11:59:43PM +0400, Elvis Dowson wrote:
>> This commit renames the lighttpd bbappend file to match the recipe =
version
>> provided in poky/meta-oe/recipes-extended/lighttpd
>=20
> This ^ doesn't make sense to me.
>=20
> Recipes are provided by oe-core and path
> poky/meta-oe/recipes-extended/lighttpd doesn't exist in poky repo =
AFAIK.
>=20

The comment should have read poky/meta/recipes-extended/lighttpd

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-extended/=
lighttpd

I will resend the patch, after correcting the comments.

Elvis Dowson



