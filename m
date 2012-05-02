Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgu6-0000xU-JE
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 23:16:06 +0200
Received: by dadv2 with SMTP id v2so509966dad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Zk8xd0VFwqubj6PojqfvF6xrU6036ytz0DY9ov8cWCM=;
	b=c3oEWu/6LlrTgCZIZexlW6SJ0kuMD7KZ2Dz1koNkI8Mzy8SunQNljTft1BWieQJ18G
	mKfnQyFRimKvX6ZPBFHMXggD+M8fGfTD9Xwg+x8OwEOACBdLSnZk9LsDZd4IwXAYaqf9
	J4IGRB5GXV2022JKjrcKZV1LgNeeRXd5tlLffbTlAS6O56zi78lhI4GgQwzccnV+GqxK
	xkhJfnYUjpmHOoyAxxgqMKr5dHlcYR6SedMtO0ZOYqwiBOzYvtAA7HsUs0d0gOCCBLqD
	MLnK22D74btVvsh7Nt8btAiES24gmD1qqxNb+0pbgMUtBgvyrGYhuzyVvdBuwq9JO5Lj
	/LOw==
Received: by 10.68.129.99 with SMTP id nv3mr688050pbb.161.1335992781310;
	Wed, 02 May 2012 14:06:21 -0700 (PDT)
Received: from [172.23.3.173] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id pg6sm2973261pbb.41.2012.05.02.14.06.18
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 14:06:19 -0700 (PDT)
Message-ID: <4FA1A1C8.3030705@gmail.com>
Date: Wed, 02 May 2012 14:06:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
	<4FA0FFD5.6080201@gmail.com>
In-Reply-To: <4FA0FFD5.6080201@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Wed, 02 May 2012 21:16:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/02/2012 02:35 AM, Martin Ertsås wrote:
> The patches posted seems to be working fine. I at least didn't have
> any problems with them.


thanks for trying them out. GCC patch is final but eglibc patch I
still got to improve that its not final version yet.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+hocgACgkQuwUzVZGdMxQqaACaAtP9rzr8vBvn/Q0MgbPvevdS
iz4AmweHf2JC/QUsBq8N5tYvHQ0a4oAG
=c3Tt
-----END PGP SIGNATURE-----


