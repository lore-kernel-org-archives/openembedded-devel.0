Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OTeSq-0003JE-Up
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 19:19:17 +0200
Received: by fxm12 with SMTP id 12so944357fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Tkw1JFn3S4LjGot/YpsfmhzeVlRyHo9qZPl/tsrqa2w=;
	b=qqDBCpFTSqOM3dOHF2LJRffWDqpiyf0i40wYlOKqFEo5vAnuey5DINLpEK9bOwyb8B
	O1xxCXoPUW/Zp+tWvPPSsxpjwwNQlGdzRo8NCkKMaHcPZyt1mcZi1RrNfYFJorlG8kzn
	9wVYP/I2CFR5xDSON8FQKdUV26YEdShHqe0+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VE2w1n/GwQxNs2v+6pBHS1KaoIKgMj7YSm/cC67f80N4AQiYwO59atme/hFH9a+ayl
	QCE/M9TH/EpvnSiJM7bCBkdwHKUrHPOd72CNP5tnrjP2RA4Y95YwJGOaojhwhh2usMGM
	1W/jE3yih2qZTeGgGf+/2hXbGZDpeHh7ar3Dw=
MIME-Version: 1.0
Received: by 10.239.189.7 with SMTP id r7mr434766hbh.53.1277831673888; Tue, 29 
	Jun 2010 10:14:33 -0700 (PDT)
Received: by 10.239.182.83 with HTTP; Tue, 29 Jun 2010 10:14:33 -0700 (PDT)
In-Reply-To: <022f01cb17ad$d433b290$7c9b17b0$@Distant-earth.com>
References: <alpine.DEB.2.00.1006291005050.10428@lynx>
	<01fb01cb179c$580068f0$08013ad0$@Distant-earth.com>
	<AANLkTilMht97znPOunP0dTBMwE6gPF1EyztWRC21MsXo@mail.gmail.com>
	<022f01cb17ad$d433b290$7c9b17b0$@Distant-earth.com>
Date: Tue, 29 Jun 2010 10:14:33 -0700
Message-ID: <AANLkTikcPhaE4yPHlnjfxVSFYIu4jx4sE1AEa5OaMl2i@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: so ... what's the proper way to report a build failure?
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
X-List-Received-Date: Tue, 29 Jun 2010 17:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you very much for that!

any chance there is a good tutorial or something along those lines for
writing your own recipe for installing a program onto your platform? I have
tried the helloworld tutorials on your site and the gumstix wiki and I am
not having any luck in getting it to work for an actual program, I am trying
to get metasploit to compile for the gumstix overo fire.

On Tue, Jun 29, 2010 at 10:09 AM, John Willis <John.Willis@distant-earth.com
> wrote:

> > The wiki link for me had nothing on it, I have been wondering the same
> > things myself.
>
> http://tinyurl.com/dl2na8 the link gets line-wrapped by my mailer (or the
> lists ;)).
>
> John
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

