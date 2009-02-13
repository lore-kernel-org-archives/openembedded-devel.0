Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LY7dh-0005CP-1G
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 00:40:09 +0100
Received: by fk-out-0910.google.com with SMTP id f40so749502fka.12
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 15:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=AnHfVNKGHfxn8YBGjecthUMpPq7H/uS2imp6lae6ilI=;
	b=LJIVH0yR/7nhKp/rpBiU/fATdrFkHGqWxnhZ95264ClORtZtA096t4p5R9NMbvbxXz
	Au5mnzdgEt4K4P3m1SV0WyNtFpw2iX9EYzZsxuqbkpYzoxQa4Uf4czCowlulbzXXrZ3W
	zppA6uTpZjpTaB9zMqAx/o5mZ2CvKl8CSXc20=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=sR3613bI6Jd5Vf7E2yn1uAsqJYmE9bjA6+4Hw5stOIpP54hnezamA7NNWKYKCXZNgH
	y0IHG5udQKJ4yyJ/ABwNYsITPvlOKxkBcBeaXOPz2fFwXhIdkcEVvMMfk4V2BLTHs6Mj
	BEfSC0+0Ia2Jpaifok67uekWSNiwDDR+B8wKo=
MIME-Version: 1.0
Received: by 10.181.139.10 with SMTP id r10mr48395bkn.11.1234568320069; Fri, 
	13 Feb 2009 15:38:40 -0800 (PST)
In-Reply-To: <gn3d3v$um5$2@ger.gmane.org>
References: <200902121727.21796.roman@khimov.ru>
	<c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
	<gn1j5m$qc5$2@ger.gmane.org> <200902130952.52664.roman@khimov.ru>
	<gn3d3v$um5$2@ger.gmane.org>
Date: Sat, 14 Feb 2009 00:38:39 +0100
Message-ID: <c384c5ea0902131538o47bbbfa1oed7415d40d58bbbd@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Fri, 13 Feb 2009 23:40:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Fri, Feb 13, 2009 at 10:05 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 13-02-09 07:52, Roman I Khimov wrote:
>> So, if anyone cares enough to commit? ;)
>
> AIUI Leon wants to give it a spin first, but you have my +1.
>
Hmm, if it is broken currently, and now fixed and tested by you, +1
for committing it right away.
I can do this tomorrow - but beware...

I'm not getting around to fulfill my own wannado's, didn't get around
to test icecc today.

Well, I just finished installing 'bob' the build server, might as well
deploy icecc on it.

Regards,
-- 
Leon


