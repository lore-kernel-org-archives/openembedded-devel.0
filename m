Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R22Tz-0006H0-SP
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 16:55:07 +0200
Received: by fxi1 with SMTP id 1so199033fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eYqP/EDWOC43LOEEcmyqQ+2cbQ9lZCyPP7JTr/hnYY4=;
	b=lQMixOolm7JJnqIghOpxs/pBKtDhCbanhPekBvKaKbo+wi/GXsqb28xsZsfOqFe/Qh
	Lb+v/pn+wYtFDMQDMegZJliLIf3xtiqFvDPYoSniY8k2eqtLlPseEI4W4UNHiJy1/r2F
	uboqd6bl3+ybqTme0rrkFcs1ulbywSlrkFr58=
Received: by 10.223.53.201 with SMTP id n9mr606490fag.26.1315579803159;
	Fri, 09 Sep 2011 07:50:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q23sm2961117fae.1.2011.09.09.07.50.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 07:50:01 -0700 (PDT)
Date: Fri, 9 Sep 2011 16:49:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909144955.GM4124@jama.jama.net>
References: <1315579610-3943-1-git-send-email-errordeveloper@gmail.com>
	<1315582224-5245-1-git-send-email-errordeveloper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1315582224-5245-1-git-send-email-errordeveloper@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] binutils: Update from 2.20.1 to 2.20.1a
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
X-List-Received-Date: Fri, 09 Sep 2011 14:55:07 -0000
X-Groupsio-MsgNum: 34175
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B9BE8dkJ1pIKavwa"
Content-Disposition: inline

--B9BE8dkJ1pIKavwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2011 at 04:30:23PM +0100, Ilya Dmitrichenko wrote:
> Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>

Please use -C -M params to git format-patch (or send-email) to it's
usefull for review and smaller...

4.5MB and I still don't see my last response

<snip>
Have you tested it? I don't see setting S
something like
S = "${WORKDIR}/binutils-2.20.1"

So I guess it will fail even to do_patch.. :/
</snip>

resolved


--B9BE8dkJ1pIKavwa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5qJ5MACgkQN1Ujt2V2gByjWwCghAVDsht6qSinFndYPsNf2Ny0
ag0Aniz99I7Gfp8s7rrpmgMbVeJMLO6X
=woMi
-----END PGP SIGNATURE-----

--B9BE8dkJ1pIKavwa--
