Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8A3F60097
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:49:18 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so6049582wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qokM3yubZxmkdYYxuGgVs/Dabv1DEXSSNSq6zX2fpf0=;
	b=kzdg6Y/mjk+vXtrftS48b6za8PDDMeEVcTUj6T6WyHikXAOgT1rJwjl/o6m+4KaQdn
	PRiwoIYdV4Nt6ZIHsLS3/1wxnFpgsiOkoI4vbZvdHADNKKxR0b4viHEt1eg9iF6Nrkbo
	/ynXo18o4/jup2SqmgKrUzbX8ZINNI+0OXvu6UTcr2VmvzElJLrxyjm2/9xJcqkSLN10
	ESmwQfdXkGpjiOqE5WgKbv24/zXjp/YwfNB5XUqPMg0cwToiAa2Tc9vqmcTjGC2jKhvY
	uSf2oAzqAIv74B1bFZPesZMQtOnNCzVBU/CHXxY1cRL8WgdaqLtKLORgIIEGxiVz0cJ1
	X2vQ==
X-Received: by 10.180.73.18 with SMTP id h18mr22793114wiv.34.1413827359073;
	Mon, 20 Oct 2014 10:49:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y5sm10393390wij.0.2014.10.20.10.49.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:49:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Oct 2014 19:49:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141020174918.GC2455@jama>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][WIP][PATCH 1/5] qt5: upgrade git recipes to 5.4-beta1
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
X-List-Received-Date: Mon, 20 Oct 2014 17:49:27 -0000
X-Groupsio-MsgNum: 52568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline

--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2014 at 07:33:48PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Whole series sent as WIP mostly because qtdeclarative build for qemuarm
triggers ICE in default gcc-4.9, will send final version after resolving
this issue.

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRFSx4ACgkQN1Ujt2V2gBwrkACfSpHcyjMn4rWyrNOphVYLdZGL
YuYAn3VSCriF3ogxQxu/12NaGxA+eA+X
=evxj
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
