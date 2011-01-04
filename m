Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PaGLR-00041j-OZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 00:31:13 +0100
Received: by wwi17 with SMTP id 17so14928153wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 15:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=5NMCLHqUNHQ9ewIPLl/b2tE5D3Tl6tchlbCajB+X3vE=;
	b=wGkGxZVUnGpS95Xxbcn+NeVqqssIouLVVOiN59Ki9W82lRo6FZCU8kIAv4Ohts5yKH
	jjofyrKnrpO5TVSusQjCOqi/vyvcjztIcxzXzQHBgWiP1rYIxMayCi7XXX1EdY2Lacg8
	U4N6gwRTS2vGD932bbBkm577+XWLM3VrqCfpQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=f7NEadrIAorrtzUgygjuu0oUmzvDqw2frHfkEQfRP0loTNzu9hsbyoyZbOIKL1G+02
	FSvEy6pFCLkOND4o+8aX0eYLpp7cTa8XkHiAoS2bwwx885loT18tgH3AFSfmRHvZSWtg
	8kbOirjeD4+2Wpcuc7wBpCuHB7MNuLQgygfLw=
Received: by 10.216.155.75 with SMTP id i53mr16381312wek.27.1294183849170;
	Tue, 04 Jan 2011 15:30:49 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 4 Jan 2011 15:30:29 -0800 (PST)
In-Reply-To: <1294183063.17519.22104.camel@rex>
References: <1293763348.17519.11220.camel@rex> <1293805474.18787.366.camel@eha>
	<1293911357.17519.17117.camel@rex>
	<AANLkTi=YuEBqPtCGnutaW_-JF0F=ZwmT8OS8rCmr9886@mail.gmail.com>
	<1294155569.17519.21577.camel@rex>
	<AANLkTin0O_GYVLqi5=Q3VmLZXJPufoPmH+WgcFHSEY8Z@mail.gmail.com>
	<1294183063.17519.22104.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 4 Jan 2011 16:30:29 -0700
X-Google-Sender-Auth: 5tPVOakDkNYRSdcNhJaoln_8RiU
Message-ID: <AANLkTimHLz0xCzsUBQB0ThSO9hWAmGE=ddCmniVWHp-1@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [Bitbake-dev] Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Tue, 04 Jan 2011 23:31:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 4, 2011 at 4:17 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> I'm also going to look at getting back the XMLRPC interfaces and
> abstraction that the removal of triggered this discussion. There does
> appear to be some differences in opinion on the future of bitbake from
> the server/UI perspective and I will do what I can to ensure we all have
> common goals.
>

To clarify, the abstraction is not gone, only the server is.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


