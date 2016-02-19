Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A17C1759B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 17:53:14 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so81842845wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pvXXvyo+YgtndfmDaxCykAxgweQ1WZga6t9gJRvCSV8=;
	b=L8xksDmaGmLYjFKwBhzHOlbFeUFrEWwDF3m9CG//e0G1Mfo75kEqntpxtULty61npE
	ez3SrdaBEiwgmGvrqDz2YGqJxhb5gqVzQnqTXMGsXSSFjUPG1k/GQ0+BmpxJZofNj8be
	IeyjNA262oFVht5lztqvgQRZ2feyz2k58tgW3dps3GLI0EV2bMiibVMgpGRAsgjfJSnV
	eMAYnba5jJq8xEg+SSjYABXQZuCD5LsB7xYcXKuRon9lE2/vNXTnLRkea07ilodDhn9N
	Y8YVhE7uZ55H7ahVd3dOfa6cdXH0ZLJMvfzPDaITWBp6JrL4+heQYMZPlV4dK/9b9SZn
	v+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pvXXvyo+YgtndfmDaxCykAxgweQ1WZga6t9gJRvCSV8=;
	b=g+GYqRmv9vwF5Jb53vkss5gKdGMVp2tRDaduugXwo1OP77Q5tI/LEKGWuvSDCKdf7R
	Nnq0tfjqkWDItqsrx3KemJ2NaCEEBr7tqBafbPvo+J8qHedN8eLxPNOwDlp8nkGMN8/H
	3n1dkCZhbzImXHHiB0SkSJQ1m7ynq7Cpmn4zBh9TyvH4gDKCU3MFbBgu2pLdR8/aRs5W
	XQSav23fhPErqu7fMZFvdySvXu2dsil290I4RBTi9uE+NlHARjUnndy4X+c7OSETIRgT
	iHB8yGpSGRwbglvY7cZxXYWYmaHkwjK5LHmPb5Ch3T5Mt9JR1PUfMljmHB1GC3NlKzDx
	Ee6A==
X-Gm-Message-State: AG10YOQnwutgyj1vbYjioMth3e29Iu15hjGyliFpTQXr6bZeUzG4OKw74vNJaUquvNozng==
X-Received: by 10.28.211.130 with SMTP id k124mr10927535wmg.7.1455904395584;
	Fri, 19 Feb 2016 09:53:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i1sm12126490wjs.45.2016.02.19.09.53.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 09:53:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Feb 2016 18:53:45 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160219175345.GA2588@jama>
References: <1455890654-2396-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455890654-2396-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][WIP-for-5.7][meta-qt5] qtwebengine: update LICENSE/LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 19 Feb 2016 17:53:15 -0000
X-Groupsio-MsgNum: 60047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 19, 2016 at 03:04:14PM +0100, Martin Jansa wrote:
> * this should be part of the upgrade to 5.7, but the changes
>   are important and separate change has higher chance to be
>   noticed
> * it's highly recommended to read:
>   http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-free-qt-foundation/
>   to find out how you're affected check which files/tools are
>   included in your builds
>   OE @ ~/projects/qt-project/qtwebengine $ git grep QT_BEGIN_LICENSE | sed 's/^[^:]*://g' | sort | uniq -c
>      11 ## $QT_BEGIN_LICENSE:GPL-EXCEPT$
>      67 ** $QT_BEGIN_LICENSE:BSD$
>      17 ** $QT_BEGIN_LICENSE:FDL$
>      61 ** $QT_BEGIN_LICENSE:GPL-EXCEPT$
>     261 ** $QT_BEGIN_LICENSE:LGPL$
> * change in chromium's LICENSE is only copyright year update

With few more smaller fixes this finally builds (including nativesdk).

Latest version of all these patches are in jansa/master-5.7.

Fixes for currently used 5.6 version are already in master-next (and
jansa/master).

Regards,

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbHVp4ACgkQN1Ujt2V2gBxrlQCgmLMXRaYNYv6sHH2CVBbyKllL
yX0AoLFLvDCRpUWXbpyKXj0BRxZbIxyX
=l0Ti
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
