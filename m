Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R6OVF-0002Uj-68
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 17:14:25 +0200
Received: by wyh5 with SMTP id 5so2314637wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:reply-to:user-agent:mime-version:to
	:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=ua3IGaCdPhcXL2/ZSe2POeg98ECAxvc8QnteWdRqUUA=;
	b=sF4E7iKmjiVTDi9AWy6eRPc+gR1gOox5UuN+4vtpbzONCGtz/RDVk1M2PR4j+2KjC2
	PHpvLC+M2GljV5KlnEXocNOVDpbsJwA/PxByif7mA8xBm79kI4dSZnzMSsOYlyNuAe0u
	JGK/NrtxlU0AJZiUoKWaEvxfnl2FLjDIu+1Ew=
Received: by 10.227.143.72 with SMTP id t8mr831382wbu.95.1316617746628;
	Wed, 21 Sep 2011 08:09:06 -0700 (PDT)
Received: from [10.1.20.51] ([92.103.82.100])
	by mx.google.com with ESMTPS id k26sm4230573wbo.16.2011.09.21.08.09.04
	(version=SSLv3 cipher=OTHER); Wed, 21 Sep 2011 08:09:05 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
Message-ID: <4E79FE10.4090506@blunderer.org>
Date: Wed, 21 Sep 2011 17:09:04 +0200
From: Tristan Lelong <tristan.lelong@blunderer.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316608829-30502-1-git-send-email-tristan.lelong@blunderer.org>
	<1316616039.4045.22.camel@mattotaupa>
In-Reply-To: <1316616039.4045.22.camel@mattotaupa>
X-Enigmail-Version: 1.3.2
Subject: Re: [PATCH v3] libroxml: Add version 2.1.1
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
X-List-Received-Date: Wed, 21 Sep 2011 15:14:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi,

I will correct those last problems, test it again, and I'll resbumit the
patch.

Le 21/09/2011 16:40, Paul Menzel a écrit :
> Dear Tristan,
>
>
> thank you for your patience.
it should be me thanking you for your patience


- -- 
618FE3EF
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk55/g8ACgkQFj9oxGGP4+/qrgCguZ6EfFmpZbXTe1QcANI90iro
w2cAnRB31yw+oUFG+uxp3BUxgCz+Q1Wp
=veWg
-----END PGP SIGNATURE-----



