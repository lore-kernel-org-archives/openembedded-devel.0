Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQkvb-0005hE-Ne
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 21:46:03 +0200
Received: by dacx6 with SMTP id x6so5451298dac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2012 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=3ujYBbJFcr+8rkBfcAMwTijo/RK0WoMIIdGnC+e+mqA=;
	b=tSemKS6o3C6crzhVwYxHW3KNMCSeTjg57f/usgX/8KiAKinUAeHqWotyC4QXyKh/Qf
	a7gzkPU4ATWRnChjeseeWK7yIX8KRgu4NfzVqtb/Zw9B43TzZ+MsClqWWu0c94NmgKvc
	H3eg8geUlrJCK+0Tk0TjfZr198n0NpExn8Kug40rtGYDy90Kuk7lA7bHzVnuLjvQv5Kg
	I1rCaWSwnEeHAenHhy1K6cqOTyp7yPSaEJjpGd1QOXzyAf3DFdg9FsMxiMBEg9V6eWQC
	yC3PirKbdxIKFes31eg1ZzkmoMXOPR+mniu9WifNg8pF8DXL6jDruQ2Sl0C3Q2poKCxF
	MYlA==
Received: by 10.68.132.201 with SMTP id ow9mr30409186pbb.160.1336246574545;
	Sat, 05 May 2012 12:36:14 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id iv10sm273364pbc.56.2012.05.05.12.36.12
	(version=SSLv3 cipher=OTHER); Sat, 05 May 2012 12:36:13 -0700 (PDT)
Message-ID: <4FA58128.7030906@gmail.com>
Date: Sat, 05 May 2012 12:36:08 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1336237032.22405.2.camel@localhost.localdomain>
In-Reply-To: <1336237032.22405.2.camel@localhost.localdomain>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sat, 05 May 2012 19:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/05/2012 09:57 AM, Priit Laes wrote:
> include/asm/arch/uncompress.h:20:20: warning: conflicting types for
> built-in function 'putc'

what version of binutils+gcc is in play and which version of kernel is
it ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+lgSgACgkQuwUzVZGdMxRFwACgg6DMdhmtvMgfW6i8hKKEY8eA
ZF4AoIsYfuNkJ6yo9Iu7vvkR9jMFpcFv
=jkVY
-----END PGP SIGNATURE-----


