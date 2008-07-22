Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KLPG2-0003vH-G6
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 23:18:54 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2160461rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=S0+OtLtGfrZIWAfOFsVQZfTSQRWy1qC/oqCLlt2QvkA=;
	b=VmGrcG0U5DdTvYMJLRFqQsLeJrlaq74hSxqp1o5FYTYqMRIxqB9BwrtxNBDNnk10+Y
	YtT9NOma2JYnhoOXDKXkuQK89lXPl+StOfLPoavtA9qotVTY5Lz9IuZRCZiZSiZoZ8Pi
	wQHVpUsRyh/U9Dt+zvn+XEb9drJmbgVQDhkJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=a8B1jJyQWfSNrfE72AjSOm5ia74qZ5K6ZpFXDveVtpT+Fa8XD/cWFifl+wuConlzEt
	yksPJhvw8hDccKYi0QYNpfX47tj0+9/djl7RJ/LcBZJZohzWCNskP+4Y0v4QhnJ7pmlQ
	udPyGyDAzcF++rbiUZahEm5eHR2lMHhwrBV+E=
Received: by 10.140.170.12 with SMTP id s12mr165685rve.83.1216761465443;
	Tue, 22 Jul 2008 14:17:45 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Tue, 22 Jul 2008 14:17:45 -0700 (PDT)
Message-ID: <d2b9ea600807221417j8f33dbfp1da7bfbce4868611@mail.gmail.com>
Date: Tue, 22 Jul 2008 23:17:45 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <488634EA.4080001@balister.org>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
	<48862F74.70504@palm.com> <488634EA.4080001@balister.org>
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 21:18:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 22, 2008 at 9:28 PM, Philip Balister <philip@balister.org> wrote:
> The point that OE should make it easy to create and maintain source mirrors
> is a very good point. What support exist in OE today? (I use Angstrom, so it
> just works for me :)

Perhaps the Angstrom autobuilder could be stripped down to
sourcemirror tool, which could then be used for easy setup of
sourcemirrors for any OE based distro wanting a stable development
environment.

/Esben


