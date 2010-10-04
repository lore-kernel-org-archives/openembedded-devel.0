Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2kCX-0001ox-ET
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:31:32 +0200
Received: by gyg8 with SMTP id 8so1704754gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tEUwUsXXUlYmRT50U5ew/0PBNq/t47pKa4MJq7+606M=;
	b=M0WKRHBLBHo3/cOLqJ5Gg+rNKwzapMUAFMmYe7UiEYWey5cngLNvzOmrGFdGABdL7n
	LSEvK61ohKvB+Wxe3JPkTDMIBFt0k5RxsEN7SCGlZEufVLThaGSMMp/5ePkB7Eg0t53h
	AhcNt886p7WlXppRetB3Q+ifsBA+K8joZHmlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=h9bS+488kMJrHwYUbJX21+4zOxM0aONWVyGxm7mcZAo4iZq3Is6fDgAEsq8lekl35Z
	lQOhljAGn4uTls+pyQ24pOUlSK68ZzrTqHWA+40F2L4GOUkoxiZV7g48aZsju1D7PkAn
	Wne5177glH5ilae/kATiXDgfBSuyZMCC5tL70=
MIME-Version: 1.0
Received: by 10.231.149.12 with SMTP id r12mr10082694ibv.185.1286195467957;
	Mon, 04 Oct 2010 05:31:07 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 4 Oct 2010 05:31:07 -0700 (PDT)
In-Reply-To: <4CA9C28B.3000304@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
	<1285931854-17148-3-git-send-email-obi@opendreambox.org>
	<AANLkTimSu5dVZJDbjSswaKf523NM9FfpNto=ZSq61g+M@mail.gmail.com>
	<4CA9C28B.3000304@opendreambox.org>
Date: Mon, 4 Oct 2010 14:31:07 +0200
Message-ID: <AANLkTi=FGS+ZJm6ePkrdGPaY+t6_uKbJX+Tqi8v-frVe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] cdfs-2.6.27: initial recipe
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
X-List-Received-Date: Mon, 04 Oct 2010 12:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/4 Andreas Oberritter <obi@opendreambox.org>:
> On 02.10.2010 18:28, Frans Meulenbroeks wrote:
>> Looks interesting, but pity this is only for 2.6.27 (with no newer
>> version being available) so can't test/use this.
>
> Actually, 2.6.27 is only the version of CDfs. You should be able to
> use it with newer kernels. It was tested with 2.6.32 and therefore
> contains a patch to fix a compile error with Linux 2.6.32.
>
> Best regards,
> Andreas

I'll give it a try (probably tonight) with 2.6.35 (which is what I am
using atm).
If it builds and works, I'll commit it.
Otherwise I'll get back to you

Frans


