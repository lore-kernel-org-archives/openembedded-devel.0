Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LhEeH-0006eY-1z
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 03:58:25 +0100
Received: by wf-out-1314.google.com with SMTP id 28so2986560wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 19:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=qMY2RG/L9hE0Z21xJIGFqWEdVh7AEAEuxt4mtlP4aDI=;
	b=sF7Q/pMnVy/bBJ9na80Hr7hQfywvXlS4zZ/fJM3tDubnbrPINNb7EnmSFVNalHMeBN
	MsLX8bl7mSM8sZ3kaUX+FEIcJPRFvFs3CaC4kHM7vLlbSgDW/NDZKQfdZXoaqwOOQH7M
	lREC0I1lf9fIz6wtVLGYKxeNp5FwuM7OGoIRU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=MtmJvlT37rSAe/xtbKOR0uqgwFu56C6qxhX1LTjRTL9pS80FdHQvZ1YIUJfKAoKJSZ
	5MrcnjC5qZxSNTJM7anRrWWJj1K7hEOGPlNy6KWsc4XaXafldVWj9lJ9VbVoz9c7NZ1M
	LvLJZ+yJt2L1MLNHlOHfPC3k8EPjbozykCYR8=
Received: by 10.142.43.7 with SMTP id q7mr3433908wfq.229.1236740300815;
	Tue, 10 Mar 2009 19:58:20 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id 24sm13003915wff.22.2009.03.10.19.58.20
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 19:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 19:58:14 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-9-generic; KDE/4.2.1; x86_64; ; )
References: <180e2c240903101840j87d5ce6w1d1af520b488eab4@mail.gmail.com>
In-Reply-To: <180e2c240903101840j87d5ce6w1d1af520b488eab4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200903101958.18551.raj.khem@gmail.com>
Subject: Re: gpe-scap-1.3 patch for mipsel target
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
X-List-Received-Date: Wed, 11 Mar 2009 02:58:25 -0000
X-Groupsio-MsgNum: 8339
Content-Type: multipart/signed; boundary="nextPart13032986.UpbKJhmtiy";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart13032986.UpbKJhmtiy
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 10 March 2009 18:40:55 yajin zhou wrote:
> Hi everyone, I reported this bug in bug tracker but got no response. So I
> post it here again.
>
> http://bugs.openembedded.net/show_bug.cgi?id=3D5061
>
> The gpe scap version 1.3 has a bug to be built for mips target. The patch
> is here. http://bugs.openembedded.net/attachment.cgi?id=3D13835

Looks ok to me. Except you might want to generate a -p1 diff and bump up th=
e PR

Thx

=2D-=20
Khem Raj

--nextPart13032986.UpbKJhmtiy
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm3KMYACgkQHnJKy6V6em5vGwCdEEM/8jUugq+TkWvaMHiBEs3m
gvwAnjCWq+HHX3GRy4SyznBr5SoLgztG
=i4RC
-----END PGP SIGNATURE-----

--nextPart13032986.UpbKJhmtiy--
