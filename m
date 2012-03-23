Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB6DN-0005qE-Un
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 16:15:42 +0100
Received: by lagw12 with SMTP id w12so2502756lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=IJwewyyhS3oXJmG1kcN/+uDnUpWPB3dsu3rt6fgLaf8=;
	b=0NXzkMLiYu6o5Dq4OExh/pm2MGLWzQxFM2HKDIEOnKO0+9uK9lfoQtFcSbcEemRP6r
	bEcKvXTm9UDb6KjnIw/iAQ5Ks3hXdA7fNyuMpoqptoCBx1k57VGmOO8dKWiGRMSNQzSO
	Wf8CKTgUJbxWJgwNrDHHPJwMpaDdw35/Ks+Ygnp23MboeOg3jvJoZyP/XbhQ+IuaBmYI
	lWk+vLXMUl7q0jsrKQzMiLqHgFL9QPaQ/n2E4ZLtOueIeCnMSLiFse76ttD/Z1ilKABg
	G53rMV7CN0XDQmh2J13o+gy0eacQXO/QiDNFI6OpDhu9nW+unjK3mu+rAKarOFJbB5zn
	jPgA==
Received: by 10.152.102.228 with SMTP id fr4mr9034648lab.23.1332515205729;
	Fri, 23 Mar 2012 08:06:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Fri, 23 Mar 2012 08:06:15 -0700 (PDT)
In-Reply-To: <CAMKF1sq742W527ubkcaqyOu5uQ_hDD4ijSHdKq8CeFZKFs5i_Q@mail.gmail.com>
References: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
	<20120323140606.00eb484a@eb-e6520>
	<CAMKF1sq742W527ubkcaqyOu5uQ_hDD4ijSHdKq8CeFZKFs5i_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2012 08:06:15 -0700
Message-ID: <CAMKF1spjKz_vGs1=3Yz3230mvBL3nhV4+GVSGJEAnBNYH4W_PA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Fri, 23 Mar 2012 15:15:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 8:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 23, 2012 at 6:06 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote=
:
>> Le Fri, 23 Mar 2012 08:24:14 +0100,
>> Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :
>>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> Acked-by: Eric B=C3=A9nard <eric@eukrea.com>
>>
>
> Looks good now
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Koen

While you are at it I think eglibc 2.12 should either move to
toolchain-layer or to meta-angstrom layer I dont know if there are any
other consumers of eglibc 2.12

-Khem
other than angstrom


