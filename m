Received: from cortex1.nebelhauch.de ([213.133.111.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian@whisper-net.de>) id 1Q4gIL-00077z-Vi
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 23:17:46 +0200
Received: by cortex1.nebelhauch.de (Postfix, from userid 65534)
	id 7B6C4E6B82; Tue, 29 Mar 2011 23:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	cortex1.nebelhauch.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=unavailable version=3.3.1
Received: from localhost (localhost [127.0.0.1])
	by cortex1.nebelhauch.de (Postfix) with ESMTP id 42E23E6B81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 23:16:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at nebelhauch.de
Received: from cortex1.nebelhauch.de ([127.0.0.1])
	by localhost (cortex1.nebelhauch.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id GXtvoopyorxe
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 23:16:38 +0200 (CEST)
Received: from [192.168.178.27] (koln-5d813d89.pool.mediaWays.net
	[93.129.61.137])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by cortex1.nebelhauch.de (Postfix) with ESMTPSA id EF3CDE6B28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 23:16:37 +0200 (CEST)
Message-ID: <4D924C04.2030009@whisper-net.de>
Date: Tue, 29 Mar 2011 23:15:48 +0200
From: Julian Pietron <julian@whisper-net.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.7) Gecko/20100713 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
In-Reply-To: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
X-Enigmail-Version: 1.1.1
OpenPGP: id=D8407950
Subject: Re: do_compile of gcc-cross-sdk-4.5 fails with -mfloat-abi=hard
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
X-List-Received-Date: Tue, 29 Mar 2011 21:17:46 -0000
X-Groupsio-MsgNum: 30708
Content-Type: multipart/mixed; boundary="------------060702050203060106060208"

--------------060702050203060106060208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Also fails with release-2011.03, same errors.

Best Regards,
Julian
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJNkkwDAAoJENidYKvYQHlQm14QAKRLhG/PL9ApQskmMhbUXXMk
B9/s5lFjlrZHl/sMjh5fPDOMsYJkZHklMf1lb3eP0Xi3O/Vg7jE4ts7+lHPCwlds
baMMGaqktgZnMVxxfMM3tcmo2FPjPQDDjveoLokTYv3F55zYItfqm2/+y35+Yhbw
SVq+3Uqjc2F3a9G+grbViCnqdXlCm5EiQjPWrHziNhmZRNr28qCyHkTVmyQ1RNJQ
EpIaz8YZx3N2+7AUQyci6OdeZ+P6K9ehx86DPga/gpOYJ9PIdmFz+2ORck18RotH
xWws/GUlZaxcwKv2HeWTOwYWY1Tn1Lb5ijucBSU64+qQ+pHlpua2kVnuJ2oCem0P
Jl+4DwaSr5dOjMAI8FHg5wDNqX4vbTKpMOEV/4Kb7DB/srbejcdbtjheIdB/KInG
0GB+y/A40neXwM5WJX0o/YyqyFmjfqmHqgcfp/R0WP6DaCIN7qjPSUxsYNUoUyBk
2Q6bcUoTxeni63Fk4anNxxJVQy6qgpVI8UQVb0QB6phcfid9Dadts+MnKPwp0D8R
QqQG4GF2xo9NOq77oI6U65aLDwyQZBWzLG9JRWsHZm4WHM+MiIcEB+fl7ctqRpjG
/UIlCBs66Ptw08RJooGNoWHhvRJyJ6wrmOSM+eKVgbh83QXqrnqELGNDP6YQvg06
pElED6adUooPXQf0CdNP
=ncrm
-----END PGP SIGNATURE-----


--------------060702050203060106060208
Content-Type: application/pgp-keys;
 name="0xD8407950.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0xD8407950.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.16 (GNU/Linux)

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
4ubwdCGH3juU4cDGmmH0aU19rJeZH5V6LWIModb6VRnKE17mVknuq3OEyp+KByPo
ih8b3klFbjxrHC+6wGo6K6uTzmjDmMMrbodOiVwppvi3tWt1gdya2VAdK0csl6rq
mFbiFHIKxCeRMAxw9CNDWg8hVYtbLdL8cyIQS1YxAH+k/fg+jSd3w/Y/eQyBXlau
y7ZQ3RNIPdYFd82nQpXwbD+t+Fifiifz93qNra/st7SSJQd76z0QvsMV4rfIb21c
UvlK+aGjeXgAv3d/7I6qkN0zFpQvTsHJH5FySQVhsLQwSnVsaWFuIFBpZXRyb24g
PGoucGlldHJvbkBjb3J0ZXgtZGV2ZWxvcG1lbnQuZGU+iQI+BBMBAgAoBQJL+n0z
AhsvBQkDwmcABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDYnWCr2EB5UDOG
D/0fp6DeDzsSfI9qBY212uOT9p+mB6dAVzyXpUC1DH2ZVLdkYK7h14v47cwD2AUA
oxsNh7j/OeFmnnKrXpmpN9GMBpqSoIN5Mz1kCKerY4V7urWH9iwuj3yZLIXsc1ke
FdOk+QlP2lry4IJu2KdBg2uKhMQflx0VPYRWexqpP8AZBK8Tv+oyCpEJkWqjUog5
oD1JJFE4veaJAKtlD2xPi6MIwCxrE48KcGp43SZ9rk3pjHu4bHMR2F25mdodfY23
6QYGdTtWjouSKOsezOa01YkaOgqviImttpV0irknLUQdjEFa3A3tFFu8Rcs1dSEM
8hEXxFWd5vRPqR9vx2OSt9afPYOLFUNAxDvaGD4cgZnCbfhkPDFhOZvs4Yva65SA
nF2tVZPiQuEfYflliLCwHd5ycyNJ9RLIrTmAOrlHM2TucqJN4rRVLvhAr4Hba8KH
4uxyugNXNhRnzW2lXuQ9WoAuLtpBF3Nmo/rnEy8ON74fs5EmnGY+oJrpmDbS4S/c
5HLxkPYDIdQm6MjIcOrtUVlAev7ZVa5FPiLyT+kWi7bdq6GQdJ/pIJkWRAR8Y3sH
uSp91cdWmlOUXxp+XeisyGIq1tK4L9uEOEl6nAb84pYLz7jb1Ow1pP1EiC8/q9df
S0ZL1hwDHhY5SPAOuSHgTrmfkctsrvokOJ8FTqi84/xMprQuSnVsaWFuIFBpZXRy
b24gPGp1bGlhbi5waWV0cm9uQHJ3dGgtYWFjaGVuLmRlPokCPgQTAQIAKAUCS/p9
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
/XXpJKZja1TVQc43e7NLRyTSmWBMjTUE0nA=
=H030
-----END PGP PUBLIC KEY BLOCK-----

--------------060702050203060106060208
Content-Type: application/pgp-signature;
 name="0xD8407950.asc.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0xD8407950.asc.sig"

iQIcBAABAgAGBQJNkkwDAAoJENidYKvYQHlQmgYP/RRt9RObmR+cbXUFY4xSxM7Uhq75axNk5vZQ
bxg+fQ1iB2g9cNbTBI41j4a/oVnhOmbcAnoO68pbnj9Fi/QB7SqkHtvJwyQAjF7IQaq0PpTQtzb8
3g2UU9cuBlvYgVKHc6mXHzf72ybD3XQdItpkI02iiCQGWSpnGMMfELvl0q1IpPGeuj5gXreWlxiH
LwNQdrj3W+riKPwgXKbuB+3rqa2sNTg6391pBj8rMF4OPxpMKPS7G0M6SXi65AjpI0qV38ogTNSK
nnkEAtU+/ljs8JBIcCN7FOUIzog/vzqMUrx1cysGVx4mbuYm5cksCCOajtPt1P92CdkWvsuqP+jF
q2rexYfgiOg9uaGYLmx2Qg0hy9hFPIZA7/3oHG++XdtIenTSu2oaIurLtJ9VGF6bQ/qVCxwPhTi+
mpTxUZ0umYoJkevelEShp+4CM7FIg+6umErGr+5+6cN4DfnOgX1C0Os7SxyigSRjt8WYc7Bch3k+
sdY5RhAIn/JLcoDaoEyGheJJWpTW0DbDL9IkaB9cUU2porTd0K5AScbP3VsX2DMK9ubZQi5helAd
DGwPmoeB/QW7YvFAdMXs2n/OWDPQ5ociYx+8GZfZwEsKyRWGhLb/mybOrYelK+lWPF2UwC0r1aXl
0iNbvjiuyZiLVu9ce90AthZ39SnTcHOxjZPKP1o4

--------------060702050203060106060208--
