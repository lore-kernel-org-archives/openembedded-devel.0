Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlzcH-000153-4x
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 09:32:50 +0200
Received: by gwb15 with SMTP id 15so575937gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CaM/ZJusVgMqkoYN0SGeaLuu6LreDURowCWInyXj1fU=;
	b=vfdgzGaX6f4+nqiZUZ7Fysgj00K7JexPycfh5TeIPZx1kiboeqwIpVOQCcJQyor2aV
	sssFM3EHczYu4Vsb193F0SSA5kmGLuXDT89l27Ii/enJKrFsWiiEPAKkFsjqRYQFMMNG
	g9uuB4AZLYa8Nxsg4BunjFyVGf/6PiIRAL6GE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PRst20RtxXrNwkf09MXcOFfcWBwoMsRwyjLevu8p9w7Dh+xXQSAoAcmOMNtZPmE3ld
	vK0zNkuMJZL4uV2WRhEfRnK90lqoArOeJGlEMAUXUm/co0g0GZBj20MexBYh+bO8iVWs
	7iAk/cudDIgQyMLXjMlFSDNnc2dAOWQzjTURc=
MIME-Version: 1.0
Received: by 10.150.73.3 with SMTP id v3mr1458505yba.362.1282203148629; Thu,
	19 Aug 2010 00:32:28 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 00:32:28 -0700 (PDT)
In-Reply-To: <AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
References: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
	<AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
	<AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
Date: Thu, 19 Aug 2010 09:32:28 +0200
Message-ID: <AANLkTik=3+8CbANkqL7bikgXLLrZYdmxgJz3J1YwNsJD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 19 Aug 2010 07:32:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/19 AJ ONeal <coolaj86@gmail.com>:
> I created the node recipe in the last e-mail patch, but I had a leftover
> test file that I didn't mean to commit. This removed it.
>

In that case, as the patch is not yet accepted the way of working is
to create a new patch (v2) instead of applying a patch on top of the
old one.
Please also update the status of your patch in patchwork (see
http://wiki.openembedded.org/index.php/Patchwork)

Frans


