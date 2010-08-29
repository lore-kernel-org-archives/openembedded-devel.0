Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OpjIm-0007O9-C4
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:56:09 +0200
Received: by wyg36 with SMTP id 36so5259717wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VGOkxdC9XJX79TB0pN4kLnXXNIYQXIpTnnvrm0jbiZs=;
	b=JVw9MvZqM9JGNDFv+uthsJVZexpWHC00Gb6KqIns6qFWyNaKiyv1xqc3J3e46gyTCo
	ILeAW1AIYDhElcMUHDqYzDbMTsnbiMNa6vDUm/M3SW3XLPolQrfHN/QkB8Gzzy7oMvzW
	7InnOWb8eLmydOlSvyU8zpo2pir6qwqvOs3kA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RVrJT26A7XdgRgrXR1IW4sH9595uk8qQA+yO1Yu8+HvqfkBsnfzA/ShX/lG9XkIrgk
	NuUX7jL+52E3XmYWqgolWd7CSCz1iKqpmSr1XbidpYN2L6lTX9UHKFsSpcCbfgLNYL2u
	tUnzz4vErcyHYvVcgqmlHS5V79Yl7dNqGu1vY=
MIME-Version: 1.0
Received: by 10.216.38.20 with SMTP id z20mr3607391wea.108.1283093737620; Sun,
	29 Aug 2010 07:55:37 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sun, 29 Aug 2010 07:55:37 -0700 (PDT)
In-Reply-To: <AANLkTikqOjKcJGArouoVst7BxVE+82_VyZ8hS+KqcCD6@mail.gmail.com>
References: <AANLkTikqOjKcJGArouoVst7BxVE+82_VyZ8hS+KqcCD6@mail.gmail.com>
Date: Sun, 29 Aug 2010 07:55:37 -0700
Message-ID: <AANLkTine9b-E1ueo0Ye8xLL6Lb7+BmwtP1-yG6WZhY4z@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-4.3.3 DEPENDS on gettext
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
X-List-Received-Date: Sun, 29 Aug 2010 14:56:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

I notice that message in a bunch of packages that build on my system.

On Sun, Aug 29, 2010 at 7:32 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> can others review their logs for similar messages on GCC:
>
> NOTE: Gettext required but not in DEPENDS for file
> /home/leon/sandbox/ccm/topha/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/gcc-cross-initial-4.3.3-r16.1/gcc-4.3.3/intl/configure.ac.
> Missing inherit gettext?
>
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


