Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TrpQg-0004I9-Gg
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 13:34:20 +0100
Received: by mail-pb0-f51.google.com with SMTP id ro12so10022218pbb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 04:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KdDI00+04VjZAHhkFmT3/zjSY97E+XYoGMd63TgH/3M=;
	b=gsuKew3CAD6CaOAGQ41Jjai7feKGe8Ddhivvqqk2HUQrpYcw/v/CW9eGS3dV2d3rWh
	i/Pm/19++RzD7fGKyvB53oQZ7FfJ6hLz8fhhly+4OQ80KHaW6CHhsePP87R1DGD0tz3s
	+jlqHZjcmfsRo62xydGB/V3afpSXoWLbbxwWR3Wb13wadkFRcuBkRmiatcplw3q9USLY
	11VubvK/OEf5mS+J9/X2i531nlhxlf53f7Z4CZUGYWe/j4Rg7X2H7Oo1T9hwwsUQxCyn
	T1GLPbbDBMg1WBobWvvvrl4YUV6G4g8KPQRfM3R5/U0fsObgsG3JEFoEHalur0dEpbrH
	y/AA==
X-Received: by 10.68.227.97 with SMTP id rz1mr177240502pbc.54.1357474750002;
	Sun, 06 Jan 2013 04:19:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v2sm36757509paz.36.2013.01.06.04.19.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:19:09 -0800 (PST)
Date: Sun, 6 Jan 2013 13:19:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106121908.GF3272@jama>
References: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
	<1357440504-13057-2-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357440504-13057-2-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH] gtk+3: update to upstream version 3.4.4
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
X-List-Received-Date: Sun, 06 Jan 2013 12:34:22 -0000
X-Groupsio-MsgNum: 42533
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 06, 2013 at 04:48:24AM +0200, Marko Lindqvist wrote:
> * fix.build.automake-1.12.x.patch dropped as upstream has fixed
>   the problem addressed.
> * COPYING has had formatting changes
> * In license segments of source files FSF street address is replaced
>   with URL.

Merged, thanks

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpa7wACgkQN1Ujt2V2gBzR4QCfR1493F9b2V3WXL4xqSQ0uHbS
P+QAnjj/ltLyhw5gUyYwQYSgnh5kzvPa
=HVqK
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
