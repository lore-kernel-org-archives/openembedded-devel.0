Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SASvr-0001vM-Tu for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:18:59 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SASnF-00039P-85 for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:10:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:10:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:10:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Mar 2012 22:09:58 +0100
Message-ID: <jkdg34$om0$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 21:19:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-03-12 15:17, Samuel Stirtzel schreef:
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>

OE-core needs to slim down, not get fatter. You are basically saying "layer
suck, let's move back to oe-classic"
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPakOkAAoJEHZqAkdh1vT6zyQP/R7/viIEf4trbFzR3ZaD2cRd
D4U4q7eDF5DM/fC85yoLBj7byBfryB/I2JWDir9YOAcGgaBysvpL5vApTWFt1hJZ
MOc3NFNdIsALL/jnMzjmY4OB5bIAYHj4nC0XGiRj6CuEvkyz6IueAAR3k2O6NU64
L32Ou0iGD0GKg6gl8LSBfixVKYAjIFfehP5rWv1L0P7cJiYmVy4Gj7CalmmRpPZz
zMhmwoUze4dIx9z6X5WSIXs44aBOFs3MZjtYRfBQsUDkjBheLWI5tMIekhFX0Ega
wKjU9GUwerPzI0oI2DG+9n7nS1wlBJesrHAQKh3pwCWRC19NQuqFjArdaF80DwPk
ZHZNnTzB5Dd/NbPcSkRG5V0DAFYB54Xty6A2w7ONbPoQs5h3vjS4g8V560Kvgqaa
O/efrZi2VgYA/1RAaz7COjNkMF/OBeH9aE9oRNPweOBYcwMFzhbrTEXPUL/pZ7gg
5oI0JdJj5lmqi6q9+jk8hDVJvYIkM45l9xqy6nDnIa0tUnDTzCRxj+jr7LEyPp/R
p+/6GO5aPG8S4JPbmgFbmJN7hrLzNyg6JS962VVYiOhw0cIVwkj/hX+9oYPE4pRe
AHXoBtWrfflkL4RIadYI64uMJHNpHzfuzd6+0JljL8sA969nh36GXsd4OwMdUx6b
AVqAIeCDYo30C3i9BXRL
=1Xye
-----END PGP SIGNATURE-----



