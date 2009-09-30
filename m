Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Mt5xk-0007pL-6k
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 22:39:51 +0200
Received: by ewy20 with SMTP id 20so437010ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 13:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=B3PrawsX6ielVFcDEgF6ORhWluiwxedOetnxJNRCius=;
	b=RgTj6HleXzO1qpaXnmySmJeEWIwcWZqzIsHeQ2oiaay5zJhiAAy04AXhBL9yU+uNuR
	MudgdFS6GM15d2W3F+mxsRKGvTe5ACeme332W7YuSMsksS8oTMcSYNLPo9wlTz9fPiGC
	QOXeMk98iSL9MKDLwjJTA1x6qda3Y1LpqLPy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=V0Aalyx4q+l4HW8Rprzv8/BfkRmBetxDNjb1kdRVYQB5rmdE27S7prM7cEBSj343GL
	6L2Ea3B2Z6d5byXsHBb8Xsh9nnpaYQFrkbA3JfSItMbfTxaDTkiF+Wf5+M1BgDPE8Hta
	W0BpBJzL+GBOnGB+pRO7P7MHzXttIOaPBmtu8=
Received: by 10.211.128.11 with SMTP id f11mr6749949ebn.62.1254343143683;
	Wed, 30 Sep 2009 13:39:03 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([195.222.82.230])
	by mx.google.com with ESMTPS id 10sm26281eyz.10.2009.09.30.13.39.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Sep 2009 13:39:02 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2009 23:38:28 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
References: <200909291522.29707.anarsoul@gmail.com>
	<4AC2020F.4030501@eukrea.com>
In-Reply-To: <4AC2020F.4030501@eukrea.com>
MIME-Version: 1.0
Message-Id: <200909302338.32500.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: tslib-1.0 is broken on rx1950
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
X-List-Received-Date: Wed, 30 Sep 2009 20:39:51 -0000
X-Groupsio-MsgNum: 13280
Content-Type: multipart/signed; boundary="nextPart6094090.96fv853DMF";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart6094090.96fv853DMF
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: base64

0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIgMjkg0YHQtdC90YLRj9Cx0YDRjyAyMDA5IDE1OjQ4
OjE1INCw0LLRgtC+0YAgRXJpYyBCw6luYXJkINC90LDQv9C40YHQsNC7OgogCj4gbWF5IHlvdSBw
bGVhc2UgdHJ5IHdpdGggdGhpcyBwYXRjaCB3aGljaCBzaG91bGQgc29sdmUgdGhlIHByb2JsZW0g
d2l0aAo+IHRzbGliIDEuMCAmIHF0IGVtYmVkZGVkIDoKPiBodHRwOi8vY2dpdC5vcGVuZW1iZWRk
ZWQub3JnL2NnaXQuY2dpL29wZW5lbWJlZGRlZC9jb21taXQvP2lkPWRmY2MxOGJmNDliMzcKPiBi
ZWE2ZDMxMTYyY2MyZWI1ODM1YTgyMmJmODMKPiAKPiBFcmljCgpOb3BlLCB0c2xpYi0xLjAgZG9l
cyBub3Qgd29yayB3aXRoIHRoaXMgcGF0Y2gsIHRzbGliLTEuMCtzdm4gd29ya3MuCgpSZWdhcmRz
ClZhc2lseQo=

--nextPart6094090.96fv853DMF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrDwcgACgkQRM6pQpltKE4cOQCgtmek5dcBIksWm569CTDzzux2
3BIAoNr01QYXRCxt7QPT2h/u2ZVaSJEe
=em47
-----END PGP SIGNATURE-----

--nextPart6094090.96fv853DMF--
