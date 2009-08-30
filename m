Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MhYiq-0007Rz-Nz
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 02:56:44 +0200
Received: by fxm24 with SMTP id 24so1201051fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 17:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AIbJNCJkGM5CyCsZJGrSXEERirBkpPr9Gl1uIBu2mSc=;
	b=KamQv2tyvwZBCtq7bfVopBjjCyzOY1QrgSdyovka++PlQpqYE+kpmqJ15knHrWxzsR
	C6aKDmOci4TL6lVenMzX3Nc07q/ZE7HNc1ze7NA5wz7uk/HLdSoAXTahQGUxgE31vIS0
	iwS/XTPOS2sLN7HzTRURNdDitNDqzHxbBWJ4w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=J/ccXJ5iLgyXnu44Le3PP10SR89TdiQnomnXTPPojfJkFGSvjSQqjH8NgmaHlRRP59
	xSsRYyVoFdScEsYBJVRpWSHLmA02qkKRPDqamJi3gsSv/bQ/XC+KNP3+NPtMLChkrMY3
	LaNzA9acY1Q+ocG1psCv7LpjCBwSuF2lumISs=
MIME-Version: 1.0
Received: by 10.239.163.199 with SMTP id q7mr282126hbd.29.1251592702741; Sat, 
	29 Aug 2009 17:38:22 -0700 (PDT)
In-Reply-To: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
Date: Sun, 30 Aug 2009 02:38:22 +0200
Message-ID: <c384c5ea0908291738h4cbae2e3y12ad5956a77cbfcd@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: srctree & gitver
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
X-List-Received-Date: Sun, 30 Aug 2009 00:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Chris,

On Thu, Aug 27, 2009 at 4:05 AM, Chris Larson<clarson@kergoth.com> wrote:
> I'm going to summarize the features of the two classes I've created
> over the past couple days. =A0I believe that they will make the lives of
> app & kernel developers much easier when dealing with bitbake/OE/MVL6.
>
Thanks for the extensive description and examples.

Indeeds this looks like a time saver for many.

Regards,
--=20
Leon


