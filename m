Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GuEZ8-0004Ak-4n
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 21:49:30 +0100
Received: by nf-out-0910.google.com with SMTP id l24so314967nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 12:47:54 -0800 (PST)
Received: by 10.49.107.8 with SMTP id j8mr1822042nfm.1165956474156;
	Tue, 12 Dec 2006 12:47:54 -0800 (PST)
Received: from CUBE ( [82.193.96.237])
	by mx.google.com with ESMTP id y24sm4365283nfb.2006.12.12.12.47.53;
	Tue, 12 Dec 2006 12:47:53 -0800 (PST)
Date: Tue, 12 Dec 2006 22:47:55 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <26264111.20061212224755@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <457F1191.2050208@dominion.kabel.utwente.nl>
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>
	<457F1191.2050208@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2006 20:49:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Tuesday, December 12, 2006, 10:31:13 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> pfalcon commit schreef:
>> removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE. 
>> * Suggested by Marcin Juszkiewicz

>>  Proposed by:    Koen Kooi
>                    ^^^^^^^^^
> If you're going to sneak in that commit when I'm offline at least have the decency to
> notify me explicitly, so I know to do push the removal cset.

  Well, I don't sneak anything, that's nothing but indeed a concurrent
(or close to concurrent) update. As commit message tells, that move was
suggested by Marcin in a private mail. And yes, I wanted to cc: you,
but after all, I thought that he speaks as OE maintainer too, so you
likely have that communicated already.

> You're free to re-add the fixed version that doesn't break apps depending on bluez-libs,
> but not the broken version.

  I'll probably will eat my dogfood of maintainer of a bit bitrotted
stuff, and won't put outdated stuff back, but will look into
upgrading OPIE to bluez3, when I get to that.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)

> iD8DBQFFfxGRMkyGM64RGpERAsFGAJ9mjlQhjzqkHdgyyXng4EsMeE4YZwCcDsyf
> /c2lRE3VVUOLqlXbnhz9beg=
> =y1bm
> -----END PGP SIGNATURE-----


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



