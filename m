Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OnLhn-0007fk-JC
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 03:20:23 +0200
Received: by fxm6 with SMTP id 6so2809298fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=4GEfB9/6/Ato3EnGs9xzvUMkxmewjxCcAfsjp86o1eA=;
	b=NqDt8wffjw+kIwigRKmP9GA2VuNDy0nc6Kksta34DJIsxi/DJjngZ4C4m7scXQV9Ud
	Aq5V5CloRx8CABriOpwwh/upLKL7JCoJi6naWEyEmMddCQ12pspDf6K5w9BfrOXH42Sw
	tm9AeiEOigmW9HxzgJhIdfyofCrWuY2xk2y4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Uw7oh5N8Wp5i6cp3DYcaV+HdYwaumIqIkl1sqhS+v3OmOvvL00cswgf5MAOaZvoSrR
	iuyo+0BRkbT5lUWQ7zCEFzTRYiR1zIP3TxWQdZFSPSPldXvTfg8SqoHCYvzseluSVuFg
	Gn95JAKZOlqs+afamGhvtErKx755SL/Q2zZmo=
Received: by 10.223.114.69 with SMTP id d5mr3532150faq.43.1282526372185; Sun,
	22 Aug 2010 18:19:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sun, 22 Aug 2010 18:19:12 -0700 (PDT)
In-Reply-To: <AANLkTik=3+8CbANkqL7bikgXLLrZYdmxgJz3J1YwNsJD@mail.gmail.com>
References: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
	<AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
	<AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
	<AANLkTik=3+8CbANkqL7bikgXLLrZYdmxgJz3J1YwNsJD@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 22 Aug 2010 19:19:12 -0600
Message-ID: <AANLkTi=AqKL89Xp3LF3OPma8CK_v4y9gET=OTSWV-n1N@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] removed duplicate node recipe
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
X-List-Received-Date: Mon, 23 Aug 2010 01:20:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

I registered with patchwork and I removed my bad patches.
http://patchwork.openembedded.org/patch/2732/

Is there anything more that I need to do? Or do I just wait for approval /
rejection ???

AJ ONeal

On Thu, Aug 19, 2010 at 1:32 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/19 AJ ONeal <coolaj86@gmail.com>:
> > I created the node recipe in the last e-mail patch, but I had a leftover
> > test file that I didn't mean to commit. This removed it.
> >
>
> In that case, as the patch is not yet accepted the way of working is
> to create a new patch (v2) instead of applying a patch on top of the
> old one.
> Please also update the status of your patch in patchwork (see
> http://wiki.openembedded.org/index.php/Patchwork)
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

